# Group Feedback Synthesis — AI Tutor Diagnostic Refresher

- **Nhóm:** Nhóm 2A — Case A: Diagnostic Refresher
- **Thành viên nhóm:** Phạm Thành Đạt (Lead & Facilitator Session 1), Thành viên 2 (Facilitator Session 2), Thành viên 3 (Facilitator Session 3).
- **Tổng số phiên thử nghiệm:** 3 phiên độc lập với 3 tester ngoài nhóm hoàn toàn khác nhau về nền tảng chuyên môn.

---

## 1. Dữ liệu tổng hợp từ 3 Phiên Thử Nghiệm

| Thông tin phiên | Phiên 1 (Phạm Thành Đạt facilitate) | Phiên 2 (Thành viên 2 facilitate) | Phiên 3 (Thành viên 3 facilitate) |
| :--- | :--- | :--- | :--- |
| **Tester ngoài nhóm** | **Nguyễn Hoàng Nam** (26 tuổi, Backend Engineer đang học AI) | **Nguyễn Thu Thảo** (22 tuổi, Sinh viên năm cuối ngành Hệ thống thông tin) | **Lê Minh Trí** (24 tuổi, Data / Business Analyst học AI thực chiến) |
| **Hành vi nổi bật** | Ưa chuộng Option B; đổi ngay sang xem code so sánh; dùng nút chuyển độ sâu 30s. | Khởi đầu e ngại khi thấy code; thích Option C vì ví dụ ẩn dụ ví tiền trực quan và dễ hiểu; đánh giá cao nút giải thích thẳng. | Đánh giá cao Option A vì tính chất xác thực khách quan bằng bài test ngắn; cảm thấy an tâm khi AI kiểm tra kiến thức trước khi chẩn đoán. |
| **Độ ưu tiên lựa chọn** | Option B > Option A > Option C | Option C > Option B > Option A | Option A > Option B > Option C |

---

## 2. Các Mẫu Hành Vi Đồng Thuận (Cross-Tester Patterns)

1. **Yêu cầu sống còn về Tốc độ và Không làm đứt gãy luồng học:**
   - Cả 3 tester đều nhấn mạnh rằng khi đang dở bài tập, họ không muốn phải đọc tài liệu lý thuyết dài quá 1 trang hay xem video dài.
   - Thao tác hỗ trợ bổ trợ bắt buộc phải gói gọn dưới **90 giây** và phải có nút bấm **"Quay lại bài tập"** hiển thị rõ ràng ở mọi trạng thái.

2. **Minh bạch bằng chứng (Evidence Transparency) tạo dựng niềm tin:**
   - Cả 3 tester đều cảm thấy tin cậy hơn khi AI giải thích lý do chẩn đoán dựa trên kết quả chạy test case cụ thể (100 vs 127 requests), thay vì chỉ đưa ra câu kết luận chung chung.

3. **Cần đường thoát hiểm khẩn cấp (Emergency Recovery):**
   - Các tính năng như "Bỏ qua quiz" (Option A), "Đổi độ sâu TL;DR" (Option B), và "Giải thích thẳng luôn" (Option C) đều được tester sử dụng hoặc đánh giá là điểm mấu chốt giúp họ không cảm thấy bị AI "giam cầm" hoặc ép buộc.

---

## 3. Các Điểm Khác Biệt Đáng Chú Ý (Divergences)

1. **Mức độ sẵn sàng giải trắc nghiệm (Diagnostic Quiz) phân hóa theo tâm trạng:**
   - Với tester có tính cách phân tích hệ thống (Trí), quiz 2 câu là công cụ tuyệt vời để tự thẩm định kiến thức.
   - Ngược lại, với tester đang có tâm lý ức chế vì debug nhiều lần không ra lỗi (Nam & Thảo), việc xuất hiện quiz có thể tạo cảm giác bị "chấm điểm" và làm tăng áp lực nhận thức nếu không có nút bỏ qua dễ thấy.

2. **Khoảng cách nhận thức giữa Kỹ sư kỹ thuật và Dân chuyển ngành/BA:**
   - Kỹ sư công nghệ (Nam) muốn xem ngay diff code và nguyên lý Mutex phạm vi khóa.
   - Người có nền tảng phân tích/kinh doanh (Trí & Thảo) cần ẩn dụ đời thường (ví dụ hai người cùng rút tiền ở Option C) trước khi có thể hiểu được thuật toán Mutex trong code.

---

## 4. One Group Next Change (Thay đổi then chốt tiếp theo dựa trên bằng chứng)

> **Thay đổi cốt lõi được thống nhất:**  
> **Tích hợp Cơ chế Lai (Hybrid Diagnostic Flow): Khởi đầu bằng Bản đồ Khái niệm kèm Điểm Nghi vấn (từ Option B), nhưng cho phép mở rộng 1 câu hỏi gợi mở dạng Socratic (từ Option C) ngay trên Node được chọn.**

- **Căn cứ từ bằng chứng thực nghiệm:** Option B cho người học quyền kiểm soát tốt nhất (Agency), nhưng với học viên non-tech, họ cần thêm một câu hỏi gợi ý tư duy đời thường (như Option C) để giải mã node kiến thức đó mà không bị ngợp thuật ngữ.
- **Cam kết không nói quá bằng chứng (No Overclaiming):** Thay đổi này nhằm tối ưu hóa thời gian tiếp cận và sự tự tin của học viên, **chưa khẳng định** sẽ giải quyết được 100% tỷ lệ hoàn thành bài tập nâng cao.

---

## 5. Những Điểm Vẫn Chưa Được Kiểm Chứng (Still Unproven)

1. **Hiệu quả chuyển hóa dài hạn (Knowledge Retention):** Liệu việc học viên hiểu bài và sửa xong bài tập ngay lúc đó (trong < 2 phút) có giúp họ ghi nhớ khái niệm nền lâu dài hay chỉ là giải pháp tình thế để vượt qua bài test?
2. **Khả năng chẩn đoán tự động trên các bài tập mở / phức tạp:** Trong lab thực hành với test case rõ ràng, AI dễ dàng bắt được lỗi Race Condition. Liệu với các bài tập lớn không có test case chuẩn hóa, độ chính xác chẩn đoán của AI có đủ cao để không gây hiểu nhầm cho học viên hay không?
3. **Mức độ phụ thuộc vào AI Tutor:** Liệu tính năng này có vô tình tạo thói quen ỷ lại khiến học viên bấm nút "Tôi vẫn chưa hiểu" liên tục thay vì tự rèn luyện kỹ năng đọc log và debug độc lập?
