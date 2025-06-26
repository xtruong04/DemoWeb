-- Bảng cho Reasons
USE DemoWeb
CREATE TABLE reasons (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(100),
    description NTEXT,
    image_url NVARCHAR(255)
);

CREATE TABLE causes (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(100),
    description NTEXT,
    image_url NVARCHAR(255),
    raised DECIMAL(10, 2),
    goal DECIMAL(10, 2)
);

CREATE TABLE volunteers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name NVARCHAR(100),
    role NVARCHAR(50),
    image_url NVARCHAR(255),
    facebook_url NVARCHAR(255),
    pinterest_url NVARCHAR(255),
    linkedin_url NVARCHAR(255),
    twitter_url NVARCHAR(255)
);

CREATE TABLE news (
    id INT IDENTITY(1,1) PRIMARY KEY,
    title NVARCHAR(100),
    date DATE,
    description NTEXT,
    image_url NVARCHAR(255),
    link NVARCHAR(255)
);

GO
INSERT INTO reasons (title, description, image_url) VALUES
('Collecting Fund', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print.', 'resources/img/help/1.png'),
('Blood Camp', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print.', 'resources/img/help/2.png'),
('Friendly Volunteer', 'Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print.', 'resources/img/help/3.png');
GO
INSERT INTO causes (title, description, image_url, raised, goal) VALUES
('Help us to Send Food', 'The passage is attributed to an unknown typesetter in the century who is thought', 'resources/img/causes/1.png', 5000.00, 9000.00),
('Clothes For Everyone', 'The passage is attributed to an unknown typesetter in the century who is thought', 'resources/img/causes/2.png', 5000.00, 9000.00),
('Water For All Children', 'The passage is attributed to an unknown typesetter in the century who is thought', 'resources/img/causes/3.png', 5000.00, 9000.00);
GO
INSERT INTO volunteers (name, role, image_url, facebook_url, pinterest_url, linkedin_url, twitter_url) VALUES
('Sakil Khan', 'Volunteer', 'resources/img/volenteer/1.png', '#', '#', '#', '#'),
('Emran Ahmed', 'Volunteer', 'resources/img/volenteer/2.png', '#', '#', '#', '#'),
('Sabbir Ahmed', 'Volunteer', 'resources/img/volenteer/3.png', '#', '#', '#', '#'),
(N'Đào Anh Quốc', 'Volunteer', 'resources/img/volenteer/4.jpg', 'https://www.facebook.com/quoc.anh.908826', '#', '#', '#');
GO
INSERT INTO news (title, date, description, image_url, link) VALUES
('Pure Water Is More Essential', '2019-07-18', 'The passage experienced a surge in popularity during the 1960s when used it on their sheets, and again.', 'resources/img/news/1.png', 'single-blog.html'),
('Pure Water Is More Essential', '2019-07-18', 'The passage experienced a surge in popularity during the 1960s when used it on their sheets, and again.', 'resources/img/news/2.png', 'single-blog.html');

DROP TABLE IF EXISTS news;
DROP TABLE IF EXISTS volunteers;
DROP TABLE IF EXISTS causes;
DROP TABLE IF EXISTS reasons;
INSERT INTO volunteers (name, role, image_url, facebook_url, pinterest_url, linkedin_url, twitter_url)
VALUES (N'Nguyễn Văn A', N'Tình nguyện viên mới', 'resources/img/volenteer/6.jpg', '#', '#', '#', '#');