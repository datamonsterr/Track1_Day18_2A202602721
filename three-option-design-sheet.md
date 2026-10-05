# Three-Option Design Sheet: AI Tutor Diagnostic Refresher

## 1. Shared Context & Problem Framing (Bối cảnh chung của cả 3 phương án)
- **User:** Học viên tham gia khóa học công nghệ / AI (tương ứng với chân dung phỏng vấn Day 17: Anh Khánh, bạn Khuê, bạn Thương, bạn Linh).
- **Situation:** Đang giải bài tập thực hành lập trình nâng cao (Lab Concurrency: Token Bucket Rate Limiter), nộp bài lần thứ 3 và gặp lỗi sai logic kiểm thử (Race Condition).
- **Trigger:** Học viên bấm nút **"Tôi vẫn chưa hiểu"** trên thanh công cụ bài tập.
- **Task:** Xác định đúng nguyên nhân gốc rễ và lỗ hổng kiến thức nền đang gặp phải, hoàn thành một phần ôn tập bổ trợ ngắn (< 2 phút) để có thể tiếp tục tự giải quyết bài tập.
- **Desired Outcome:** Lấy lại kiến thức nền kịp thời, hiểu bản chất lỗi, tự tin quay lại bài tập và hoàn thành mã nguồn mà không bỏ dở giữa chừng.

---

## 2. So sánh Cơ chế (Mechanism) & Phân chia vai trò User — AI (Gate 2)

| Tiêu chí so sánh | Option A: Diagnostic Quiz (AI-Led) | Option B: Concept Dependency Map (User-Select) | Option C: Socratic Dialogue Probe (2-Turn) |
| :--- | :--- | :--- | :--- |
| **Cơ chế cốt lõi (Mechanism)** | Hệ thống tự động sinh 2 câu trắc nghiệm ngắn dựa trên log lỗi kiểm thử; câu trả lời của user xác định chính xác thẻ ôn tập 60s tương ứng. | AI phân tích lịch sử nộp bài và trực quan hóa thành Cây phụ thuộc kiến thức (Concept Dependency Map) kèm chỉ số nghi vấn; User chủ động bấm chọn nhánh cần ôn. | AI đóng vai trò gia sư gợi mở tư duy, dùng ẩn dụ thực tế (real-world analogy) để học viên tự nhận ra điểm sai logic trong 2 lượt hỏi đáp ngắn. |
| **Vai trò của AI** | Giám khảo chẩn đoán chủ động (Diagnostic Evaluator): Điều hướng quy trình kiểm tra và tổng hợp kết quả. | Radar định hướng & Bằng chứng (Transparent Navigator): Chỉ ra bằng chứng và điểm nghi vấn, giữ vai trò cố vấn. | Đối tác tư duy phản biện (Socratic Coach): Gợi ý góc nhìn, không mớm bài, kích hoạt phản xạ tự suy luận. |
| **Vai trò của User** | Người trả lời khách quan: Làm quiz ngắn để hệ thống khoanh vùng lỗ hổng. | Người ra quyết định tối cao: Tự đánh giá cảm giác tự tin của bản thân, tự chọn node kiến thức và tự kéo slider độ sâu. | Người đối thoại chủ động: Đưa ra nhận định dựa trên gợi ý của AI hoặc yêu cầu chuyển sang đáp án trực tiếp. |
| **Thời gian tương tác kỳ vọng** | ~60 - 90 giây | ~45 - 60 giây | ~60 - 90 giây |

---

## 3. Human Control Analysis (Bảng kiểm soát của người dùng — Gate 3)

| Khía cạnh kiểm soát | Option A: Diagnostic Quiz | Option B: Concept Dependency Map | Option C: Socratic Dialogue Probe |
| :--- | :--- | :--- | :--- |
| **1. Expectation (Kỳ vọng minh bạch)** | Giao diện ghi rõ: "AI sẽ đặt 2 câu hỏi trắc nghiệm nhanh để khoanh vùng lỗ hổng trước khi đưa ra tóm tắt". | Giao diện ghi rõ: "Bản đồ hiển thị 3 khái niệm nền liên quan đến bài tập hiện tại theo mức độ nghi vấn". | Giao diện ghi rõ: "Gia sư AI sẽ đối thoại tối đa 2 câu hỏi gợi mở để bạn tự tìm ra bug". |
| **2. Agency (Quyền chủ động của User)** | User có quyền làm quiz hoặc bấm nút "Bỏ qua quiz → Xem tóm tắt ngay". | User toàn quyền click chọn node bất kỳ, thay đổi lựa chọn bất kỳ lúc nào, tự chọn mức độ giải thích (TL;DR 30s vs Code chuyên sâu). | User chọn câu trả lời nhanh từ gợi ý hoặc tự do gõ phản hồi; có nút "⚡ Giải thích thẳng luôn, đừng hỏi nữa". |
| **3. Evidence & Uncertainty (Bằng chứng & Độ tin cậy)** | Hiển thị: "Dựa trên log kiểm thử 100 requests bị vượt trần. Độ tin cậy chẩn đoán: 82%". | Hiển thị: Chỉ số nghi vấn từng node rõ ràng (Critical Section: 88%, Token Math: 45%, GIL: 15%) kèm trích đoạn log. | Hiển thị: Nêu rõ hiện tượng thực tế từ test case (100 vs 127 requests) làm căn cứ gợi mở câu hỏi. |
| **4. Recovery Path (Đường phục hồi & Thoát hiểm)** | - Bấm "✕ Đóng / Quay lại bài" bất cứ lúc nào.<br>- Bấm "Kiểm tra lại câu hỏi khác" nếu AI chẩn đoán sai. | - Bấm "✕ Đóng / Quay lại bài" ngay lập tức.<br>- Đổi node chọn khác chỉ với 1 cú click. | - Bấm nút khẩn cấp "Giải thích thẳng luôn".<br>- Bấm "✕ Đóng / Quay lại bài" để tiếp tục làm bài. |

---

## 4. Giả định ẩn & Rủi ro kiểm chứng (Assumptions & Risks)

### Option A (Quiz):
- *Giả định:* Học viên sẵn sàng trả lời thêm câu hỏi kiểm tra khi đang cảm thấy bế tắc.
- *Rủi ro:* Nếu học viên đang quá mệt mỏi hoặc ức chế vì bài nộp sai, việc bị "bắt làm trắc nghiệm" có thể gây phản cảm và tăng tỷ lệ bỏ cuộc (drop-out).

### Option B (Concept Map):
- *Giả định:* Học viên có đủ năng lực siêu nhận thức (metacognition) để tự nhận biết mình đang yếu phần nào trong 3 node được hiển thị.
- *Rủi ro:* Học viên mới chuyển ngành (như bạn Linh - Marketing trong Day 17) có thể cảm thấy hoang mang không biết bấm vào đâu nếu cả 3 khái niệm đều xa lạ.

### Option C (Socratic Probe):
- *Giả định:* Ẩn dụ đời thực (ví dụ: ví tiền có 2 người cùng rút) đủ trực quan để kích hoạt sự thông suốt ("Aha!" moment).
- *Rủi ro:* Một số học viên có xu hướng muốn biết ngay kết quả kỹ thuật để sửa code nhanh, có thể cảm thấy ẩn dụ mang tính "vòng vo, tốn thời gian".
