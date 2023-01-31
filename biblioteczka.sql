CREATE DATABASE Wprowadzenie2; 
USE Wprowadzenie2;
CREATE TABLE Biblioteczka (
id INTEGER,
tytuł TEXT,
data_zakupu DATE
);
INSERT INTO Biblioteczka (id, tytuł, data_zakupu) VALUES (1, 'Lalka', '2020-06-02');
SELECT * FROM Biblioteczka;
INSERT INTO Biblioteczka (id, tytuł, data_zakupu) VALUES (2, 'Krzyżacy', '2015-01-27');
INSERT INTO Biblioteczka (id, tytuł, data_zakupu) VALUES (3, 'Pan Tadeusz', '2018-06-13');
SELECT * FROM Biblioteczka
ORDER BY id;
SELECT * FROM Biblioteczka
ORDER BY id = 3 DESC;
ALTER TABLE Biblioteczka
ADD COLUMN autor TEXT;
UPDATE Biblioteczka
SET autor = 'Mickiewicz' WHERE id = 3;
UPDATE Biblioteczka
SET autor = 'Sienkiewicz' WHERE id = 2;
UPDATE Biblioteczka
SET autor = 'Prus' WHERE id = 1;
DELETE FROM Biblioteczka WHERE id = 1;
DELETE FROM Biblioteczka WHERE id = 2;
SELECT * FROM Biblioteczka;