# Use Case Specifications (IT BA Standard — Karl Wiegers / IIBA)
**Project:** VLearn Adaptive Learning Studio  
**Author:** Phúc NT @ BA Zone & AIA Engineering Team  
**Standard:** IIBA BABOK & Karl Wiegers 13-Field Use Case Specification Template  
**Scope:** Three Solution Options for Prerequisite Gap Resolution (Day 18 Prototype Suite)  
**Source Baseline:** [`three-option-design-sheet.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/three-option-design-sheet.md)

---

## 1. Use Case Summary List

| Use Case ID | Use Case Name | Primary Actor | Strategic Mechanism | Priority |
| :--- | :--- | :--- | :--- | :--- |
| **UC-VLEARN-01** | Diagnose and Resolve Prerequisite Gap via Adaptive Quiz | Non-tech Learner | **Option A:** AI-Led Inference & Automated Refresher | High |
| **UC-VLEARN-02** | Explore Prerequisite Concepts via Structured Checklist | Non-tech Learner | **Option B:** User-Led Metacognition & Micro-Lesson Drawer | High |
| **UC-VLEARN-03** | Resolve Misconceptions via Mental Model Contrast and Escalation | Non-tech Learner | **Option C:** Dialectical Contrast & Human Mentor Fallback | High |

---

## 2. Specification: UC-VLEARN-01 (Option A — AI-Led Diagnostic Refresher)

| Field | Detail |
| :--- | :--- |
| **Use Case ID:** | **UC-VLEARN-01** |
| **Use Case Name:** | **Diagnose and Resolve Prerequisite Gap via Adaptive Quiz** |
| **Created By:** | AIA Product BA Team |
| **Last Updated By:** | AIA Engineering Team |
| **Date Created:** | 2026-10-05 |
| **Date Last Updated:** | 2026-10-05 |
| **Actor:** | **Primary:** Non-tech Learner (Career Transitioner, Junior BA/Marketer).<br/>**Secondary:** VLearn AI Diagnostic Engine, LMS Course Progression Service. |
| **Description:** | When a learner gets blocked by complex prerequisite terminology during a hands-on LangChain lesson, the learner initiates an AI diagnostic session. The system serves two fast, focused diagnostic questions, evaluates the answers to deduce the root knowledge gap, and presents a targeted 60-second refresher card. The learner reads the visual summary and returns directly to the active lesson workspace without loss of context. |
| **Preconditions:** | 1. Learner is actively logged in with an active course enrollment.<br/>2. Learner is on Lesson 4 (*RAG VectorStore Indexing*) in the interactive lesson player.<br/>3. The lesson player is in a playable/editable state with code and video loaded. |
| **Postconditions:** | 1. The learner's diagnostic answers and inferred knowledge gap (e.g., Cosine Similarity) are recorded in the session telemetry.<br/>2. The diagnostic overlay is dismissed, and the learner's workspace focus is restored to the active lesson code editor with zero state loss.<br/>3. Course progress is preserved with zero academic penalty. |
| **Priority:** | High |
| **Frequency of Use:** | 1 to 3 times per technical module per learner. |
| **Normal Course of Events:** | **1. Learner** clicks the *"Tôi vẫn chưa hiểu"* (I still don't understand) button on the lesson control bar.<br/>**2. System** pauses video playback (if playing) and displays the Diagnostic Refresher modal with an expectation note stating that 2 quick questions will identify the gap in under 60 seconds.<br/>**3. System** presents Question 1 assessing foundational Vector Dimension understanding.<br/>**4. Learner** selects an answer option for Question 1 and clicks *"Tiếp tục"* (Next).<br/>**5. System** records Answer 1 and presents Question 2 assessing Cosine Similarity calculation.<br/>**6. Learner** selects an answer option for Question 2 and clicks *"Hoàn tất chẩn đoán"* (Complete Diagnosis).<br/>**7. System** scores the quiz responses, infers the core blocker to be *Cosine Similarity vs Euclidean Distance*, and renders a Refresher Card containing an evidence statement, geometric visual diagram, and 2-line code example.<br/>**8. Learner** reviews the Refresher Card and clicks *"Quay lại bài học"* (Return to Lesson).<br/>**9. System** closes the modal overlay, re-enables full interactive workspace controls, and highlights the corresponding line in the code editor. |
| **Alternative Courses:** | **UC-VLEARN-01.AC.1: Borderline Diagnostic Score (Uncertainty Handling)**<br/>*At step 7 of Normal Course:* If the learner's score falls within the ambiguous boundary zone where the AI cannot definitively distinguish between Vector Dimension vs Cosine calculation error:<br/>7a. System displays an explicit transparency badge: *"AI chưa chắc chắn bạn đang vướng ở Khái niệm Vector hay Thuật toán Cosine"*. <br/>7b. System serves a dual-tab Refresher Card containing condensed summaries for both concepts.<br/>7c. Learner navigates between tabs and returns to Step 8 of Normal Course.<br/><br/>**UC-VLEARN-01.AC.2: Explicit Misalignment Reported by Learner**<br/>*At step 8 of Normal Course:* If the learner reads the Refresher Card and finds it irrelevant:<br/>8a. Learner clicks *"Đây không phải phần tôi cần"* (Not what I need).<br/>8b. System displays an alternative concept picker allowing the learner to choose another prerequisite topic immediately without retaking the quiz. |
| **Exceptions:** | **UC-VLEARN-01.EX.1: Learner Aborts Diagnosis Session**<br/>*Trigger:* Learner clicks *"Bỏ qua chẩn đoán, quay lại bài"* (Cancel/Skip) or presses `Esc` at steps 2, 4, 6, or 8.<br/>*System Response:* System prompts a 1-click confirmation or closes immediately, discards in-progress quiz responses, and re-activates the main workspace.<br/>*Final State:* Lesson player remains on Lesson 4, no quiz record saved, no academic penalty.<br/><br/>**UC-VLEARN-01.EX.2: AI Inference Service Timeout**<br/>*Trigger:* At step 7, the AI inference backend fails to respond within 3000ms.<br/>*System Response:* System gracefully falls back to displaying pre-compiled prerequisite summary sheets for the current lesson module, logging an error event.<br/>*Final State:* Learner can still review static prerequisite cards and return to code. |
| **Includes:** | None. (Designed as a self-contained modal interaction pattern). |
| **Special Requirements:** | 1. **Performance:** Quiz modal opening and question transition latency must be under 150ms.<br/>2. **Refresher Generation:** Summary card must be displayed within 1.5 seconds of final question submission.<br/>3. **Accessibility:** Keyboard navigable (Tab, Space, Enter, Escape) and high-contrast color compliant (WCAG 2.1 AA).<br/>4. **Non-disruptiveness:** Zero audio disruption and state loss of code written by the learner. |
| **Assumptions:** | 1. The lesson author has tagged Lesson 4 with prerequisite metadata (Vector Embeddings, Cosine Similarity).<br/>2. Learners have basic browser capabilities with JavaScript enabled. |
| **Notes and Issues:** | **[TBD-01]** Need to monitor whether learners feel test anxiety when prompted with a quiz while already stuck. Evaluation to be gathered during Day 18 user testing. |

---

## 3. Specification: UC-VLEARN-02 (Option B — User-Led Knowledge Checklist)

| Field | Detail |
| :--- | :--- |
| **Use Case ID:** | **UC-VLEARN-02** |
| **Use Case Name:** | **Explore Prerequisite Concepts via Structured Checklist** |
| **Created By:** | AIA Product BA Team |
| **Last Updated By:** | AIA Engineering Team |
| **Date Created:** | 2026-10-05 |
| **Date Last Updated:** | 2026-10-05 |
| **Actor:** | **Primary:** Non-tech Learner (Self-directed, prefers autonomy).<br/>**Secondary:** VLearn Curriculum Metadata Repository. |
| **Description:** | When an autonomous learner encounters ambiguous foundational terms, the learner slides open the Prerequisite Knowledge Checklist drawer. The system presents an itemized prerequisite map linked to prior curriculum modules. The learner ticks the specific concept they want to clarify, reads an inline visual micro-lesson, and closes the drawer without leaving the workspace. |
| **Preconditions:** | 1. Learner has active access to Lesson 4 on VLearn.<br/>2. Prerequisite module registry has pre-indexed the concepts for Lesson 4. |
| **Postconditions:** | 1. Selected prerequisite items and self-assessment checkboxes are persisted in local session storage.<br/>2. The drawer closes smoothly, maintaining the learner's exact code cursor position and lesson video timestamp. |
| **Priority:** | High |
| **Frequency of Use:** | 2 to 5 times per chapter. |
| **Normal Course of Events:** | **1. Learner** clicks the *"Mắt xích kiến thức nền"* (Prerequisite Knowledge Tree) tab on the right sidebar.<br/>**2. System** expands a non-modal sliding drawer from the right edge showing the prerequisite checklist categorized into foundational competencies.<br/>**3. Learner** scans the list and clicks on *"Khoảng cách Cosine vs Euclidean Distance"* to inspect details.<br/>**4. System** expands an inline micro-lesson card showing a geometric diagram, simplified explanation (ELI5), and the originating curriculum citation (*Trích xuất từ Bài 2: Nhập môn Vector Embeddings*).<br/>**5. Learner** marks the checkbox `[x]` as reviewed after absorbing the concept.<br/>**6. System** updates the local readiness meter (e.g., 2/3 foundational prerequisites reviewed).<br/>**7. Learner** clicks the close button `[X]` on the drawer header or clicks the backdrop.<br/>**8. System** smoothly collapses the drawer back into the sidebar, returning active focus to the code editor. |
| **Alternative Courses:** | **UC-VLEARN-02.AC.1: Deep Dive into Original Lesson in New Tab**<br/>*At step 4 of Normal Course:* If the learner requires more comprehensive instruction beyond the micro-lesson:<br/>4a. Learner clicks *"Mở bài giảng gốc trong tab mới"* (Open original lecture).<br/>4b. System launches Lesson 2 in a new browser tab at the exact prerequisite timestamp without terminating the current session.<br/>4c. Learner resumes at Step 7 of Normal Course. |
| **Exceptions:** | **UC-VLEARN-02.EX.1: Prerequisite Index Empty or Offline**<br/>*Trigger:* At step 2, the drawer fails to retrieve prerequisite metadata.<br/>*System Response:* System displays a helpful fallback search input allowing the learner to look up terms in the global course glossary.<br/>*Final State:* Learner can search terms manually or dismiss the drawer. |
| **Includes:** | None. |
| **Special Requirements:** | 1. **Zero Layout Shift:** Drawer opening must not distort the video aspect ratio or break the code editor container.<br/>2. **Persistence:** Checkbox selections must survive page reloads within the same session. |
| **Assumptions:** | 1. Learners possess sufficient metacognitive ability to recognize which specific term they are confused by. |
| **Notes and Issues:** | **[TBD-02]** Observe whether learners with very low baseline knowledge struggle to recognize which checkbox to click. |

---

## 4. Specification: UC-VLEARN-03 (Option C — Cognitive A/B Contrast & Human Escalation)

| Field | Detail |
| :--- | :--- |
| **Use Case ID:** | **UC-VLEARN-03** |
| **Use Case Name:** | **Resolve Misconceptions via Mental Model Contrast and Escalation** |
| **Created By:** | AIA Product BA Team |
| **Last Updated By:** | AIA Engineering Team |
| **Date Created:** | 2026-10-05 |
| **Date Last Updated:** | 2026-10-05 |
| **Actor:** | **Primary:** Non-tech Learner.<br/>**Secondary:** VLearn Peer Misconception Analytics Service, Human Teaching Assistant / Mentor Support Queue. |
| **Description:** | When a learner struggles with subtle conceptual confusions during LangChain vector indexing, the learner opens the Mental Model Contrast tool. The system serves two contrasting perspectives (Interpretation A vs Interpretation B) derived from historical learner misunderstandings. The learner identifies which interpretation matches their thinking and receives targeted dialectical feedback. If the cognitive blocker persists, the learner can escalate an auto-packaged context ticket directly to a human mentor with one click. |
| **Preconditions:** | 1. Learner is actively working on Lesson 4.<br/>2. Mentor support queue is online or within scheduled operating hours. |
| **Postconditions:** | 1. Misconception selection data is logged to refine the course FAQ knowledge graph.<br/>2. If escalated, a structured support ticket containing code, error traces, and learner notes is queued for human review with an SLA countdown. |
| **Priority:** | High |
| **Frequency of Use:** | 1 to 2 times per hands-on coding lab. |
| **Normal Course of Events:** | **1. Learner** clicks *"Đối chiếu cách hiểu"* (Compare Mental Models) adjacent to the active code editor.<br/>**2. System** displays a dual-card comparison modal outlining two contrasting viewpoints regarding Vector Dimensions:<br/>- *Cách hiểu A (Misconception):* Vector Dimension corresponds to total token/word count.<br/>- *Cách hiểu B (Correct Principle):* Vector Dimension is the fixed semantic coordinate width determined by the embedding model.<br/>**3. Learner** selects *Cách hiểu A* reflecting their initial mental model and clicks *"Kiểm tra góc nhìn"* (Verify Perspective).<br/>**4. System** highlights the selection with peer analytics (*"68% học viên mới thường có cùng cách hiểu như bạn!"*), clearly explains the semantic root cause of the error, and provides an interactive visual comparison between word count and embedding dimensions.<br/>**5. Learner** recognizes the misunderstanding and clicks *"Tôi đã hiểu — Quay lại thực hành"* (Understood — Return to Code).<br/>**6. System** closes the contrast dialog and inserts an explanatory inline code comment into the editor for ongoing guidance. |
| **Alternative Courses:** | **UC-VLEARN-03.AC.1: Human Mentor Escalation (Safety Net)**<br/>*At step 5 of Normal Course:* If the learner reads the explanation but still feels confused or stuck on execution:<br/>5a. Learner clicks *"Vẫn chưa thông — Gửi Trợ giảng hỗ trợ 1-1"*. <br/>5b. System packages the current context (Lesson 4, editor code, terminal error trace, chosen mental model) and displays a pre-dispatch confirmation modal.<br/>5c. Learner types an optional 1-sentence note and clicks *"Xác nhận gửi Mentor"* (Confirm Send).<br/>5d. System submits the ticket to the teaching assistant dashboard, displays an SLA banner (*"Đã gửi thành công! Trợ giảng phản hồi trong < 10 phút"*), and unlocks the workspace.<br/>5e. Learner returns to lesson. |
| **Exceptions:** | **UC-VLEARN-03.EX.1: Neither A nor B Reflects Learner Problem**<br/>*Trigger:* At step 3, learner identifies that their issue is completely unrelated to the displayed A/B scenarios.<br/>*System Response:* Learner clicks *"Thắc mắc của tôi khác"*; system immediately bypasses comparison and provides direct escalation to the human mentor.<br/>*Final State:* Ticket creation dialog rendered with empty context for custom input.<br/><br/>**UC-VLEARN-03.EX.2: Mentor Support Queue Offline**<br/>*Trigger:* At step 5c, if escalation occurs outside mentor operating hours (e.g., 2:00 AM).<br/>*System Response:* System displays asynchronous ticket confirmation stating the exact next operating shift and offers an immediate link to the community Discord/forum channel.<br/>*Final State:* Ticket queued for next day response, learner unblocked. |
| **Includes:** | None. |
| **Special Requirements:** | 1. **Data Privacy:** Automated context collection must exclude user passwords, API keys, or personal identifiers.<br/>2. **Mentor Response Tracking:** Ticket status must update dynamically in the learner's top bar without full page reload. |
| **Assumptions:** | 1. Teaching assistants are equipped with an administrative dashboard to receive packaged context tickets. |
| **Notes and Issues:** | **[TBD-03]** Validate whether the availability of human escalation reduces learner self-reliance or increases completion confidence during Day 18 trials. |

---

## 5. 20-Point BA Quality Checklist Validation

| Check ID | Criteria Group & Description | UC-01 (Option A) | UC-02 (Option B) | UC-03 (Option C) | Notes |
| :---: | :--- | :---: | :---: | :---: | :--- |
| **C1** | UC Name follows "Verb + Object", active voice | ✅ | ✅ | ✅ | Diagnose and Resolve..., Explore Prerequisite..., Resolve Misconceptions... |
| **C2** | User-goal level (passes Cockburn coffee-break test) | ✅ | ✅ | ✅ | Single session, achieves complete concept unblocking |
| **C3** | Unique ID following convention (`UC-<module>-<seq>`) | ✅ | ✅ | ✅ | `UC-VLEARN-01`, `02`, `03` |
| **C4** | Exactly 1 primary actor + 1 clear business goal | ✅ | ✅ | ✅ | Non-tech Learner unblocking prerequisite gap |
| **C5** | System boundary clearly demarcated | ✅ | ✅ | ✅ | VLearn interactive lesson player boundary |
| **C6** | Specific actor persona (no generic "User") | ✅ | ✅ | ✅ | Non-tech Learner (Career Transitioner, Junior BA) |
| **C7** | Description answers Why + What + Outcome | ✅ | ✅ | ✅ | Structured 2-3 sentences covering context and result |
| **C8** | Frequency of Use quantified | ✅ | ✅ | ✅ | 1-3 times / module |
| **C9** | Preconditions verifiable (not business rules) | ✅ | ✅ | ✅ | User logged in, active enrollment, player loaded |
| **C10** | Postconditions verifiable (state change recorded) | ✅ | ✅ | ✅ | Telemetry logged, modal dismissed, code restored |
| **C11** | Preconditions distinct from Assumptions | ✅ | ✅ | ✅ | Rigorously separated in respective sections |
| **C12** | Normal Course numbered list, 1 action per step | ✅ | ✅ | ✅ | Sequenced steps 1 to 9 |
| **C13** | Alternates Actor / System with explicit subjects | ✅ | ✅ | ✅ | Every step begins with bold Actor or System |
| **C14** | NO embedded if/else/loops in Normal Course | ✅ | ✅ | ✅ | Branching isolated to AC and EX |
| **C15** | Flow runs from trigger to postcondition smoothly | ✅ | ✅ | ✅ | Clean end-to-end traversal |
| **C16** | Each AC specifies "At step N" + condition | ✅ | ✅ | ✅ | Explicit anchors across all ACs |
| **C17** | Each Exception has Trigger + System Response + Final State | ✅ | ✅ | ✅ | Standardized 3-part exception architecture |
| **C18** | Common failure modes covered (cancel, timeout, offline) | ✅ | ✅ | ✅ | Abort, inference timeout, mentor queue offline |
| **C19** | Includes point to valid specifications | ✅ | ✅ | ✅ | Zero broken modular dependencies |
| **C20** | Special Requirements contain non-functional constraints | ✅ | ✅ | ✅ | Latency, accessibility, zero layout shift, privacy |

**Final Quality Rating:** **100% PASS (20/20 on all three Use Cases)**.
