USE CCCS105;

INSERT INTO applicants
(name, email, phone)
VALUES
('John Doe', 'john@gmail.com', '09123456789'),

('Maria Santos', 'maria@gmail.com', '09987654321');

INSERT INTO jobs
(job_title, company, salary)
VALUES
('Web Developer', 'Tech Corp', 25000),

('Database Administrator', 'DataSys', 30000);

INSERT INTO applications
(applicant_id, job_id, status)
VALUES
(1, 1, 'Pending'),

(2, 2, 'Approved');