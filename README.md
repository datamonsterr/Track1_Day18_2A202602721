# Track 1 — Day 18 Lab: Three Prototypes, One Next Change
**Chương trình:** VinUni AIA — AI Product & Technical Management  
**Học viên:** Phạm Thành Đạt  
**Mã học viên (MHV):** `2A202602721`  
**Repository:** `Track1_Day18_2A202602721`  

---

## 1. Thông tin Cá nhân và Nhóm
- **Họ và tên:** Phạm Thành Đạt
- **Mã học viên:** `2A202602721`
- **Tên nhóm:** Nhóm 2A — AI Tutor Diagnostic Refresher
- **Thành viên nhóm:** 
  1. **Phạm Thành Đạt** (MHV: 2A202602721) — Phụ trách kiến trúc kỹ thuật testbed, thiết kế Option B (Concept Map & Self-Select), điều phối phiên thử nghiệm 1.
  2. **Thành viên 2** — Phụ trách thiết kế Option A (Diagnostic Quiz), điều phối phiên thử nghiệm 2.
  3. **Thành viên 3** — Phụ trách thiết kế Option C (Socratic Dialogue Probe), điều phối phiên thử nghiệm 3.
- **Case được chọn:** **Case A — AI Tutor: Diagnostic Refresher**
  - *Trigger:* Học viên bấm nút “Tôi vẫn chưa hiểu”
  - *Input:* Bài hiện tại, câu trả lời/mã nguồn gần đây và lịch sử học tập
  - *AI Action:* Chẩn đoán và lựa chọn khái niệm nền tương ứng
  - *Output:* Một phần ôn lại ngắn (< 2 phút) trước khi đưa học viên quay lại bài hiện tại
  - *User Control:* Học viên chủ động yêu cầu trợ giúp và nắm quyền kiểm soát tiến trình

---

## 2. Hypothesis Problem (Giả thuyết Vấn đề Day 18)

### Bản Giả thuyết Vấn đề của Nhóm:
> **"Học viên thường xuyên bị bế tắc và có xu hướng bỏ dở bài tập nâng cao khi gặp lỗi logic phức tạp, do họ thiếu khả năng tự chẩn đoán chính xác khái niệm nền nào đang bị hổng và không có giải pháp ôn tập bổ trợ ngắn gọn, tức thì ngay tại luồng làm bài."**

### Nối kết với Bằng chứng Thực nghiệm Day 17 (Gate 1 — Evidence Continuity):
- **Quan sát từ phỏng vấn Anh Khánh (25 tuổi - BA):** Khi học kiến thức kỹ thuật mới, anh bị ngợp bởi khối lượng tài liệu khổng lồ, phải tự mày mò hỏi AI nhưng thông tin bị rời rạc, làm tốn nhiều thời gian và dễ gây nản lòng.
- **Quan sát từ phỏng vấn Bạn Khuê (21 tuổi - Sinh viên CS):** Gặp khó khăn lớn nhất ở các chủ đề trừu tượng (như Cryptography/Mạng), thường phải đọc tài liệu ngoài luồng hoặc chờ mentor hỗ trợ khiến luồng thực hành bị đứt quãng.
- **Quan sát từ phỏng vấn Bạn Thương (23 tuổi - BA) & Bạn Linh (22 tuổi - Marketing):** Cả hai đều nhấn mạnh rằng việc học lập trình/AI đòi hỏi phải chẻ nhỏ kiến thức thành từng checklist ngắn (như workaround của bạn Linh); nếu AI đưa ra lời giải thích quá chung chung hoặc không đúng trọng tâm, họ sẽ mất nhiều thời gian sửa lại thủ công.

### Điều Nhóm Chưa Biết (The Unknown):
- Nhóm chưa biết liệu việc chẩn đoán tại chỗ có thực sự giúp người học duy trì động lực hoàn thành cả khóa học hay chỉ giải quyết được lỗi cục bộ trước mắt.
- Nhóm chưa biết mức độ can thiệp nào của AI (Quiz bắt buộc vs Tự chọn trên bản đồ vs Đối thoại gợi mở) sẽ tối ưu hóa tốc độ tiếp thu mà không gây áp lực tâm lý cho người học.

---

## 3. Three Solution Options & Prototype Links (Gate 2 & Gate 3)

Cả 3 phương án đều giải quyết **cùng một bài toán và tác vụ**: Học viên đang giải bài tập *Token Bucket Rate Limiter*, gặp lỗi Race Condition ở test case kiểm thử đa luồng, bấm *"Tôi vẫn chưa hiểu"* để được chẩn đoán và ôn tập ngắn.

