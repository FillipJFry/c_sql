INSERT INTO worker(name, birthday, level, salary) VALUES
 ('Vasya', '1995-02-03', 'Trainee', 100.01),
 ('Fry', '1996-02-29', 'Trainee', 100.02),
 ('Дід Панас', '1901-01-01', 'Senior', 99999.98),
 ('Teamlead', '1988-11-15', 'Senior', 99999.99),
 ('Richard Stallman', '1953-03-16', 'Middle', 85000.15),
 ('Steve Wozniak', '1950-08-11', 'Middle', 99999.98),
 ('Bob', '1982-07-26', 'Junior', 11000.00),
 ('Alice', '2001-04-19', 'Junior', 10000.00),
 ('Carol', '2001-04-19', 'Junior', 10000.00),
 ('Eve', '2001-04-19', 'Junior', 10000.00),
 ('Trent', '1982-09-01', 'Middle', 75000.67);

INSERT INTO client(name) VALUES('Simon'), ('Microsoft'), ('SpaceX'), ('UN'), ('ЗСУ');

INSERT INTO project
 SELECT 1, 'Strong XOR cryptography', id, '2023-01-01', '2023-07-31' FROM client WHERE name = 'Simon'
 UNION
 SELECT 2, 'Windows 12', id, '2023-01-01', '2023-07-31' FROM client WHERE name = 'Microsoft'
 UNION
 SELECT 3, 'bing search engine', id, '2020-08-02', '2023-12-31' FROM client WHERE name = 'Microsoft'
 UNION
 SELECT 4, 'Falcon 9 avionics', id, '2005-02-12', '2008-12-20' FROM client WHERE name = 'SpaceX'
 UNION
 SELECT 5, 'Glaciers orbital observation', id, '2001-10-01', '2002-04-16' FROM client WHERE name = 'UN';

INSERT INTO project
 SELECT 6, 'assault drone', id, '2014-07-01', '2022-07-01' FROM client WHERE name = 'ЗСУ'
 UNION
 SELECT 7, 'Starship flight emulation system', id, '2019-03-01', '2026-12-31' FROM client WHERE name = 'SpaceX'
 UNION
 SELECT 8, 'Minesweeper 3D', id, '2021-09-01', '2021-10-01' FROM client WHERE name = 'Microsoft'
 UNION
 SELECT 9, 'Next generation text editor', id, '1999-01-15', '2007-04-07' FROM client WHERE name = 'UN'
 UNION
 SELECT 10, 'Starlink satelites firmware', id, '2019-03-01', '2026-12-20' FROM client WHERE name = 'SpaceX';

BEGIN TRANSACTION;
CREATE TEMPORARY TABLE proj_worker_name(
 project_id INTEGER NOT NULL,
 worker_name TEXT NOT NULL,
 PRIMARY KEY(project_id, worker_name),
 FOREIGN KEY(project_id) REFERENCES project(id));

INSERT INTO proj_worker_name VALUES
 (1, 'Vasya'), (1, 'Fry'),
 (2, 'Teamlead'), (2, 'Дід Панас'), (2, 'Trent'),
 (3, 'Teamlead'), (3, 'Bob'), (3, 'Alice'), (3, 'Fry'),
 (4, 'Steve Wozniak'),
 (5, 'Steve Wozniak'), (5, 'Eve'),
 (6, 'Дід Панас'), (6, 'Richard Stallman'), (6, 'Alice'),
 (7, 'Steve Wozniak'), (7, 'Teamlead'),
 (8, 'Teamlead'), (8, 'Дід Панас'), (8, 'Trent'),
 (9, 'Richard Stallman'),
 (10, 'Steve Wozniak'), (10, 'Teamlead');

INSERT INTO project_worker
 SELECT p.project_id, w.id
 FROM proj_worker_name p INNER JOIN worker w ON p.worker_name = w.name;

DROP TABLE proj_worker_name;
COMMIT;