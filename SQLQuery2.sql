-- Tạo database
CREATE DATABASE DemoWeb;
GO
USE DemoWeb;
GO

-- Bảng Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY IDENTITY(1,1),
    email NVARCHAR(255) NOT NULL UNIQUE,
    password NVARCHAR(255) NOT NULL, -- Hashed password stored
    role NVARCHAR(20) NOT NULL CHECK (role IN (N'volunteer', N'coordinator')),
    name NVARCHAR(100) NOT NULL,
    phone NVARCHAR(20),
    address NVARCHAR(255),
    language_preference NVARCHAR(50),
    CONSTRAINT CHK_LanguagePreference CHECK (
        language_preference IN (N'English', N'Vietnamese') OR language_preference IS NULL
    )
);
GO
-- Bảng Activities
CREATE TABLE Activities (
    activity_id INT PRIMARY KEY IDENTITY(1,1),
    title NVARCHAR(200) NOT NULL,
    description NVARCHAR(MAX),
    date_time DATETIME NOT NULL,
    location NVARCHAR(255),
    max_participants INT NOT NULL CHECK (max_participants >= 0),
    coordinator_id INT NOT NULL,
    images NVARCHAR(500), -- URL hoặc đường dẫn ảnh
    FOREIGN KEY (coordinator_id) REFERENCES Users(user_id) ON DELETE CASCADE
);
GO
-- Bảng Registrations
CREATE TABLE Registrations (
    registration_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    activity_id INT NOT NULL,
    registration_date DATETIME DEFAULT GETDATE(),
    check_in_status BIT NOT NULL DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE NO ACTION,
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id) ON DELETE NO ACTION,
    CONSTRAINT UC_Registration UNIQUE (user_id, activity_id)
);
GO
-- Bảng Ratings
CREATE TABLE Ratings (
    rating_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    activity_id INT NOT NULL,
    rating TINYINT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment NVARCHAR(500),
    created_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE NO ACTION,
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id) ON DELETE NO ACTION
);
GO
-- Bảng Notifications
CREATE TABLE Notifications (
    notification_id INT PRIMARY KEY IDENTITY(1,1),
    user_id INT NOT NULL,
    activity_id INT,
    message NVARCHAR(1000) NOT NULL,
    sent_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE NO ACTION,
    FOREIGN KEY (activity_id) REFERENCES Activities(activity_id) ON DELETE NO ACTION
);
GO
-- Tạo các chỉ mục
CREATE INDEX IDX_Registrations_UserActivity ON Registrations(user_id, activity_id);
GO
CREATE INDEX IDX_Ratings_UserActivity ON Ratings(user_id, activity_id);
GO
CREATE INDEX IDX_Notifications_User ON Notifications(user_id);
GO
CREATE INDEX IDX_Activities_DateTime ON Activities(date_time);
GO
CREATE INDEX IDX_Users_Email ON Users(email);