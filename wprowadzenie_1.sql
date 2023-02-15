/* 1. Załóż bazę o nazwie: Lista Pracowników.
2. Załóż tabelę o nazwie: Pracownicy i utwórz 5 kolumn, a także dobierz i ustaw dla każdej constraints:
ID
Imię 
Nazwisko
Stanowisko
Dział
3. Wprowadź dane osób kilku, z którymi pracujesz w Swojej firmie. Każda pozycja ma mieć wypełnione wszystkie dane zgodnie z wymaganiem.
4. Sprawdź, czy wszystkie dane wyświetlają się prawidłowo.
5. Dodaj kolumnę: Data zatrudnienia.
6. Dodaj nowego pracownika uzupełniając wszystkie dane.
7. Sprawdź, czy dane zostały zmienione, wyświetlając wszystkie pozycje.
8. Uzupełnij wszystkie brakujące dane w kolumnie o nazwie Data Zatrudnienia.
9. Sprawdź, czy dane zostały zmienione, wyświetlając je. */

-- 1
CREATE DATABASE Lista_pracowników;

-- 2
USE Lista_pracowników;

CREATE TABLE Pracownicy (
Id INTEGER AUTO_INCREMENT,
Imię VARCHAR (25),
Nazwisko VARCHAR (25),
Stanowisko TEXT,
Dział TEXT
);

-- 3
INSERT INTO Pracownicy (Imię, Nazwisko, Stanowisko, Dział)
VALUES 
('Roman', 'Kluska', 'Dyrektor', 'Handlowy'),
('Iwona', 'Konieczna', 'Manager', 'Produkcja'),
('Ryszarda', 'Śliwka', 'Księgowa', 'Finanse'),
('Mirosław', 'Żyłka', 'Sprzedawca', 'Handlowy');

-- 4 
SELECT * FROM Pracownicy;

-- 5
ALTER TABLE Pracownicy
ADD COLUMN Data_zatrudnienia DATE;

-- 6 
INSERT INTO Pracownicy (Imię, Nazwisko, Stanowisko, Dział, Data_zatrudnienia)
VALUES 
('Leszek', 'Grozny', 'Operator', 'Produkcja', '2002-12-15');

-- 7
SELECT * FROM Pracownicy;

-- 8
UPDATE Pracownicy SET Data_zatrudnienia = '2005-03-06' WHERE Id = 1;
UPDATE Pracownicy SET Data_zatrudnienia = '2002-08-16' WHERE Id = 2;
UPDATE Pracownicy SET Data_zatrudnienia = '2014-09-06' WHERE Id = 3;
UPDATE Pracownicy SET Data_zatrudnienia = '2020-03-26' WHERE Id = 4;

-- 9
SELECT * FROM Pracownicy;