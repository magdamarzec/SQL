/* 1. Załóż bazę o nazwie: School_Coding.
2. Załóż tabelę o nazwie: Mentors i utwórz 6 kolumn, a także dobierz i ustaw dla każdej constraints:
ID
Imię 
Nazwisko
Specjalizacja
Data zatrudnienia
Data zwolnienia
3. Wprowadź dane (10 pozycji od 1 do 10). Każda pozycja ma mieć wypełnione wszystkie dane).
4. Sprawdź, czy wszystkie dane wyświetlają się prawidłowo poprzez ich wyświetlenie.
5. Zmień Nazwisko Mentora w pozycji nr 5.
6. Sprawdź, czy dane zostały zmienione, wyświetlając tylko tę pozycję.
7. Zmień specjalizację mentora w pozycji 9.
8. Sprawdź, czy dane zostały zmienione, wyświetlając tylko tę pozycję.
9. Dodaj kolumnę o nazwie Wynagrodzenie, a także dobierz i ustaw constraints.
10. Uzupełnij kolumnę wartością 1000 dla pozycji 1,2 oraz 3.
11. Wyświetl pozycję 1,2,3 i sprawdź, czy dane są prawidłowe.
*/

-- 1
CREATE DATABASE School_Coding;
-- 2

USE  School_Coding;

CREATE TABLE Mentors (
Id INTEGER PRIMARY KEY AUTO_INCREMENT,
Imię TEXT NOT NULL,
Nazwisko TEXT NOT NULL,
Specjalizacja TEXT,
Data_zatrudnienia DATE NOT NULL,
Data_zwolnienia DATE  
);

-- 3
INSERT INTO mentors (Imię, Nazwisko, Specjalizacja, Data_zatrudnienia, Data_zwolnienia)
VALUES 
('Agnieszka', 'Król', 'data_scientist', '2003-06-12', '2016-03-12'),
('Marek', 'Bułka', 'data_scientist', '2011-06-11', '2020-12-18'),
('Konstancja', 'Buk', 'data_analyst', '2021-08-12', '2022-06-26'),
('Renata', 'Owczarek', 'project_manager', '2006-12-03', '2018-07-31'),
('Rafał', 'Komin', 'project_manager', '2011-02-13', '2015-08-30'),
('Janusz', 'Kowalski', 'data_scientist', '2013-09-12', '2017-11-30'),
('Danuta', 'Wicher', 'project_manager', '2009-12-25', '2019-10-23'),
('Roman', 'Podpałka', 'data_scientist', '2005-11-27', '2021-06-29'),
('Marek', 'Toczeń', 'data_analist', '2011-12-11', '2019-09-25'),
('Beata', 'Korzeniowska', 'data_analyst', '2001-01-28', '2022-05-12'
);

-- 4
SELECT * FROM Mentors;

-- 5
SET SQL_SAFE_UPDATES = 0; 
UPDATE mentors SET Nazwisko = 'Smog' WHERE Id = 5; 

-- 6 
SELECT Nazwisko FROM Mentors WHERE Id = 5; 
SELECT * FROM Mentors WHERE Id = 5;

-- 7 
UPDATE mentors SET Specjalizacja = 'Data_scientist' WHERE Id = 9; 

-- 8
SELECT Specjalizacja FROM Mentors WHERE Id = 9;
SELECT * FROM Mentors WHERE Id = 9;

-- 9 
ALTER TABLE Mentors 
ADD COLUMN Wynagrodzenie FLOAT NOT NULL;

-- 10
UPDATE Mentors SET Wynagrodzenie = 1000 WHERE Id = 1;
UPDATE Mentors SET Wynagrodzenie = 1000 WHERE Id = 2;
UPDATE Mentors SET Wynagrodzenie = 1000 WHERE Id = 3;

-- 11 
SELECT * FROM Mentors 
WHERE Id <= 3; 
