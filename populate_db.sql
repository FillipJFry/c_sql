INSERT INTO worker(name, birthday, level, salary) VALUES
 ('Vasya', '1995-02-03', 'Trainee', 100.01),
 ('Fry', '1996-02-29', 'Trainee', 100.02),
 ('Old fart', '1901-01-01', 'Senior', 99999.98),
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
 SELECT 1, id, '2023-01-01', '2023-07-31' FROM client WHERE name = 'Simon'
 UNION
 SELECT 2, id, '2023-01-01', '2023-07-31' FROM client WHERE name = 'Microsoft'
 UNION
 SELECT 3, id, '2020-08-02', '2023-12-31' FROM client WHERE name = 'Microsoft'
 UNION
 SELECT 4, id, '2005-02-12', '2008-12-20' FROM client WHERE name = 'SpaceX'
 UNION
 SELECT 5, id, '2001-10-01', '2002-04-16' FROM client WHERE name = 'UN';

INSERT INTO project
 SELECT 6, id, '2014-07-01', '2024-06-01' FROM client WHERE name = 'ЗСУ'
 UNION
 SELECT 7, id, '2019-03-01', '2026-12-31' FROM client WHERE name = 'SpaceX'
 UNION
 SELECT 8, id, '2021-09-01', '2021-10-01' FROM client WHERE name = 'Microsoft'
 UNION
 SELECT 9, id, '1999-01-15', '2007-07-07' FROM client WHERE name = 'UN'
 UNION
 SELECT 10, id, '2019-03-01', '2026-12-20' FROM client WHERE name = 'SpaceX';

INSERT INTO proj_worker_name
 SELECT 1, id FROM worker WHERE name = 'Vasya'
 UNION
 SELECT 1, id FROM worker WHERE name = 'Fry'
 UNION
 SELECT 2, id FROM worker WHERE name = 'Teamlead'
 UNION
 SELECT 2, id FROM worker WHERE name = 'Old fart'
 UNION
 SELECT 2, id FROM worker WHERE name = 'Trent'
 UNION
 SELECT 3, id FROM worker WHERE name = 'Teamlead'
 UNION
 SELECT 3, id FROM worker WHERE name = 'Bob'
 UNION
 SELECT 3, id FROM worker WHERE name = 'Alice'
 UNION
 SELECT 3, id FROM worker WHERE name = 'Fry'
 UNION
 SELECT 4, id FROM worker WHERE name = 'Steve Wozniak'
 UNION
 SELECT 5, id FROM worker WHERE name = 'Steve Wozniak'
 UNION
 SELECT 5, id FROM worker WHERE name = 'Eve';
 UNION
 SELECT 6, id FROM worker WHERE name = 'Old fart'
 UNION
 SELECT 6, id FROM worker WHERE name = 'Richard Stallman'
 UNION
 SELECT 6, id FROM worker WHERE name = 'Alice'
 UNION
 SELECT 7, id FROM worker WHERE name = 'Steve Wozniak'
 UNION
 SELECT 7, id FROM worker WHERE name = 'Teamlead'
 UNION
 SELECT 8, id FROM worker WHERE name = 'Teamlead'
 UNION
 SELECT 8, id FROM worker WHERE name = 'Old fart'
 UNION
 SELECT 8, id FROM worker WHERE name = 'Trent'
 UNION
 SELECT 9, id FROM worker WHERE name = 'Richard Stallman'
 UNION
 SELECT 7, id FROM worker WHERE name = 'Steve Wozniak'
 UNION
 SELECT 7, id FROM worker WHERE name = 'Teamlead';