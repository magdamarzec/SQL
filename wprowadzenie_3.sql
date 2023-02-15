/*1. Załóż bazę o nazwie: Moje zainteresowania.
2. Załóż tabelę o nazwie: Zainteresowania i utwórz 5 kolumn, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID
Nazwa 
Opis
Data realizacji
3. Wprowadź dane tylko dla kolumn: Nazwa i Opis. (Min 5 pozycji)
4. Sprawdź, czy wszystkie dane wyświetlają się prawidłowo i co pojawia się w kolumnie ID i Data realizacji.
5. Dodaj nową pozycję wypełniając wszystkie dane.
6. Dodaj brakujące dane dla wiersza 4.
7. Sprawdź, czy dane zostały zmienione, wyświetlając wszystkie pozycje.
8. Usuń wszystkie wiersze, w których jakaś z pozycji jest pusta.
9. Sprawdź, czy dane zostały zmienione, wyświetlając je.*/

-- 1
CREATE DATABASE Moje_zainteresowania;

-- 2
USE Moje_zainteresowania;
CREATE TABLE Zainteresowania (
Id INTEGER,
Nazwa VARCHAR (25),
Opis TEXT,
Data_realizacji DATE);

-- 3
INSERT INTO Zainteresowania (Nazwa, Opis) 
VALUES 
('Książki', 'Horrory, komiksy, atlasy'),
('jezdziectwo', 'jazda na koniu'),
('muzyka', 'rap, hip_hop'),
('motoryzacja', 'Fiat125p'),
('boks', 'ogladanie_w_tv');

-- 4 
SELECT * FROM Zainteresowania;
Id, Data_realizacji wyświetla NULL

-- 5 
INSERT INTO Zainteresowania (Id, Nazwa, Opis, Data_realizacji)
VALUES (6, 'narty', 'jazda_z_górki', '2021-12-31');

-- 6
UPDATE Zainteresowania SET Id = 4 WHERE Nazwa = 'motoryzacja';
UPDATE Zainteresowania SET Data_realizacji = '2013-06-25' WHERE Nazwa = 'motoryzacja';

-- 7
SELECT * FROM Zainteresowania;

-- 8
DELETE FROM Zainteresowania WHERE Nazwa = 'Książki';
DELETE FROM Zainteresowania WHERE Nazwa = 'jezdziectwo';
DELETE FROM Zainteresowania WHERE Nazwa = 'muzyka';
DELETE FROM Zainteresowania WHERE Nazwa = 'boks';

-- 9
SELECT * FROM Zainteresowania;
