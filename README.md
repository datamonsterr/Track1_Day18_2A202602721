# Track 1 — Day 18 Lab: Three Prototypes, One Next Change
**Chương trình:** VinUni AIA — AI Product & Technical Management  
**Học viên:** Phạm Thành Đạt  
**Mã học viên (MHV):** `2A202602721`  
**Repository:** `Track1_Day18_2A202602721`  

---

## 1. Thông tin Cá nhân và Nhóm
- **Họ và tên:** Phạm Thành Đạt
- **Mã học viên:** `2A202602721`
- **Tên nhóm:** Nhóm 2A — Case A: Diagnostic Refresher
- **Thành viên nhóm:** 
  1. **Phạm Thành Đạt** (MHV: 2A202602721) — Phụ trách kiến trúc kỹ thuật testbed, thiết kế Option B (Knowledge Checklist User-Led), điều phối phiên thử nghiệm cá nhân #1.
  2. **Thành viên 2** — Phụ trách thiết kế Option A (Diagnostic Refresher AI-Led), điều phối phiên thử nghiệm cá nhân #2.
  3. **Thành viên 3** — Phụ trách thiết kế Option C (A/B Contrast & Escalation Co-create & Human), điều phối phiên thử nghiệm cá nhân #3.
- **Case được chọn:** **Case A — AI Tutor: Diagnostic Refresher**
  - *Trigger:* Học viên bấm nút “Tôi vẫn chưa hiểu”
  - *Input:* Bài hiện tại, câu trả lời/mã nguồn gần đây và lịch sử học tập
  - *AI Action:* Chẩn đoán và lựa chọn khái niệm nền tương ứng
  - *Output:* Một phần ôn lại ngắn (< 3 phút) trước khi đưa học viên quay lại bài hiện tại
  - *User Control:* Học viên chủ động yêu cầu trợ giúp và nắm quyền kiểm soát tiến trình

---

## 2. Hypothesis Problem (Giả thuyết Vấn đề Day 18)

### Bản Giả thuyết Vấn đề của Nhóm:
> **"Học viên non-tech và chuyển ngành thường xuyên bị nghẽn và bỏ dở bài học khi tiếp cận các bài tập kỹ thuật AI tổng hợp (như LangChain RAG Indexing), do họ thiếu khả năng tự chẩn đoán chính xác lỗ hổng kiến thức nền (prerequisites) đang gặp phải và thiếu giải pháp ôn tập bổ trợ ngắn gọn, tức thì (< 3 phút) ngay tại giao diện học tập."**

### Nối kết với Bằng chứng Thực nghiệm Day 17 (Gate 1 — Evidence Continuity):
- **Phỏng vấn Anh Khánh (25 tuổi - BA):** Vừa làm vừa học dự án mới, giai đoạn đầu bị ngợp bởi lượng kiến thức kỹ thuật quá lớn; workaround là tự dùng AI tham khảo nhưng tài liệu bị rối và tốn thời gian xác nhận thủ công.
- **Phỏng vấn Bạn Khuê (21 tuổi - Sinh viên CS):** Gặp khó ở các môn lý thuyết nền tảng phức tạp (Cryptography/Cloud); phải tìm tài liệu rời rạc bên ngoài làm gián đoạn luồng làm bài thực hành.
- **Phỏng vấn Bạn Thương (23 tuổi - BA) & Bạn Linh (22 tuổi - Marketing):** Cả hai đều đối mặt với rào cản thuật toán và code. Workaround điển hình của bạn Linh là **chủ động nhờ AI Agent tạo checklist kiến thức để chẻ nhỏ vấn đề**. Khi AI đưa ra kết quả thiếu nhất quán ngữ cảnh (như Thương phản ánh), người học mất rất nhiều công sức điều chỉnh thủ công.

### Điều Nhóm Chưa Biết (The Unknown):
- Chưa biết cơ chế nào giữa **AI tự chẩn đoán (AI-Led)**, **Người học tự soi chiếu checklist (User-Led)**, hay **Đối chiếu phản biện tư duy kết hợp Trợ giảng (Human-in-the-loop)** sẽ giúp người học non-tech thông suốt nhanh nhất mà không gây quá tải nhận thức.
- Chưa biết việc ôn tập vi mô tức thì (< 3 phút) có thực sự chuyển hóa thành năng lực giải quyết bài tập độc lập lâu dài hay chỉ là giải pháp tình thế.

---

## 3. Three Solution Options & Prototype Links (Gate 2 & Gate 3)

### Constants (Giữ cố định cho cả 3 Options):
- **Target User:** Học viên non-tech / chuyển ngành (Marketing, BA mới vào nghề).
- **Situation:** Đang trong luồng học bài tập kỹ thuật tổng hợp thì bị nghẽn ở một khái niệm nền tảng.
- **Task:** Xác định và lấp nhanh lỗ hổng kiến thức nền để tiếp tục hoàn thành bài học.
- **Desired Outcome:** Hiểu bản chất khái niệm bị hổng trong < 3 phút, khôi phục sự tự tin và tiếp tục làm bài mà không rời khỏi giao diện.
- **Content/Data Fixture:** **Bài 4: Xây dựng RAG Agent cơ bản với LangChain** — Tại bước cấu hình VectorStore Indexing, học viên gặp lỗi/không hiểu thuật ngữ: *"Embedding Dimension & Cosine Similarity"*.

