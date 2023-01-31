/*1. Stwórz Bazę Pracownicy
2. Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID
Imię
Nazwisko
Wiek
Kurs
3. Każdą tabelę uzupełnij danymi z tabeli z załącznika.
4. Wyświetl listę pracowników starszych niż 30 lat.
5. Wyświetl listę pracowników młodszych niż 30 lat.
6. Wyświetl listę pracowników, których nazwisko zaczyna się na „K” i kończy na „ki”
7. Zmień nazwę kolumny „ID” na „NR”
8. Wyświetl pozycje, w których są puste pola.
9. Wyświetl wszystkich pracowników z kursu „Java”. */

-- 1
CREATE DATABASE Pracownicy1;

-- 2
USE Pracownicy1;

CREATE TABLE Pracownicy (
ID INTEGER PRIMARY KEY, 
Imię VARCHAR (25), 
Nazwisko VARCHAR (25), 
Wiek INTEGER, 
Kurs TEXT
);

-- 3
INSERT INTO Pracownicy (ID, Imię, Nazwisko, Wiek, Kurs)
VALUES 
(1,	'Anna',	'NOWAK', 34, 'DS'),
(2,	'Roman', 'KOWALSKI', 42, 'DS'), 
(3,	'Tomasz', 'WIŚNIEWSKI', 33,	'DS'),
(4,	'Agata', 'WÓJCIK', 43, 'DS'),
(5,	'Elżbieta',	'KOWALCZYK', 28, 'Java'),
(6,	'Przemysław', 'KAMIŃSKI', 34, 'Java'),
(7,	'Robert', 'LEWANDOWSKI', 35, 'Java'),
(8,	'Radosław',	'ZIELIŃSKI', 38, 'Java'),
(9,	'Anna',	'WOŹNIAK', 26, 'Java'),
(10, 'Robert', 'SZYMAŃSKI',	34,	'Java'),
(11, 'Radosław', 'DĄBROWSKI', 35, 'UX'),
(12, 'Robert', 'KOZŁOWSKI',	38,	'UX'),
(13, 'Joanna', 'MAZUR',	26,	'UX'),
(14, 'Radosław', 'JANKOWSKI', 27, 'UX'),
(15, 'Patryk', 'LEWANDOWSKI', 28, 'Tester'),
(16, 'Patryk', 'ZIELIŃSKI', 28,	'Tester'),
(17, 'Andrzej',	'WOŹNIAK', 31, 'Tester'),
(18, 'Andrze', 'LEWANDOWSKI', 30, 'Tester'),
(19, 'Roman', 'ZIELIŃSKI', 39, 'Tester'),
(20, 'Ewa',	'WOŹNIAK', 31, 'Tester');

-- 4 Wyświetl listę pracowników starszych niż 30 lat.
SELECT * FROM Pracownicy WHERE Wiek >30;

-- 5 Wyświetl listę pracowników młodszych niż 30 lat.
SELECT * FROM Pracownicy WHERE Wiek <30;

-- 6 Wyświetl listę pracowników, których nazwisko zaczyna się na „K” i kończy na „ki”
SELECT Nazwisko FROM Pracownicy WHERE Nazwisko LIKE 'K%' AND Nazwisko LIKE '%ki';

-- 7 Zmień nazwę kolumny „ID” na „NR”
ALTER TABLE Pracownicy CHANGE ID NR INTEGER;

-- 8 Wyświetl pozycje, w których są puste pola.
SELECT * FROM Pracownicy WHERE Imię IS NULL OR Nazwisko IS NULL OR Wiek IS NULL OR Kurs IS NULL;

-- 9 Wyświetl wszystkich pracowników z kursu „Java”
SELECT * FROM Pracownicy WHERE Kurs = 'Java';