| Phương án | Mô tả Cơ chế (Mechanism) & Phân chia vai trò User — AI | Quyền kiểm soát & Đường phục hồi (Human Control & Recovery) | Liên kết Prototype |
| :--- | :--- | :--- | :--- |
| **Option A: Diagnostic Quiz (AI-Led)** | **Cơ chế:** AI tự động sinh 2 câu trắc nghiệm nhanh dựa trên log lỗi kiểm thử để khoanh vùng lỗ hổng; sau khi nộp, AI hiển thị thẻ ôn tập 60s tương ứng.<br>**Phân vai:** AI dẫn dắt kiểm tra; User trả lời khách quan. | - **Kỳ vọng:** Báo rõ AI sẽ hỏi 2 câu ngắn.<br>- **Độ tin cậy:** Ghi rõ căn cứ từ test log (độ tin cậy 82%).<br>- **Phục hồi:** Nút *"Bỏ qua quiz → Xem tóm tắt ngay"* và nút *"Quay lại bài làm"* bất kỳ lúc nào. | [`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html) (chọn Tab A) |
| **Option B: Concept Map (User-Select)** | **Cơ chế:** AI phân tích mã nguồn và dựng Bản đồ Cây Phụ Thuộc Khái Niệm kèm chỉ số nghi vấn (Đỏ: 88%, Vàng: 45%, Xanh: 15%). User tự click chọn node mình băn khoăn và chọn độ sâu ôn tập.<br>**Phân vai:** AI là radar bằng chứng; User nắm toàn quyền quyết định. | - **Kỳ vọng:** Hiển thị trực quan các mảng kiến thức liên quan.<br>- **Agency:** User tự chọn node và tự kéo thanh gạt độ sâu (TL;DR 30s vs Code chuyên sâu).<br>- **Phục hồi:** Đổi node khác với 1 click; nút *"✕ Đóng / Quay lại bài"*. | [`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html) (chọn Tab B) |
| **Option C: Socratic Probe (2-Turn)** | **Cơ chế:** AI đóng vai trò gia sư gợi mở tư duy, đưa ra 1 ví dụ ẩn dụ đời thường (ví tiền có 2 người cùng rút) để học viên tự nhận ra lỗi logic sau 2 lượt đối thoại ngắn.<br>**Phân vai:** AI kích hoạt tư duy phản biện; User đối thoại suy luận. | - **Kỳ vọng:** Giới hạn tối đa 2 câu hỏi định hướng.<br>- **Agency:** User chọn phản hồi có sẵn hoặc tự gõ câu trả lời.<br>- **Cứu cánh:** Nút khẩn cấp *"⚡ Giải thích thẳng luôn, đừng hỏi nữa"* để vượt qua câu hỏi ngay. | [`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html) (chọn Tab C) |

---

## 4. Đóng Góp Của Tôi Trong Nhóm (Individual Contribution)
1. **Kiến trúc Kỹ thuật & Testbed Tương tác Chung:**
   - Xây dựng bộ testbed HTML/JS tích hợp đầy đủ [`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html) phục vụ việc thử nghiệm cho cả nhóm và các tester ngoài nhóm.
   - Kế thừa và tinh chỉnh hệ thống AI Log Hook từ Day 16, đảm bảo tự động ghi nhận minh bạch các lượt tương tác với mô hình LLM.
2. **Thiết kế & Hoàn thiện Phương án B (Concept Dependency Map & Self-Select):**
   - Đóng góp cơ chế phân chia vai trò: AI cung cấp chỉ số nghi vấn định lượng, User tự chọn độ sâu (TL;DR 30s vs Chi tiết kỹ thuật).
3. **Thực hiện Phiên Thử Nghiệm Cá Nhân (Facilitation & Observation):**
   - Trực tiếp điều phối và ghi nhận toàn bộ phản hồi từ tester ngoài nhóm (Nguyễn Hoàng Nam, 26 tuổi, Backend Engineer).
4. **Tham gia Đồng Tổng hợp Feedback & Phản biện AI Support Log:**
   - Chắp bút tài liệu [`prototype-feedback-note.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototype-feedback-note.md) và đóng góp phân tích so sánh trong [`group-feedback-synthesis.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/group-feedback-synthesis.md).

---

## 5. Prototype Feedback & Group Synthesis (Gate 4 & Gate 5)