### Variables Across Options (Khác biệt về Cơ chế & Phân chia vai trò):

| Phương án | Cơ chế cốt lõi (Mechanism) | Phân chia vai trò User — AI | Human Control & Đường Phục Hồi (Recovery) | Prototype Link |
| :--- | :--- | :--- | :--- | :--- |
| **Option A: Diagnostic Refresher (AI-Led)** | **Chẩn đoán trắc nghiệm tự động:** AI đưa ra 2 câu mini-quiz để xác định điểm hổng, sau đó push Refresher Card 60s về khái niệm nền tương ứng. | - **AI:** Hỏi qua quiz, chấm điểm, suy luận concept bị hổng, sinh thẻ tóm tắt (*Ask*).<br>- **User:** Trả lời 2 câu quiz, đọc Refresher Card, bấm quay lại bài. | - **Kỳ vọng:** Báo rõ quiz 60s.<br>- **Bằng chứng:** "Dựa trên bài học VectorStore & câu trả lời quiz".<br>- **Phục hồi:** Nút *"Bỏ qua chẩn đoán"* & *"Đây không phải phần tôi cần"*. | [`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html) (Tab A) |
| **Option B: Knowledge Checklist (User-Led)** | **Cây phân rã kiến thức tự chọn:** Giao diện hiển thị drawer checklist các mắt xích nền tảng; user tự click vào mắt xích mơ hồ để xem giải thích trực quan. | - **AI:** Phân rã cấu trúc prerequisite; thụ động chờ user click (*Don't Act*).<br>- **User:** Tự duyệt checklist, tự tick chọn điểm chưa rõ (*Self-Assessment*). | - **Kỳ vọng:** Nhãn tab ghi rõ danh mục kiến thức có sẵn.<br>- **Bằng chứng:** Dẫn link nguồn Bài 2 trong giáo trình.<br>- **Phục hồi:** Nút đóng drawer [X], bỏ tick chọn, nút mở bài giảng gốc. | [`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html) (Tab B) |
| **Option C: A/B Contrast & Escalation (Co-create & Human)** | **Đối chiếu phản biện tư duy & Kết nối Mentor:** AI đưa ra 2 kịch bản hiểu tương phản (A vs B); giải thích ngộ nhận; nếu vẫn tắc thì tự tạo ticket gửi Trợ giảng. | - **AI:** Sinh 2 kịch bản tương phản; giải thích ngộ nhận; tự gom context gửi Mentor khi user yêu cầu (*Ask*).<br>- **User:** Chọn phương án A/B; quyết định có cần escalate cho Mentor không. | - **Kỳ vọng:** Ghi rõ cơ chế đối chiếu & thời gian phản hồi Trợ giảng.<br>- **Bằng chứng:** "68% học viên nhầm Dimension & Token Count".<br>- **Phục hồi:** Preview ticket trước khi gửi, nút hủy gửi, thoát an toàn 100%. | [`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html) (Tab C) |

---

## 4. Đóng Góp Của Tôi Trong Nhóm (Individual Contribution)
1. **Kiến trúc Kỹ thuật & Testbed Tương tác Chung:**
   - Xây dựng bộ testbed tương tác [`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html) chuẩn hóa theo fixture LangChain RAG Indexing, đảm bảo cả 3 options chạy mượt mà trên cùng một bối cảnh thực hành.
   - Tích hợp và cấu hình hệ thống ghi log [`.ai_log`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/.ai_log) kèm test suite tự động kiểm thử 4 kịch bản.
2. **Thiết kế & Hoàn thiện Phương án B (Knowledge Checklist User-Led):**
   - Đóng góp giải pháp lấy cảm hứng từ workaround thực tế của bạn Linh (Day 17): chuyển hóa nhu cầu chẻ nhỏ kiến thức thành cây phân rã mắt xích tự chọn, giúp người học không bị áp lực kiểm tra.
3. **Thực hiện Phiên Thử Nghiệm Cá Nhân (Facilitation & Observation):**
   - Trực tiếp điều phối phiên testing độc lập với tester ngoài nhóm (Nguyễn Hoàng Nam, 26 tuổi, Backend Engineer đang học AI) và lập biên bản [`prototype-feedback-note.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototype-feedback-note.md).
4. **Đồng Biên soạn Tài liệu Thiết kế & Tổng hợp Phản hồi Nhóm:**
   - Hoàn thiện Chặng 2 & Chặng 3 trong [`three-option-design-sheet.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/three-option-design-sheet.md) và tổng hợp kết quả trong [`group-feedback-synthesis.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/group-feedback-synthesis.md).

---

## 5. Prototype Feedback & Group Synthesis (Gate 4 & Gate 5)

### Observation từ Phiên Tôi Điều Phối (Tester: Nguyễn Hoàng Nam — 26 tuổi):
- **Phản ứng với Option A:** Khựng lại ban đầu vì sợ "bị kiểm tra khi đang bực mình vì lỗi code", nhưng đánh giá 2 câu hỏi vào đúng trọng tâm rào cản.
- **Phản ứng với Option B:** Đánh giá cao nhất vì được toàn quyền quyết định xem gì và có thể chuyển đổi nhanh giữa các mắt xích mà không mất luồng code.
- **Phản ứng với Option C:** Thích ví dụ đối chiếu A/B vì rất trực quan; nút gửi Trợ giảng tạo cảm giác an tâm tuyệt đối khi gặp bài tập quá khó.
- Chi tiết xem tại: [`prototype-feedback-note.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototype-feedback-note.md).

