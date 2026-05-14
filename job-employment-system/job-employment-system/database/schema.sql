CREATE DATABASE IF NOT EXISTS CCCS105;

USE CCCS105;

-- =========================
-- APPLICANTS TABLE
-- =========================

CREATE TABLE applicants (

    applicant_id INT AUTO_INCREMENT PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    email VARCHAR(100) NOT NULL UNIQUE,

    phone VARCHAR(20) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- =========================
-- JOBS TABLE
-- =========================

CREATE TABLE jobs (

    job_id INT AUTO_INCREMENT PRIMARY KEY,

    job_title VARCHAR(100) NOT NULL,

    company VARCHAR(100) NOT NULL,

    salary DECIMAL(10,2) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP

);

-- =========================
-- APPLICATIONS TABLE
-- =========================

CREATE TABLE applications (

    application_id INT AUTO_INCREMENT PRIMARY KEY,

    applicant_id INT NOT NULL,

    job_id INT NOT NULL,

    status VARCHAR(50) NOT NULL,

    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (applicant_id)
        REFERENCES applicants(applicant_id),

    FOREIGN KEY (job_id)
        REFERENCES jobs(job_id)

);