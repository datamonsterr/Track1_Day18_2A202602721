# Prototype Feedback Note — Phiên Thử Nghiệm Cá Nhân

- **Người điều phối (Facilitator):** Phạm Thành Đạt (MHV: 2A202602721)
- **Người tham gia thử nghiệm (Tester ngoài nhóm):** Nguyễn Hoàng Nam (26 tuổi — Backend Engineer đang học chuyển tiếp AI/ML, không thuộc nhóm làm dự án)
- **Thời gian & Hình thức:** 10:15 - 10:45 AM, Phiên trực tiếp kết hợp quan sát màn hình tương tác.
- **Kịch bản thực hiện:** Tester thực hiện toàn bộ quy trình trên bài tập LangChain RAG Indexing (Embedding Dimension & Cosine Similarity) mà không có sự giải thích hay can thiệp trước từ Facilitator (Gate 4 compliance).

---

## 1. Nhật ký Quan sát chi tiết theo từng Phương án

### Option A: Diagnostic Refresher (AI-Led mini-quiz 2 câu)
- **Hành vi quan sát được:**
  - Sau khi bấm "Tôi vẫn chưa hiểu", tester đọc ngay dòng kỳ vọng: *"AI sẽ đặt 2 câu hỏi trắc nghiệm nhanh để tìm lỗ hổng trong 60s"*.
  - Tester mất khoảng 20 giây để chọn đáp án Câu 1 (chọn phương án B: số lượng tọa độ toán học). Ở Câu 2 (Cosine Similarity), tester đọc nhanh và chọn phương án A (đo góc giữa 2 vector).
  - Sau khi bấm nộp bài, Refresher Card hiện ra. Tester dừng lại đọc đoạn tóm tắt và gật đầu đồng ý.
- **Phát biểu thành tiếng (Exact Quotes):**
  - *"Lúc đầu tôi hơi khựng lại vì nghĩ 'Đang làm bài tập tự nhiên lại bắt làm trắc nghiệm nữa?'. Nhưng 2 câu này hỏi trúng ngay rào cản phân biệt giữa số từ và số chiều, nên làm xong tôi cảm thấy rất tự tin."*
  - *"Thẻ tóm tắt 60s rất cô đọng, có cả công thức hình học trực quan."*
- **Sử dụng quyền kiểm soát (Human Control):**
  - Tester nhìn thấy nút *"Bỏ qua chẩn đoán, quay lại bài"* và ghi nhận đây là đường thoát tốt nếu người học đang vội.
  - Sau khi đọc xong, tester bấm nút *"Đã hiểu! Quay lại bài học"* và trở về đúng màn hình code.

---

### Option B: Knowledge Checklist (User-Led drawer phân rã kiến thức)
- **Hành vi quan sát được:**
  - Tester mở drawer "Mắt xích kiến thức nền bài này". Mắt xích đầu tiên đang được tick chọn mặc định.
  - Tester tò mò bấm vào Mắt xích 2 (`[ ] Vector Dimension (1536 chiều là gì?)`) và Mắt xích 3 (`[ ] Cosine Similarity tính thế nào?`). Nội dung micro-lesson bên dưới lập tức đổi tương ứng.
  - Tester đọc phần ELI5 Visual Guide giải thích về việc vector luôn cố định chiều bất kể độ dài văn bản.
- **Phát biểu thành tiếng (Exact Quotes):**
  - *"Phương án này cho tôi cảm giác hoàn toàn làm chủ! Tôi không thích bị máy hỏi bài, tôi thích tự mở bảng mục lục kiến thức nền để xem mình đang quên chỗ nào."*
  - *"Phần giải thích ví dụ từ 'Vua' với 'Hoàng hậu' rất trực quan, dân mới học đọc vào là hiểu ngay bản chất vector embedding."*
- **Sử dụng quyền kiểm soát (Human Control):**
  - Tester thử bỏ tick và tick lại các mục; kiểm tra nút *"Mở bài giảng gốc trong giáo trình"* và nút *"Đóng drawer"* hoạt động nhanh chóng.

---

### Option C: A/B Contrast & Escalation (Đối chiếu cách hiểu & Kết nối Mentor)
- **Hành vi quan sát được:**
  - Tester đọc 2 kịch bản tương phản và bật cười khi thấy Cách hiểu A: *"Ủa cái này đúng là cái tôi từng nghĩ hồi mới học NLP này, tưởng 1536 từ!"*.
  - Tester bấm chọn Cách hiểu B, hệ thống hiển thị xác nhận và phân tích điểm khác biệt giữa Token Count và Embedding Dimension.
  - Tester xem qua phần Escalation và bấm thử nút *"Gửi ticket hỗ trợ 1-1 cho Trợ giảng"*. Khi hộp thoại xác nhận hiện ra liệt kê đúng bài học và mã nguồn liên quan, tester ấn hủy để test tính năng phục hồi.
- **Phát biểu thành tiếng (Exact Quotes):**
  - *"Cách tiếp cận tương phản A vs B này cực kỳ hiệu quả để trị bệnh ngộ nhận! Nhiều khi học viên không biết mình hiểu sai cho đến khi nhìn thấy câu ngộ nhận viết rành rành ra đó."*
  - *"Có nút gửi Trợ giảng kèm tóm tắt context là một 'lưới an toàn' tâm lý rất tốt cho học viên non-tech."*
- **Sử dụng quyền kiểm soát (Human Control):**
  - Tester xác nhận luồng preview ticket trước khi gửi giúp người học hoàn toàn kiểm soát việc chia sẻ dữ liệu với Mentor.

---

## 2. Đánh giá So sánh từ Tester (Tester Synthesis)
- **Xếp hạng mức độ ưa thích:** Option B (Checklist) > Option C (A/B Contrast) > Option A (Quiz).
- **Lý do:** Tester đánh giá cao **sự chủ động (User Agency)** của Option B và **tính phản biện nhận thức (Cognitive Impact)** của Option C; trong khi Option A dù chẩn đoán chính xác nhưng vẫn mang tính "ép buộc thi cử".

---

## 3. Bài học & Thay đổi đề xuất từ phiên điều phối (Facilitator Takeaways)
1. **Next Change cụ thể:** Kết hợp ưu điểm của Option B và Option C thành một luồng thống nhất: Giao diện hiển thị Knowledge Checklist (Option B), nhưng khi click vào từng mắt xích, hiển thị nội dung dạng đối chiếu ngộ nhận A vs B (Option C) để tăng độ sâu tiếp thu.
2. **Still Unproven:** Liệu học viên non-tech khi tự duyệt checklist (Option B) có khả năng tự nhận biết chính xác mắt xích mình đang yếu hay sẽ tick bừa nếu gặp quá nhiều thuật ngữ kỹ thuật mới?
