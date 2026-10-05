# Project Guidelines & Agent Instructions

## Prototype Creation Workflow via MCP Stitch
1. **Design System Adherence:** Always refer to [`DESIGN.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/DESIGN.md) for color tokens (`#0b1326`, `#111827`, `#171f33`, `#0ea5e9`, `#f43f5e`), typography (`Inter`, `JetBrains Mono`), and component patterns.
2. **Stitch Tool Execution:** Use MCP Stitch (`create_project`, `generate_screen_from_text`, `edit_screens`, `get_screen`, `upload_design_md`) to generate/update prototype screens.
3. **Review & Fix Cycle:**
   - Inspect the generated HTML/screens against `DESIGN.md`.
   - Ensure Human Control principles are met: explicit expectations, clear evidence/uncertainty, user agency, and instant recovery back to the main lab.
   - Refine and iterate using `edit_screens` or code edits until layout and interactions perfectly match `DESIGN.md`.
4. **Local Pull & User Flow:** Pull the screens into local interactive prototypes (`prototypes/` or root `index.html`) so testers and evaluators can run full interactive flows without dependencies.

## Human-AI Interaction Gates (VinUni AIA Day 18)
- **Gate 1 (Evidence Continuity):** Ground problem hypotheses in empirical observations (Day 17 interviews with Khánh, Khuê, Thương, Linh).
- **Gate 2 (Meaningful Options):** Options A, B, and C must share the same user, situation, task, and outcome, but use fundamentally different mechanisms and human-AI task divisions.
- **Gate 3 (Human Control):** Every option provides user agency, transparency of evidence, and immediate recovery/exit paths.
- **Gate 4 (Test-Ready):** External testers can perform the complete flow independently without facilitator verbal explanation.
- **Gate 5 (Learning):** Synthesis highlights behavioral patterns, divergent feedback, Next Changes, and Still Unproven areas.
