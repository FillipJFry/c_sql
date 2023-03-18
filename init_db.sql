CREATE DATABASE megasoft;

CREATE TABLE worker(
 ID INTEGER AUTO_INCREMENT PRIMARY KEY,
 name TEXT(1000) NOT NULL,
 birthday DATE NOT NULL,
 level ENUM('Trainee','Junior','Middle','Senior') NOT NULL,
 salary DECIMAL(8, 2) NOT NULL);

ALTER TABLE worker ADD CONSTRAINT name_min_length CHECK 2 <= char_length(name);
ALTER TABLE worker ADD CONSTRAINT birthday_lower_limit CHECK birthday >= '1901-01-01';
ALTER TABLE worker ADD CONSTRAINT salary_range CHECK 100 < salary AND salary < 100000;

CREATE TABLE client(
 id INTEGER AUTO_INCREMENT PRIMARY KEY,
 name TEXT(1000) NOT NULL CONSTRAINT name_min_length CHECK (2 <= char_length(name)));

CREATE TABLE project(
 id INTEGER AUTO_INCREMENT PRIMARY KEY,
 client_id INTEGER NOT NULL,
 start_date DATE,
 finish_date DATE,
 CONSTRAINT proj_dates_valid CHECK (start_date <= finish_date),
 FOREIGN KEY(client_id) REFERENCES client(id));

CREATE TABLE project_worker(
 project_id INTEGER NOT NULL,
 worker_id INTEGER NOT NULL,
 PRIMARY KEY(project_id, worker_id),
 FOREIGN KEY(project_id) REFERENCES project(id),
 FOREIGN KEY(worker_id) REFERENCES worker(id));