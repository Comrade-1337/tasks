-- creating Table; Name person


CREATE TABLE IF NOT EXISTS person(
	id VARCHAR(20) PRIMARY KEY,
	name VARCHAR(30) NOT NULL,
	mail VARCHAR(60),
	phone VARCHAR(12),
	flg smallint,
	start_dt DATE NOT NULL
);

-- creating Table; Name: massages


CREATE TABLE IF NOT EXISTS messages(
	id INT PRIMARY KEY,
	person_id VARCHAR(20) NOT NULL REFERENCES person(id),
	message_dt DATE NOT NULL,
	message_category VARCHAR(20) NOT NULL
);

-- Data for Name: person

INSERT INTO person (id, name, mail, start_dt) 
VALUES
('11se35421','Ivanov I.', 'i@mail.ru', '01.01.1990'); 

INSERT INTO person 
VALUES
('24531fs23', 'Petrov P.', 'p@mail.ru', '+79122121546', 1, '01.01.1990'),
('35fg38023', 'Shved F.', 'sh@mail.ru', '+79172515234', 1, '01.01.1990'); -- additional data
	 
INSERT INTO person (id, name, start_dt) 
VALUES
('546gd4535', 'Sidorov S.', '01.01.1990');

-- Data for Name: messages

INSERT INTO messages
VALUES
('35153802', '35fg38023', '01.05.2021', 'Appeal'), -- additional data
('13543354', '24531fs23', '01.05.2021', 'Debt'), 
('23452435', '546gd4535', '01.09.2021', 'Appeal'), 
('34524223', '546gd4535', '20.12.2021', 'Debt'), 
('12345975', '24531fs23', '16.12.2021', 'Unknown'), 
('96046743', '24531fs23', '20.12.2021', 'Unknown'); 

-- Task 1.1

SELECT *, MAX(id) AS max_id
FROM person 
WHERE id = '24531fs23'
GROUP BY id;

-- Task 1.2

SELECT * 
FROM person
WHERE id = '24531fs23';


-- Task 2

UPDATE person
SET flg = 0
WHERE flg IS NULL;

-- Task 3.1

SELECT person.name, person.mail, person.start_dt
FROM person
LEFT JOIN messages
ON person.id = messages.person_id
GROUP BY person.name, person.mail, person.start_dt
HAVING MAX(message_dt) < '2021-12-01';

-- Task 3.2

SELECT COUNT(*) FROM person 
WHERE name iLIKE '%i%' OR name iLIKE '%o%';

-- Task 3.3

SELECT message_category, COUNT(message_category), MIN(message_dt) AS first_message_dt 
FROM messages
GROUP BY message_category;

-- Task 3.4

SELECT message_category, count(message_category), MIN(message_dt), MIN(person.name) 
FROM messages
JOIN person ON messages.person_id = person.id
GROUP BY messages.message_category;