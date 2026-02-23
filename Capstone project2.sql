CREATE DATABASE mistaff_recordsnistry_health_db;

USE ministry_health_db;

CREATE TABLE staff_records (
  staff_id VARCHAR(50) NOT NULL,
  age INT,
  gender VARCHAR(10),
  department VARCHAR(50),
  job_tittle VARCHAR(50),
  experience INT,
  salary INT,
  training VARCHAR(10),
  performance_score DECIMAL(20,6),
  hospital_type VARCHAR(50),
  state VARCHAR(50),
  state_id VARCHAR(50),
  attendance DECIMAL(20,6)
);

CREATE TABLE state_metrics (
  staff_id VARCHAR(50),
  state_id VARCHAR(30),
  state_name VARCHAR(50)
);

CREATE TABLE training_logs (
  staff_id VARCHAR(50),
  training VARCHAR(10)
);

-- Inserting colunms to their appropriate table
INSERT INTO state_metrics (Staff_id, State_id, State_name)
SELECT staff_id, state_id, state
FROM staff_records;

INSERT INTO training_logs (Staff_id, training)
SELECT staff_id, training
FROM staff_records;

-- Deleting the colunms that have been inserted to their appropriate table
ALTER TABLE staff_records
DROP COLUMN state,
DROP COLUMN training;