### Tổng hợp Từ Ba Phiên Thử Nghiệm (Group Synthesis):
- **Cross-Tester Patterns:** Cả 3 tester đều yêu cầu can thiệp phải dưới 3 phút; bằng chứng minh bạch (số liệu 68% nhầm lẫn, trích xuất Bài 2) gia tăng độ tin cậy; các nút thoát hiểm là bắt buộc.
- **Divergences:** Kỹ sư công nghệ ưu tiên Option B (tự chủ, nhanh); trong khi học viên chuyển ngành/non-tech đánh giá cao Option C (đối chiếu tư duy, có Trợ giảng bảo chứng).
- Chi tiết xem tại: [`group-feedback-synthesis.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/group-feedback-synthesis.md).

### One Group Next Change (Thay đổi then chốt tiếp theo dựa trên bằng chứng):
> **Tích hợp Cơ chế Lai (Hybrid Flow): Khởi đầu bằng Cây Mắt Xích Kiến Thức (Option B - User-Led), nhưng khi người học bấm vào một mắt xích, giao diện cung cấp tùy chọn "Xem đối chiếu cách hiểu A vs B" (từ Option C) kèm nút gửi Trợ giảng dự phòng nếu vẫn chưa thông.**

### Still Unproven (Những điểm vẫn chưa được kiểm chứng):
1. Chưa kiểm chứng được khả năng duy trì trí nhớ dài hạn (retention) của học viên sau các thẻ micro-lesson 60s.
2. Chưa kiểm chứng được chi phí vận hành và thời gian phản hồi thực tế của Trợ giảng khi số lượng ticket tăng đột biến trong giờ cao điểm.

---

## 6. AI Support Log (Tóm tắt Phản ánh Cá nhân)
- **AI đã giúp gì:** Tự động hóa bộ khung AI log, cài đặt bộ skills (Matt Pocock `wayfinder`, `prototype`, BA & UI/UX skills), sinh mã nguồn ban đầu cho testbed.
- **AI sai và hời hợt ở đâu:** Ban đầu AI đề xuất các phương án chỉ khác biệt về layout hiển thị (vi phạm Gate 2); tự động đưa logic giải hộ bài làm mất quyền tự chủ của người học (vi phạm Gate 3); và đưa ra kết luận tâng bốc rằng giải pháp đã "validated 100%" (vi phạm Gate 5).
- **Con người tự sửa gì:** Bắt buộc tuân thủ 3 cơ chế giải quyết khác nhau (AI-Led vs User-Led vs Human-in-the-loop); thiết lập nghiêm ngặt bảng Human Control (Ask/Don't Act, bằng chứng, recovery path); và kiểm soát tính trung thực của kết luận dựa trên dữ liệu thực tế.
- Chi tiết xem tại: [`ai-support-log.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/ai-support-log.md).

---

## 7. Cấu Trúc Hồ Sơ Nộp Bài
```
Track1_Day18_2A202602721/
├── README.md                          # Thuyết minh tổng thể 6 phần theo chuẩn Day 18
├── three-option-design-sheet.md       # Phân tích Chặng 2 (Three Options) & Chặng 3 (Human-AI Design Pass)
├── prototype-link.md                  # Liên kết prototype & kịch bản thử nghiệm chuẩn
├── prototype-feedback-note.md         # Ghi chép phiên thử nghiệm cá nhân do Phạm Thành Đạt facilitate
├── group-feedback-synthesis.md        # Tổng hợp 3 phiên thử nghiệm, Next Change & Still Unproven
├── ai-support-log.md                  # Nhật ký hỗ trợ AI, phân tích sai sót & sự can thiệp của con người
├── DESIGN.md                          # Hệ thống thiết kế VLearn, bảng màu, typography và nguyên tắc UX
├── AGENTS.md                          # Chỉ dẫn workflow Stitch MCP và quy tắc 5 Evaluation Gates
├── index.html                         # Bộ testbed prototype tương tác chạy trực tiếp trên trình duyệt
├── prototypes/
│   └── index.html                     # Bản testbed chuyên biệt của nhóm
└── .agents/
    ├── hooks.json                     # Cấu hình AI Log Hook
    ├── scripts/
    │   ├── ai_log_hook.sh
    │   └── ai_log_hook.py             # Script tự động ghi log AI
    └── skills/                        # Các kỹ năng đã cài đặt (Matt Pocock, UI/UX, BA)
```
