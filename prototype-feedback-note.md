# Prototype Feedback Note — Phiên Thử Nghiệm Cá Nhân

- **Người điều phối (Facilitator):** Phạm Thành Đạt (MHV: 2A202602721)
- **Người tham gia thử nghiệm (Tester ngoài nhóm):** Nguyễn Hoàng Nam (26 tuổi — Backend Engineer đang học chuyển tiếp AI/ML, không thuộc nhóm làm dự án)
- **Thời gian & Hình thức:** 10:15 - 10:45 AM, Phiên trực tiếp kết hợp quan sát màn hình tương tác.
- **Kịch bản thực hiện:** Tester thực hiện toàn bộ quy trình trên bài tập Rate Limiter mà không có sự giải thích hay can thiệp trước từ Facilitator (Gate 4 compliance).

---

## 1. Nhật ký Quan sát chi tiết theo từng Phương án

### Option A: Diagnostic Quiz (AI chủ động dẫn dắt qua 2 câu trắc nghiệm)
- **Hành vi quan sát được:**
  - Sau khi bấm "Tôi vẫn chưa hiểu", tester đọc ngay phần *Bằng chứng hệ thống* và gật đầu: *"À, nó bảo dựa trên lần chạy 100 requests bị trần"*.
  - Tester mất khoảng 25 giây để đọc và chọn đáp án cho Câu 1. Đến Câu 2, tester đọc nhanh hơn và chọn ngay phương án A.
  - Sau khi bấm "Nộp câu trả lời", thẻ ôn tập 60s hiện ra. Tester dừng lại đọc rất kỹ đoạn code so sánh giữa cách làm sai và cách sửa đúng.
- **Phát biểu thành tiếng (Exact Quotes):**
  - *"Lúc đầu tôi hơi khựng lại vì nghĩ 'Ủa đang làm bài tập sai bực mình lại bắt làm trắc nghiệm nữa hả?'. Nhưng 2 câu này hỏi trúng ngay chỗ tôi đang phân vân nên làm xong cảm thấy rất chắc chắn là mình đã sai ở đâu."*
  - *"Cái thẻ ôn tập 60s sau đó rất gọn, không phải đọc cả trang lý thuyết dài dòng."*
- **Sử dụng quyền kiểm soát (Human Control):**
  - Tester nhận thấy dòng *"Bỏ qua bài kiểm tra → Xem giải thích ngay"* nhưng chọn không bấm vì muốn thử xem AI chấm mình đúng hay sai.
  - Sau khi xem xong, tester bấm nút *"Đã hiểu! Quay lại sửa bài tập"* và quay lại màn hình code mượt mà.

---

### Option B: Concept Dependency Map (Bản đồ phụ thuộc khái niệm & Tự chọn)
- **Hành vi quan sát được:**
  - Tester ngay lập tức bị thu hút bởi chỉ số phần trăm nghi vấn màu đỏ `[Nghi vấn cao: 88%]`.
  - Không cần suy nghĩ nhiều, tester click ngay vào Node 1 (Critical Section & Mutex Scope).
  - Khi khung nội dung mở ra, tester thấy thanh chọn độ sâu (Depth Select) và tò mò đổi thử từ "Chi tiết kỹ thuật" sang "TL;DR 30s".
- **Phát biểu thành tiếng (Exact Quotes):**
  - *"Giao diện này cho tôi cảm giác làm chủ hoàn toàn. Tôi là kỹ sư nên tôi thích nhìn thấy bức tranh tổng thể các khái niệm liên quan trước rồi tự quyết định đọc cái nào."*
  - *"Cái nút chuyển độ sâu 30s rất đắt giá! Lúc đang vội sửa bug tôi chỉ cần đọc 2 dòng tóm tắt đó là đủ code tiếp, không cần phải đọc giải thích dài."*
- **Sử dụng quyền kiểm soát (Human Control):**
  - Tester thử bấm sang Node 2 (Token Refill Math) để kiểm tra xem nội dung có đổi không, sau đó quay lại Node 1.
  - Tester nhận xét: *"Rất thích việc có thể đổi qua lại giữa các node mà không bị mất dấu hay phải tải lại trang"*.

---

### Option C: Socratic Dialogue Probe (Đối thoại gợi mở 2 lượt)
- **Hành vi quan sát được:**
  - Khi AI đưa ra ví dụ ẩn dụ về "hai người cùng nhìn vào ví tiền 100k", tester bật cười: *"Ví dụ này hài hước và dễ hiểu ghê"*.
  - Tester click chọn câu trả lời A ("Cả hai đều rút được khiến ví bị âm tiền").
  - AI phản hồi giải thích ngay về hiện tượng Race Condition tương ứng trong code.
  - Tiếp theo, tester thử ấn vào nút khẩn cấp *"⚡ Giải thích thẳng luôn, đừng hỏi nữa"* để kiểm tra chức năng cứu cánh.
- **Phát biểu thành tiếng (Exact Quotes):**
  - *"Cái này cực kỳ hợp với các bạn mới học lập trình hoặc học viên non-tech, vì ví dụ đời thường làm tan biến nỗi sợ thuật toán."*
  - *"Tuy nhiên nếu là người đã có kinh nghiệm và chỉ đang đãng trí quên thụt lề code, việc phải đọc câu hỏi gợi mở có thể khiến họ thấy hơi mất kiên nhẫn. Rất may là có cái nút 'Giải thích thẳng luôn'."*
- **Sử dụng quyền kiểm soát (Human Control):**
  - Nút giải thích thẳng hoạt động tức thì, hiển thị ngay chỉ dẫn sửa lỗi dòng 18-20.

---

## 2. Đánh giá So sánh từ Tester (Tester Synthesis)
- **Xếp hạng mức độ ưa thích:** Option B (Concept Map) > Option A (Quiz) > Option C (Socratic).
- **Lý do:** Tester đánh giá cao **tính minh bạch (transparency) và tốc độ (speed)** của Option B, vì nó vừa tôn trọng quyền tự chủ của người học, vừa đưa ra chỉ số bằng chứng định lượng rõ ràng.

---

## 3. Bài học & Thay đổi đề xuất từ phiên điều phối (Facilitator Takeaways)
1. **Next Change cụ thể:** Cần bổ sung khả năng **tự động ghi nhớ độ sâu ưa thích** (ví dụ nếu người học là dân kỹ thuật, mặc định hiển thị tab Code So Sánh; nếu người học non-tech, mặc định hiển thị TL;DR trực quan).
2. **Still Unproven:** Liệu người học non-tech (như bạn Linh - Marketing trong Day 17) khi nhìn thấy Bản đồ khái niệm (Option B) có tự tin chọn đúng node hay sẽ bị ngợp bởi các thuật ngữ chuyên ngành? Cần kiểm chứng thêm với nhóm học viên chuyển ngành.
