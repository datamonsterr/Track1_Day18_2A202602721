# AI Support Log — Nhật Ký Hỗ Trợ Của AI & Phản Biện Con Người

- **Học viên:** Phạm Thành Đạt (MHV: 2A202602721)
- **Học phần:** VinUni AIA Track 1 — Day 18 Lab (Diagnostic Refresher Prototype)
- **Mô hình AI sử dụng:** Gemini 3.8 Flash / Antigravity Assistant

---

## 1. AI Đã Giúp Được Những Gì? (AI Contributions)

1. **Kế thừa & Tự động hóa hệ thống ghi nhận AI Log:**
   - Di chuyển và kế thừa toàn bộ hệ thống `.ai_log` hook từ Day 16, tự động tối ưu hóa đường dẫn tìm kiếm `transcript.jsonl` tương thích với các profile máy trạm (`agy_worker_4`).
   - Cung cấp test suite bash (`scripts/test_ai_log_hook.sh`) kiểm thử tự động 4 kịch bản payload, tiếng Việt Unicode và cấu trúc JSON.

2. **Tìm kiếm & Cài đặt bộ Skills chuyên sâu:**
   - Tra cứu và tích hợp các kỹ năng tiêu chuẩn cao từ Matt Pocock (`wayfinder`, `prototype`) và bộ kỹ năng giao diện & BA (`minimalist-ui`, `stitch-design-taste`, `design-taste-frontend`, `ask-why-ba`, `user-story-ac-writer`, `use-case-writer`).

3. **Hiện thực hóa Nhanh Bộ Prototype Tương Tác Đa Phương Án:**
   - Viết trọn vẹn bộ testbed HTML/JS độc lập ([`prototypes/index.html`](file:///home/dat/dev/vinuni_aia/Track1_Day18_2A202602721/prototypes/index.html)) mô phỏng chân thực bài học LangChain RAG Indexing (Embedding Dimension & Cosine Similarity) và cả 3 cơ chế hỗ trợ A/B/C với đầy đủ trạng thái tương tác.

---

## 2. AI Đã Sai, Hời Hợt Hoặc Ảo Tưởng Ở Đâu? (AI Flaws & Hallucinations)

1. **Hiểu sai Gate 2 về "Meaningful Options":**
   - *Biểu hiện của AI:* Ở bản phác thảo ban đầu, AI đề xuất 3 option chỉ khác nhau về hình thức hiển thị giao diện: Option 1 hiển thị dạng Modal pop-up, Option 2 hiển thị Drawer bên phải, Option 3 hiển thị Accordion dưới bài nộp.
   - *Hậu quả nếu giữ nguyên:* Sẽ bị đánh trượt Gate 2 ngay lập tức vì cả 3 option cùng một cơ chế, chỉ khác giao diện/wording.

2. **Vi phạm nguyên tắc Human Control (Gate 3) do thiên vị "AI tự hành động":**
   - *Biểu hiện của AI:* AI từng gợi ý tính năng tự động nhảy bài học mới hoặc tự sửa code khi user bị sai.
   - *Vấn đề:* Việc này tước đoạt hoàn toàn quyền tự chủ (Agency) của người học, vi phạm nguyên tắc chỉ chọn cơ chế *Ask* hoặc *Don't Act* tại các thời điểm then chốt.

3. **Ảo tưởng kết luận (Overclaiming Evidence) ở Gate 5:**
   - *Biểu hiện của AI:* Trong bản nháp tổng hợp feedback, AI tự động viết: *"Kết quả 3 tester đã chứng minh giải pháp hoàn toàn giải quyết triệt để vấn đề drop-out của học viên"*.
   - *Vấn đề:* Đây là lỗi nghiêm trọng mà Gate 5 cảnh báo ("tuyên bố solution đã validated là Dấu hiệu chưa đạt"). Ba phiên thử nghiệm micro-prototype chỉ chứng minh được trải nghiệm tại chỗ, không thể kết luận về hành vi dài hạn.

---

## 3. Con Người Đã Tự Phản Biện & Can Thiệp Chỉnh Sửa Như Thế Nào? (Human-in-the-Loop Corrections)

1. **Định hình triệt để 3 cơ chế giải quyết (Chặng 2 — Gate 2):**
   - Can thiệp loại bỏ sự phân chia theo giao diện; chuẩn hóa 3 cơ chế giải quyết khác biệt:
     - **Option A (AI-Led):** Chẩn đoán trắc nghiệm tự động & Refresher Card 60s.
     - **Option B (User-Led):** Cây phân rã kiến thức nền (Knowledge Checklist) cho người học tự tick chọn và xem micro-lesson.
     - **Option C (Co-create & Human):** Đối chiếu tương phản tư duy A vs B kết hợp luồng chuyển giao ticket cho Trợ giảng thật.

2. **Thiết kế nghiêm ngặt Bảng Quyết Định Human-AI (Chặng 3 — Gate 3):**
   - Thiết lập các nguyên tắc:
     - Phân định rõ AI Act / Ask / Don't Act (Option A: Ask qua quiz; Option B: Don't Act thụ động; Option C: Ask xác nhận A/B và gửi ticket).
     - Bổ sung chỉ số bằng chứng (68% ngộ nhận, nguồn Bài 2 giáo trình).
     - Đảm bảo đường thoát hiểm tức thì (nút đóng drawer, bỏ qua quiz, hủy gửi ticket) không làm mất dữ liệu bài học.

3. **Kiểm soát tính trung thực của kết luận (Gate 5):**
   - Gạt bỏ các phát biểu tâng bốc của AI; đưa ra mục **Still Unproven** (Độ bền ghi nhớ dài hạn & Chi phí SLA của Trợ giảng) và một **Group Next Change** khiêm tốn, tích hợp cơ chế lai (Hybrid Flow) bám sát dữ liệu thu thập được từ các tester.
