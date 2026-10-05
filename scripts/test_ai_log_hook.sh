#!/usr/bin/env bash
set -eo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
HOOK_SCRIPT="${PROJECT_ROOT}/.agents/scripts/ai_log_hook.sh"
LOG_FILE="${PROJECT_ROOT}/.ai_log"
BACKUP_LOG="${PROJECT_ROOT}/.ai_log.bak"
TEST_TMP_DIR="${PROJECT_ROOT}/.test_tmp"

echo "=========================================================="
echo "🧪 Running Test Suite for Antigravity AI Log Hook"
echo "=========================================================="

# Ensure directories exist
mkdir -p "${TEST_TMP_DIR}"

# Backup existing .ai_log if present
if [[ -f "${LOG_FILE}" ]]; then
    cp "${LOG_FILE}" "${BACKUP_LOG}"
    echo "📦 Backed up existing .ai_log to .ai_log.bak"
fi

# Reset .ai_log for test
rm -f "${LOG_FILE}"

# Test 1: Direct JSON input with model and prompt
echo ""
echo "🔹 [Test 1] Simulating PreInvocation payload with explicit prompt & gemini-3.8-flash..."
PAYLOAD_1=$(cat <<EOF
{
  "conversationId": "test-conv-001",
  "workspacePaths": ["${PROJECT_ROOT}"],
  "modelName": "gemini-3.8-flash",
  "invocationNum": 1,
  "prompt": "Nghiên cứu nguyên nhân thành công của NotebookLM Audio Overview"
}
EOF
)

OUTPUT_1=$(echo "${PAYLOAD_1}" | bash "${HOOK_SCRIPT}")
echo "Hook output: ${OUTPUT_1}"
# Verify stdout is valid JSON with injectSteps
echo "${OUTPUT_1}" | jq -e '.injectSteps' > /dev/null
echo "✅ Test 1 hook returned valid JSON."

# Test 2: Unicode Vietnamese with special characters & gemini-4-argon
echo ""
echo "🔹 [Test 2] Simulating payload with Unicode Vietnamese, multiline prompt & gemini-4-argon..."
PAYLOAD_2=$(cat <<EOF
{
  "conversationId": "test-conv-002",
  "workspacePaths": ["${PROJECT_ROOT}"],
  "modelName": "gemini-4-argon",
  "invocationNum": 2,
  "prompt": "<USER_REQUEST>\nPhân tích chi phí cận biên TPU v5p/v6e vs GPU H100:\n- Tiết kiệm 33x năng lượng\n- Token output trần 1M\n</USER_REQUEST>"
}
EOF
)

OUTPUT_2=$(echo "${PAYLOAD_2}" | bash "${HOOK_SCRIPT}")
echo "Hook output: ${OUTPUT_2}"
echo "${OUTPUT_2}" | jq -e '.injectSteps' > /dev/null
echo "✅ Test 2 hook returned valid JSON."

# Test 3: Prompt extracted from a mock transcript.jsonl
echo ""
echo "🔹 [Test 3] Simulating PreInvocation reading prompt from transcript.jsonl..."
MOCK_TRANSCRIPT="${TEST_TMP_DIR}/mock_transcript.jsonl"
cat <<EOF > "${MOCK_TRANSCRIPT}"
{"step_index":0,"source":"USER_EXPLICIT","type":"USER_INPUT","content":"<USER_REQUEST>Reverse engineer chiến lược Flash nhịp độ 106 ngày của Google</USER_REQUEST><ADDITIONAL_METADATA>some-metadata</ADDITIONAL_METADATA>"}
{"step_index":1,"source":"MODEL","type":"PLANNER_RESPONSE","content":"I will analyze this"}
EOF

PAYLOAD_3=$(cat <<EOF
{
  "conversationId": "test-conv-003",
  "workspacePaths": ["${PROJECT_ROOT}"],
  "transcriptPath": "${MOCK_TRANSCRIPT}",
  "modelName": "gemini-2.0-flash",
  "invocationNum": 3
}
EOF
)

OUTPUT_3=$(echo "${PAYLOAD_3}" | bash "${HOOK_SCRIPT}")
echo "Hook output: ${OUTPUT_3}"
echo "${OUTPUT_3}" | jq -e '.injectSteps' > /dev/null
echo "✅ Test 3 hook returned valid JSON."

# Test 4: Verification of .ai_log contents
echo ""
echo "🔹 [Test 4] Verifying .ai_log file structure and contents with jq..."
if [[ ! -f "${LOG_FILE}" ]]; then
    echo "❌ Error: .ai_log was not created!"
    exit 1
fi

RECORD_COUNT=$(jq 'length' "${LOG_FILE}")
echo "Total logged records in .ai_log: ${RECORD_COUNT}"

if [[ "${RECORD_COUNT}" -ne 3 ]]; then
    echo "❌ Expected 3 records, got ${RECORD_COUNT}"
    exit 1
fi

echo "--- Content of .ai_log during test ---"
cat "${LOG_FILE}" | jq .
echo "--------------------------------------"

# Verify each record has required fields
for i in 0 1 2; do
    TIMESTAMP=$(jq -r ".[$i].timestamp" "${LOG_FILE}")
    MODEL=$(jq -r ".[$i].model" "${LOG_FILE}")
    PROMPT=$(jq -r ".[$i].prompt" "${LOG_FILE}")
    CONV_ID=$(jq -r ".[$i].conversation_id" "${LOG_FILE}")

    if [[ -z "${TIMESTAMP}" || "${TIMESTAMP}" == "null" ]]; then
        echo "❌ Record $i missing timestamp"
        exit 1
    fi
    if [[ -z "${MODEL}" || "${MODEL}" == "null" ]]; then
        echo "❌ Record $i missing model"
        exit 1
    fi
    if [[ -z "${PROMPT}" || "${PROMPT}" == "null" ]]; then
        echo "❌ Record $i missing prompt"
        exit 1
    fi
    echo "✅ Verified record $i: Model=[${MODEL}], ConvID=[${CONV_ID}]"
done

echo ""
echo "🎉 ALL TESTS PASSED! Hook functions perfectly."

# Cleanup test artifacts
echo ""
echo "🧹 Cleaning up test artifacts as requested..."
rm -rf "${TEST_TMP_DIR}"

if [[ -f "${BACKUP_LOG}" ]]; then
    mv "${BACKUP_LOG}" "${LOG_FILE}"
    echo "♻️ Restored original .ai_log from backup."
else
    # Initialize empty valid JSON array [] in .ai_log
    echo "[]" > "${LOG_FILE}"
    echo "✨ Cleaned .ai_log to ready-state JSON array []."
fi

echo "🎯 Verification and cleanup complete."
