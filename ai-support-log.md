# AI Support Log — Nhật Ký Hỗ Trợ Của AI & Phản Biện Con Người

- **Học viên:** Phạm Thành Đạt (MHV: 2A202602721)
- **Học phần:** VinUni AIA Track 1 — Day 18 Lab (Diagnostic Refresher Prototype)
- **Mô hình AI sử dụng:** Gemini 3.8 Flash / Claude 3.5 Sonnet / Antigravity Assistant

---

## 1. AI Đã Giúp Được Những Gì? (AI Contributions)

1. **Kế thừa & Tự động hóa hệ thống ghi nhận AI Log:**
   - Di chuyển và kế thừa toàn bộ hệ thống `.ai_log` hook từ Day 16, tự động tối ưu hóa đường dẫn tìm kiếm `transcript.jsonl` tương thích với các profile máy trạm (`agy_worker_4`).
   - Cung cấp test suite bash (`scripts/test_ai_log_hook.sh`) kiểm thử tự động 4 kịch bản payload, tiếng Việt Unicode và cấu trúc JSON.

2. **Tìm kiếm & Cài đặt bộ Skills chuyên sâu:**
   - Tra cứu và tích hợp các kỹ năng tiêu chuẩn cao từ Matt Pocock (`wayfinder`, `prototype`) và bộ kỹ năng giao diện (`minimalist-ui`, `stitch-design-taste`, `design-taste-frontend`, `ask-why-ba`, `user-story-ac-writer`, `use-case-writer`).

3. **Hiện thực hóa Nhanh Bộ Prototype Tương Tác Đa Phương Án:**
   - Viết trọn vẹn bộ testbed HTML/JS độc lập (`prototypes/index.html`) mô phỏng chân thực bài tập đa luồng và cả 3 cơ chế hỗ trợ A/B/C với đầy đủ trạng thái tương tác.

---

## 2. AI Đã Sai, Hời Hợt Hoặc Ảo Tưởng Ở Đâu? (AI Flaws & Hallucinations)

1. **Hiểu sai Gate 2 về "Meaningful Options":**
   - *Biểu hiện của AI:* Ở bản phác thảo ban đầu, AI đề xuất 3 option chỉ khác nhau về hình thức hiển thị giao diện: Option 1 hiển thị dạng Modal cửa sổ bật lên, Option 2 hiển thị thanh trượt bên phải (Drawer), Option 3 hiển thị dạng Accordion dưới bài nộp.
   - *Hậu quả nếu giữ nguyên:* Sẽ bị đánh trượt Gate 2 ngay lập tức vì cả 3 option cùng một cơ chế, chỉ khác giao diện/wording.

2. **Vi phạm nguyên tắc Human Control (Gate 3) do thiên vị "AI toàn năng":**
   - *Biểu hiện của AI:* AI từng gợi ý một tính năng "AI Auto-Fix": học viên bấm vào là AI tự sửa luôn code trong file `solution.py`.
   - *Vấn đề:* Việc này tước đoạt hoàn toàn quyền tự chủ (Agency) của người học, biến hệ thống thành công cụ giải hộ thay vì gia sư chẩn đoán lỗ hổng kiến thức.

3. **Ảo tưởng kết luận (Overclaiming Evidence) ở Gate 5:**
   - *Biểu hiện của AI:* Trong bản nháp tổng hợp feedback, AI tự động viết: *"Kết quả 3 tester đã chứng minh giải pháp hoàn toàn giải quyết triệt để vấn đề drop-out của học viên"*.
   - *Vấn đề:* Đây là lỗi nghiêm trọng mà Gate 5 cảnh báo ("tuyên bố solution đã validated là Dấu hiệu chưa đạt"). Ba phiên thử nghiệm micro-prototype chỉ chứng minh được trải nghiệm tại chỗ, không thể kết luận về hành vi dài hạn.

---

## 3. Con Người Đã Tự Phản Biện & Can Thiệp Chỉnh Sửa Như Thế Nào? (Human-in-the-Loop Corrections)

1. **Tái cấu trúc triệt để 3 cơ chế giải pháp (Gate 2):**
   - Can thiệp loại bỏ sự phân chia theo giao diện; định hình lại 3 cơ chế tương tác rõ ràng:
     - **Option A:** AI dẫn dắt quy trình qua bài test trắc nghiệm chẩn đoán khách quan.
     - **Option B:** AI cung cấp bản đồ khái niệm và bằng chứng, User tự quyết định khám phá và chọn độ sâu.
     - **Option C:** Hội thoại gia sư phản biện gợi mở tư duy (Socratic) bằng ví dụ thực tế.

2. **Thiết kế nghiêm ngặt Bảng Kiểm Soát Người Dùng (Gate 3):**
   - Bổ sung bắt buộc vào prototype:
     - Dòng minh bạch bằng chứng (Evidence & Uncertainty indicators).
     - Nút thoát khẩn cấp: "✕ Đóng / Quay lại bài" ở mọi màn hình.
     - Nút "Bỏ qua quiz" cho Option A và "⚡ Giải thích thẳng luôn, đừng hỏi nữa" cho Option C.

3. **Kiểm soát tính trung thực của kết luận (Gate 5):**
   - Gạt bỏ các phát biểu khẳng định vô căn cứ của AI; đưa ra mục **Still Unproven** (Những điểm chưa thể kết luận về khả năng ghi nhớ dài hạn và bài tập mở) và một **Group Next Change** khiêm tốn, bám sát dữ liệu thu thập được từ các tester.
