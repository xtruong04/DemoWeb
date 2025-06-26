-- Đảm bảo đang dùng đúng CSDL
USE DemoWeb;
GO

-- Thêm Users (2 admin là 'coordinator', 3 volunteer)
INSERT INTO Users (email, password, role, name, phone, address, language_preference) VALUES
(N'admin1@example.com',     N'hashed_password_1', N'coordinator', N'Admin One',      N'0901234567', N'123 Đường A, TP.HCM',   N'Vietnamese'),
(N'admin2@example.com',     N'hashed_password_2', N'coordinator', N'Admin Two',      N'0912345678', N'456 Đường B, Hà Nội',    N'English'),
(N'volunteer1@example.com', N'hashed_password_3', N'volunteer',   N'Volunteer One',  N'0923456789', N'789 Đường C, Đà Nẵng',   N'Vietnamese'),
(N'volunteer2@example.com', N'hashed_password_4', N'volunteer',   N'Volunteer Two',  N'0934567890', N'101 Đường D, Cần Thơ',   N'English'),
(N'volunteer3@example.com', N'hashed_password_5', N'volunteer',   N'Volunteer Three',N'0945678901', N'202 Đường E, Hải Phòng', NULL);
GO

-- Thêm Activities (coordinator_id là 1 và 2 tương ứng với admin)
INSERT INTO Activities (title, description, date_time, location, max_participants, coordinator_id, images) VALUES
(N'Hoạt động tình nguyện 1', N'Mô tả hoạt động 1', '2025-06-20 09:00:00', N'Trường THPT A',     50, 1, N'https://s3.amazonaws.com/activity1.jpg'),
(N'Hoạt động tình nguyện 2', N'Mô tả hoạt động 2', '2025-06-21 14:00:00', N'Công viên B',       30, 2, N'https://s3.amazonaws.com/activity2.jpg'),
(N'Hoạt động tình nguyện 3', N'Mô tả hoạt động 3', '2025-06-22 10:00:00', N'Trung tâm C',       40, 1, N'https://s3.amazonaws.com/activity3.jpg'),
(N'Hoạt động tình nguyện 4', N'Mô tả hoạt động 4', '2025-06-23 13:00:00', N'Nhà văn hóa D',     25, 2, N'https://s3.amazonaws.com/activity4.jpg'),
(N'Hoạt động tình nguyện 5', N'Mô tả hoạt động 5', '2025-06-24 11:00:00', N'Sân vận động E',    60, 1, N'https://s3.amazonaws.com/activity5.jpg');
GO

-- Thêm Registrations (user_id từ 3–5 là volunteer, activity_id từ 1–5)
INSERT INTO Registrations (user_id, activity_id, registration_date, check_in_status) VALUES
(3, 1, '2025-06-15 08:00:00', 0),
(4, 2, '2025-06-16 13:00:00', 1),
(5, 3, '2025-06-17 09:00:00', 0),
(3, 4, '2025-06-18 12:00:00', 1),
(4, 5, '2025-06-19 10:00:00', 0);
GO

-- Thêm Ratings (chỉ volunteer đã đăng ký mới được đánh giá)
INSERT INTO Ratings (user_id, activity_id, rating, comment, created_at) VALUES
(3, 1, 4, N'Hoạt động rất thú vị!',         '2025-06-21 15:00:00'),
(4, 2, 5, N'Tuyệt vời, tổ chức tốt!',       '2025-06-22 16:00:00'),
(5, 3, 3, N'Chấp nhận được.',               '2025-06-23 17:00:00'),
(3, 4, 4, N'Rất hài lòng với địa điểm.',    '2025-06-24 18:00:00'),
(4, 5, 5, N'Hoạt động hoàn hảo!',           '2025-06-25 19:00:00');
GO

-- Thêm Notifications (có thể không bắt buộc phải gắn activity_id)
INSERT INTO Notifications (user_id, activity_id, message, sent_at) VALUES
(3, 1, N'Nhắc nhở: Hoạt động 1 sắp bắt đầu!',  '2025-06-19 08:00:00'),
(4, 2, N'Hoạt động 2 đã được cập nhật!',       '2025-06-20 14:00:00'),
(5, 3, N'Kiểm tra thông tin hoạt động 3.',     '2025-06-21 09:00:00'),
(3, 4, N'Hoạt động 4 đã hoàn tất!',            '2025-06-22 13:00:00'),
(4, 5, N'Tham gia hoạt động 5 ngay!',          '2025-06-23 11:00:00');
GO
