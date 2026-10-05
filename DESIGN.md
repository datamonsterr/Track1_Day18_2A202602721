# VLearn Diagnostic Refresher — Design System & Guidelines (DESIGN.md)

## 1. Brand & Design Paradigm
- **Product:** VLearn AI Tutor — Diagnostic Refresher (Case A)
- **Aesthetic:** Technical Precision Minimalism with subtle luminous glassmorphism.
- **Tone:** Analytical, transparent, empowering, calm, and distraction-free.
- **Core Philosophy:** High-efficiency learning workbench. Human maintains ultimate agency; AI acts as an evidence-based diagnostic partner, not an opaque black box.

---

## 2. Color System & Semantic Tokens

### Backgrounds & Surfaces
- **Canvas / Viewport Base:** `#0b1326` (Deep slate navy)
- **Surface Elevation 1 (Sidebar / Navigation):** `#111827` (Charcoal slate)
- **Surface Elevation 2 (Workstation Cards / Panes):** `#171f33` (Slate container)
- **Surface Elevation 3 (Floating Modals / Popovers):** `#222a3d` (Elevated card)
- **Surface Container Highest:** `#2d3449`

### Accents & Telemetry
- **Primary Cyan (AI Telemetry & Focus):** `#0ea5e9` (Hover: `#38bdf8`, Soft text: `#89ceff`)
- **VinUni Coral / Milestone Accent:** `#f43f5e` (Hover: `#fb7185`)
- **Success / Validated Green:** `#10b981` (Border/glow: `rgba(16, 185, 129, 0.3)`)
- **Warning / Diagnostic Gap Amber:** `#f59e0b` (Gap highlighted)
- **Neutral Text Primary:** `#dae2fd`
- **Neutral Text Secondary / Subdued:** `#bec8d2` / `#88929b`
- **Borders & Dividers:** `1px solid #1e293b` (Active glow: `1px solid #0ea5e9`)

---

## 3. Typography
- **Headings & UI Chrome:** `Inter`, `sans-serif` (letter-spacing: `-0.02em`)
  - Headline Lg: 24px - 32px / Semi-bold (600)
  - Headline Md: 18px - 20px / Semi-bold (600)
  - Body Lg: 16px / Regular (400) / line-height 26px
  - Body Md: 14px / Regular (400) / line-height 22px
- **Code & Diagnostics Data:** `JetBrains Mono`, `monospace`
  - Inline Code: 13px / 500 weight
  - Micro-telemetry Caps: 11px / 600 weight / tracking +0.06em

---

## 4. Human-AI Interaction & Control Guidelines (5 Evaluation Gates)
1. **Evidence Continuity:** Every AI diagnostic claim must cite observable evidence (e.g. "Dựa trên lần nộp bài #3 và lỗi IndexError ở dòng 14"). Never display unsubstantiated guesswork.
2. **Expectation & Agency:** The user must know what the AI is going to do before it acts. The user can reject, refine, or skip the AI diagnostic anytime.
3. **Transparent Uncertainty:** AI diagnostics must show confidence levels or evidence indicators (e.g. "Độ tin cậy: 85%").
4. **Instant Recovery:** The user can escape back to their main exercise with a single click (`ESC` or "Quay lại bài tập") without losing any code or state.
5. **No Blind Roadblocks:** If the diagnostic path chosen by AI does not match the learner's actual mental hurdle, provide an immediate one-click pivot ("Không phải phần này, tôi muốn ôn tập chủ đề khác").

---

## 5. Prototype Implementation Rules
- Interactive prototype must be accessible directly via standard modern browsers (HTML5, Tailwind/modern CSS, Vanilla JS without complex bundler build friction).
- Use MCP Stitch to generate visual screens, inspect and review against this DESIGN.md, refine until visual and functional fidelity match, and pull into the local prototype application suite.
- Both desktop and responsive views must work smoothly.
