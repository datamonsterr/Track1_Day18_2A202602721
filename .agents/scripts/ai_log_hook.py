#!/usr/bin/env python3
"""
Antigravity AI Log Hook
Logs model, prompt, timestamp, and metadata into project .ai_log (JSON format)
"""
import sys
import os
import json
import re
from datetime import datetime, timezone

def get_iso_timestamp():
    # Return local ISO 8601 timestamp with local offset
    now = datetime.now().astimezone()
    return now.isoformat()

def clean_prompt_text(raw_text: str) -> str:
    if not raw_text:
        return ""
    # Extract USER_REQUEST if present
    match = re.search(r"<USER_REQUEST>([\s\S]*?)</USER_REQUEST>", raw_text)
    if match:
        return match.group(1).strip()
    # Strip metadata blocks if no explicit USER_REQUEST wrapper
    cleaned = re.sub(r"<(?:ADDITIONAL_METADATA|USER_SETTINGS_CHANGE|SYSTEM_MESSAGE)>[\s\S]*?<\/(?:ADDITIONAL_METADATA|USER_SETTINGS_CHANGE|SYSTEM_MESSAGE)>", "", raw_text)
    return cleaned.strip()

def extract_prompt_from_transcript(transcript_path: str) -> str:
    if not transcript_path or not os.path.exists(transcript_path):
        return ""
    try:
        with open(transcript_path, "r", encoding="utf-8") as f:
            lines = f.readlines()
        for line in reversed(lines):
            line = line.strip()
            if not line:
                continue
            try:
                data = json.loads(line)
                if data.get("type") == "USER_INPUT" and data.get("source") == "USER_EXPLICIT":
                    content = data.get("content", "")
                    return clean_prompt_text(content)
            except Exception:
                continue
    except Exception:
        pass
    return ""

def find_transcript(conv_id: str, transcript_hint: str = None) -> str:
    if transcript_hint and os.path.exists(transcript_hint):
        return transcript_hint
    if not conv_id:
        return ""
    home = os.path.expanduser("~")
    candidates = [
        os.path.join(home, ".gemini", "antigravity-cli", "brain", conv_id, ".system_generated", "logs", "transcript.jsonl"),
        os.path.join(home, ".gemini", "antigravity-ide", "brain", conv_id, ".system_generated", "logs", "transcript.jsonl"),
        os.path.join(home, ".gemini", "antigravity", "brain", conv_id, ".system_generated", "logs", "transcript.jsonl"),
        os.path.join(home, ".agent-farm", "profiles", "agy_worker_4", ".gemini", "antigravity-cli", "brain", conv_id, ".system_generated", "logs", "transcript.jsonl"),
        os.path.join(home, ".agent-farm", "profiles", "agy_worker_3", ".gemini", "antigravity-cli", "brain", conv_id, ".system_generated", "logs", "transcript.jsonl"),
    ]
    for cand in candidates:
        if os.path.exists(cand):
            return cand
    # Glob fallback for any worker profile
    import glob
    pattern = os.path.join(home, ".agent-farm", "profiles", "*", ".gemini", "antigravity-cli", "brain", conv_id, ".system_generated", "logs", "transcript.jsonl")
    matches = glob.glob(pattern)
    if matches:
        return matches[0]
    return ""

def resolve_log_path(data: dict) -> str:
    # 1. Check workspacePaths from input
    workspace_paths = data.get("workspacePaths", [])
    if workspace_paths and isinstance(workspace_paths, list):
        for wp in workspace_paths:
            if wp and os.path.isdir(wp):
                return os.path.join(wp, ".ai_log")
    
    # 2. Check current working directory or upward until .git or .agents
    cwd = os.getcwd()
    check = cwd
    while check and check != "/":
        if os.path.exists(os.path.join(check, ".agents")) or os.path.exists(os.path.join(check, ".git")):
            return os.path.join(check, ".ai_log")
        parent = os.path.dirname(check)
        if parent == check:
            break
        check = parent
    
    # 3. Fallback to CWD/.ai_log
    return os.path.join(cwd, ".ai_log")

def main():
    # Safe output default
    output = {"injectSteps": []}

    try:
        # Read stdin
        input_data = ""
        if not sys.stdin.isatty():
            input_data = sys.stdin.read().strip()
        
        data = {}
        if input_data:
            try:
                data = json.loads(input_data)
            except Exception:
                # If not JSON, treat input_data as prompt
                data = {"prompt": input_data}
        
        conv_id = data.get("conversationId", "")
        model_name = data.get("modelName", "") or "auto"
        invocation_num = data.get("invocationNum", 0)
        
        # Determine prompt
        prompt = data.get("prompt") or data.get("userPrompt") or ""
        if not prompt:
            transcript_hint = data.get("transcriptPath")
            t_path = find_transcript(conv_id, transcript_hint)
            if t_path:
                prompt = extract_prompt_from_transcript(t_path)
        else:
            prompt = clean_prompt_text(prompt)

        # Log path
        log_file = resolve_log_path(data)

        # Build record
        record = {
            "timestamp": get_iso_timestamp(),
            "conversation_id": conv_id,
            "model": model_name,
            "prompt": prompt,
            "invocation_num": invocation_num
        }

        # Load existing logs from .ai_log
        records = []
        if os.path.exists(log_file) and os.path.getsize(log_file) > 0:
            try:
                with open(log_file, "r", encoding="utf-8") as f:
                    content = f.read().strip()
                    if content:
                        parsed = json.loads(content)
                        if isinstance(parsed, list):
                            records = parsed
                        elif isinstance(parsed, dict):
                            records = [parsed]
            except Exception:
                records = []
        
        # Append record
        records.append(record)

        # Atomic write back to .ai_log
        temp_file = f"{log_file}.tmp.{os.getpid()}"
        with open(temp_file, "w", encoding="utf-8") as f:
            json.dump(records, f, indent=2, ensure_ascii=False)
            f.write("\n")
        os.replace(temp_file, log_file)

    except Exception as e:
        # Never crash the hook, log error to stderr
        sys.stderr.write(f"[ai_log_hook] Error: {e}\n")

    # Output valid Antigravity PreInvocation JSON
    sys.stdout.write(json.dumps(output) + "\n")
    sys.stdout.flush()

if __name__ == "__main__":
    main()
