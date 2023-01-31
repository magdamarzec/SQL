/* 1. Załóż bazę o nazwie: Lista Prezentów.
2. Załóż tabelę o nazwie: Prezenty_2020 i utwórz 5 kolumn, a także dobierz i ustaw dla każdej constraints:
ID
Imię obdarowanego
Pomysł na prezent
Cena
Miejsce zakupu
3. Wprowadź dane osób, dla których kupujesz świąteczne prezenty (min. 5). Każda pozycja ma mieć wypełnione wszystkie dane zgodnie z wymaganiem.
4. Sprawdź, czy wszystkie dane wyświetlają się prawidłowo.
5. Zmień pomysł na prezent dla osoby zapisanej w pozycji 3 na wartość „Rower”.
6. Sprawdź, czy dane zostały zmienione wyświetlając tylko tę pozycję.
7. Usuń pozycję 1.
8. Sprawdź, czy dane zostały zmienione, wyświetlając wszystkie pozycje.
9. Usuń kolumnę o nazwie Miejsce zakupu.
10. Wyświetl zawartość kolumny Imię obdarowanego dla pozycji 3,4,5 i sprawdź, czy dane są prawidłowe. */

-- 1
CREATE DATABASE Lista_prezentow;

-- 2
USE Lista_prezentow;
CREATE TABLE Prezenty_2020 (
Id INTEGER PRIMARY KEY AUTO_INCREMENT,
Imię_obdarowanego VARCHAR (25),
Pomysł_na_prezent VARCHAR (25),
Cena DECIMAL(4,2) NOT NULL,
Miejsce_Zakupu VARCHAR (25)
);

-- 3
INSERT INTO Prezenty_2020 (Imię_obdarowanego, Pomysł_na_prezent, Cena, Miejsce_zakupu)
VALUES ('Jacek', 'książka', '30', 'Empik'),
 ('Renata', 'portfel', '50', 'HM'),
 ('Krzyś', 'LEGO', '99', 'SMYK'),
 ('Ola', 'pomadka', '80', 'drogeria'),
 ('Honorata', 'kwiaty', '60', 'kwiaciarnia');
 
 -- 4
 SELECT * FROM Prezenty_2020;

-- 5 
SET SQL_SAFE_UPDATES = 0;
UPDATE Prezenty_2020 
SET Pomysł_na_prezent = 'Rower' WHERE Id = 3;

-- 6 
Select Pomysł_na_prezent FROM Prezenty_2020 WHERE Id = 3;
Select * FROM Prezenty_2020 WHERE Id = 3;

-- 7
DELETE FROM Prezenty_2020 WHERE Id = 1;

-- 8
SELECT * FROM Prezenty_2020;

-- 9
ALTER TABLE Prezenty_2020
DROP COLUMN Miejsce_zakupu;

-- 10
SELECT Imię_obdarowanego FROM Prezenty_2020 WHERE Id IN (3, 4, 5);
 
