﻿/*DROP TABLE IF EXISTS student;
CREATE TABLE student (
	studentId INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
	studentIdNumber CHAR(8) NOT NULL UNIQUE,
	firstName VARCHAR(20) NOT NULL,
	lastName VARCHAR(20) NOT NULL,
	rowCreateDate TIMESTAMP NOT NULL DEFAULT (current_timestamp),
	rowCreateUser VARCHAR(40) NOT NULL DEFAULT (current_user)
);

INSERT INTO student(studentIdNumber, firstName, lastName) VALUES 
	('0000001', 'CaPtain', 'von nuLLY'),
	('0000002', 'NORM', 'uLl'),
	('0000003', 'gREy', 'tezine');

SELECT *
FROM student;
*/


DROP TRIGGER IF EXISTS insertST on STview;
DROP FUNCTION IF EXISTS noticeInsert;
DROP VIEW IF EXISTS STview;

CREATE VIEW STview AS
SELECT * FROM student;


CREATE FUNCTION noticeInsert() 
RETURNS TRIGGER
AS $$
BEGIN       
	RAISE NOTICE 'Insert done';
	RETURN new;
END;
$$ LANGUAGE PLpgSQL;


CREATE TRIGGER insertST
INSTEAD OF INSERT ON STview
FOR EACH ROW EXECUTE PROCEDURE noticeInsert();

insert into stview(studentIdNumber, firstName, lastName) VALUES 
	('0000006', 'Ca', 'von');

SELECT * FROM student;