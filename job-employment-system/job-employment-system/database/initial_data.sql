USE CCCS105;

-- TABLES
CREATE TABLE applicants (
    applicant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

CREATE TABLE jobs (
    job_id INT AUTO_INCREMENT PRIMARY KEY,
    job_title VARCHAR(100),
    company VARCHAR(100),
    salary DECIMAL(10,2)
);

CREATE TABLE applications (
    application_id INT AUTO_INCREMENT PRIMARY KEY,
    applicant_id INT,
    job_id INT,
    status VARCHAR(50),
    FOREIGN KEY (applicant_id) REFERENCES applicants(applicant_id) ON DELETE CASCADE,
    FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE CASCADE
);

-- SAMPLE DATA (50+ RECORDS)

-- APPLICANTS
INSERT INTO applicants (name,email,phone) VALUES
('John Doe','john1@gmail.com','09111111111'),
('Jane Smith','jane2@gmail.com','09222222222'),
('Mark Lee','mark3@gmail.com','09333333333'),
('Anna Cruz','anna4@gmail.com','09444444444'),
('Paul Reyes','paul5@gmail.com','09555555555'),
('Chris Tan','chris6@gmail.com','09666666666'),
('Liza Wong','liza7@gmail.com','09777777777'),
('Kevin Lim','kevin8@gmail.com','09888888888'),
('Sara Ali','sara9@gmail.com','09999999999'),
('Tom Hardy','tom10@gmail.com','09101010101'),

('User11','user11@gmail.com','09111111112'),
('User12','user12@gmail.com','09111111113'),
('User13','user13@gmail.com','09111111114'),
('User14','user14@gmail.com','09111111115'),
('User15','user15@gmail.com','09111111116'),
('User16','user16@gmail.com','09111111117'),
('User17','user17@gmail.com','09111111118'),
('User18','user18@gmail.com','09111111119'),
('User19','user19@gmail.com','09111111120'),
('User20','user20@gmail.com','09111111121'),

('User21','user21@gmail.com','09111111122'),
('User22','user22@gmail.com','09111111123'),
('User23','user23@gmail.com','09111111124'),
('User24','user24@gmail.com','09111111125'),
('User25','user25@gmail.com','09111111126'),
('User26','user26@gmail.com','09111111127'),
('User27','user27@gmail.com','09111111128'),
('User28','user28@gmail.com','09111111129'),
('User29','user29@gmail.com','09111111130'),
('User30','user30@gmail.com','09111111131'),

('User31','user31@gmail.com','09111111132'),
('User32','user32@gmail.com','09111111133'),
('User33','user33@gmail.com','09111111134'),
('User34','user34@gmail.com','09111111135'),
('User35','user35@gmail.com','09111111136'),
('User36','user36@gmail.com','09111111137'),
('User37','user37@gmail.com','09111111138'),
('User38','user38@gmail.com','09111111139'),
('User39','user39@gmail.com','09111111140'),
('User40','user40@gmail.com','09111111141'),

('User41','user41@gmail.com','09111111142'),
('User42','user42@gmail.com','09111111143'),
('User43','user43@gmail.com','09111111144'),
('User44','user44@gmail.com','09111111145'),
('User45','user45@gmail.com','09111111146'),
('User46','user46@gmail.com','09111111147'),
('User47','user47@gmail.com','09111111148'),
('User48','user48@gmail.com','09111111149'),
('User49','user49@gmail.com','09111111150'),
('User50','user50@gmail.com','09111111151');

-- JOBS
INSERT INTO jobs (job_title, company, salary) VALUES
('Software Developer','TechCorp',50000),
('Data Analyst','DataWorks',45000),
('Web Developer','Webify',40000),
('System Admin','NetSecure',42000),
('UI Designer','Creative Inc',38000),
('Backend Developer','CodeBase',48000),
('QA Tester','SoftTest',35000),
('Mobile Developer','AppDev',47000),
('IT Support','HelpDesk',30000),
('Project Manager','BizManage',60000);

-- APPLICATIONS (randomized links)
INSERT INTO applications (applicant_id, job_id, status) VALUES
(1,1,'Pending'),(2,2,'Accepted'),(3,3,'Rejected'),
(4,1,'Pending'),(5,2,'Accepted'),(6,3,'Rejected'),
(7,4,'Pending'),(8,5,'Accepted'),(9,6,'Rejected'),
(10,7,'Pending'),(11,8,'Accepted'),(12,9,'Rejected'),
(13,10,'Pending'),(14,1,'Accepted'),(15,2,'Rejected'),
(16,3,'Pending'),(17,4,'Accepted'),(18,5,'Rejected'),
(19,6,'Pending'),(20,7,'Accepted'),(21,8,'Rejected'),
(22,9,'Pending'),(23,10,'Accepted'),(24,1,'Rejected'),
(25,2,'Pending'),(26,3,'Accepted'),(27,4,'Rejected'),
(28,5,'Pending'),(29,6,'Accepted'),(30,7,'Rejected'),
(31,8,'Pending'),(32,9,'Accepted'),(33,10,'Rejected'),
(34,1,'Pending'),(35,2,'Accepted'),(36,3,'Rejected'),
(37,4,'Pending'),(38,5,'Accepted'),(39,6,'Rejected'),
(40,7,'Pending'),(41,8,'Accepted'),(42,9,'Rejected'),
(43,10,'Pending'),(44,1,'Accepted'),(45,2,'Rejected'),
(46,3,'Pending'),(47,4,'Accepted'),(48,5,'Rejected'),
(49,6,'Pending'),(50,7,'Accepted');