### Observation từ Phiên Tôi Điều Phối (Tester: Nguyễn Hoàng Nam — 26 tuổi):
- Tester ưa chuộng nhất **Option B** nhờ tính minh bạch và thanh chọn độ sâu 30s giúp sửa lỗi nhanh mà không mất ngữ cảnh bài làm.
- Tester ban đầu ngần ngại với Option A vì sợ bị "chấm điểm", nhưng thừa nhận 2 câu hỏi hỏi trúng trọng tâm lỗi.
- Chi tiết xem tại: [`prototype-feedback-note.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototype-feedback-note.md).

### Tổng hợp Từ Ba Phiên Thử Nghiệm (Group Synthesis):
- **Điểm đồng thuận:** Cả 3 tester đều yêu cầu thời gian tương tác phải dưới 90 giây; tính minh bạch của bằng chứng lỗi (100 vs 127 requests) là chìa khóa tạo dựng lòng tin; các đường thoát hiểm (nút quay lại, bỏ qua quiz, giải thích thẳng) là bắt buộc.
- **Điểm khác biệt:** Học viên có nền tảng kỹ thuật thích xem diff code và sơ đồ phụ thuộc (Option B); trong khi học viên chuyển ngành/non-tech cần ẩn dụ đời thường (Option C) để tiếp cận khái niệm.
- Chi tiết xem tại: [`group-feedback-synthesis.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/group-feedback-synthesis.md).

### One Group Next Change (Thay đổi then chốt tiếp theo dựa trên bằng chứng):
> **Tích hợp Cơ chế Lai (Hybrid Diagnostic Flow): Khởi đầu bằng Bản đồ Khái niệm kèm Chỉ số Nghi vấn (từ Option B), nhưng cho phép mở rộng 1 câu hỏi gợi mở dạng Socratic (từ Option C) ngay trên Node được chọn để hỗ trợ người học non-tech mà không làm chậm dân kỹ thuật.**

### Still Unproven (Những điểm vẫn chưa được kiểm chứng):
1. Chưa kiểm chứng được khả năng ghi nhớ dài hạn (Knowledge Retention) của học viên sau khi ôn tập bổ trợ ngắn.
2. Chưa kiểm chứng được độ chính xác chẩn đoán của AI trên các dạng bài tập mở không có bộ test case rõ ràng.

---

## 6. AI Support Log (Tóm tắt Phản ánh Cá nhân)
- **AI đã giúp gì:** Tự động hóa hệ thống ghi log `.ai_log`, cài đặt các skill tiêu chuẩn cao (Matt Pocock `wayfinder`, `prototype`), sinh bộ mã khung HTML/JS ban đầu cho testbed.
- **AI sai và hời hợt ở đâu:** AI ban đầu đề xuất 3 option chỉ khác về kiểu hiển thị giao diện (vi phạm Gate 2); tự đề xuất tính năng AI sửa hộ code làm mất quyền kiểm soát của người học (vi phạm Gate 3); và đưa ra kết luận tâng bốc thái quá rằng giải pháp đã "hoàn toàn được validate" (vi phạm Gate 5).
- **Con người tự sửa gì:** Bắt buộc tái cấu trúc thành 3 cơ chế tương tác và phân chia vai trò rõ rệt; bổ sung các chốt chặn kiểm soát của người dùng (Agency, Uncertainty, Emergency Recovery); và viết lại báo cáo tổng hợp với thái độ khoa học khiêm tốn, trung thực với dữ liệu thực tế.
- Chi tiết xem tại: [`ai-support-log.md`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/ai-support-log.md).

---

## 7. Cấu Trúc Tài Liệu Repository (Checklist Nộp Bài)
```
Track1_Day18_2A202602721/
├── README.md                          # Bản thuyết minh đầy đủ 6 phần theo chuẩn Day 18
├── three-option-design-sheet.md       # Bảng phân tích chi tiết 3 phương án A/B/C & Human Control
├── prototype-link.md                  # Liên kết prototype và kịch bản thử nghiệm chuẩn
├── prototype-feedback-note.md         # Ghi chép phiên thử nghiệm do chính Phạm Thành Đạt điều phối
├── group-feedback-synthesis.md        # Tổng hợp từ cả 3 phiên thử nghiệm, Next Change & Still Unproven
├── ai-support-log.md                  # Nhật ký hỗ trợ AI, phân tích sai sót & sự can thiệp của con người
├── DESIGN.md                          # Hệ thống thiết kế, bảng màu, typography và nguyên tắc UX
├── AGENTS.md                          # Chỉ dẫn workflow cho AI Agent và quy trình Stitch MCP
├── index.html                         # Bộ testbed prototype tương tác chạy trực tiếp trên trình duyệt
├── prototypes/
│   └── index.html                     # Thư mục chứa prototype chuyên biệt
└── .agents/
    ├── hooks.json                     # Cấu hình AI Log Hook
    ├── scripts/
    │   ├── ai_log_hook.sh
    │   └── ai_log_hook.py             # Script ghi log tương tác AI
    └── skills/                        # Các kỹ năng đã cài đặt (Matt Pocock, UI/UX, BA)
```
