/* Stwórz Bazę Pracownicy/Jeżeli ją już masz, zaktualizuj wpisy w tabelach.
2. Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:

ID
Imię
Nazwisko
Wiek
Kurs
3. Każdą tabelę uzupełnij danymi z załącznika, lub zaktualizuj.
4. Wyświetl listę pracowników wg kolumny Imię, eliminując powtarzające się pozycje.
5. Wyświetl listę pracowników wg kolumny Nazwisko eliminując powtarzające się pozycje.
6. Wyświetl kursy prowadzone przez pracowników o Nazwisku: „Kowalczyk”.
7. Wyświetl listę pracowników, dla których nie znamy wieku.
8. Wyświetl wiek pracowników o Imieniu „Patryk”.
9. Zmień nazwę tabeli z  „Pracownicy” na „Mentorzy”.*/

-- 1 
USE Pracownicy;

-- 2 Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS
CREATE TABLE Pracownicy5 (
ID INTEGER PRIMARY KEY, 
Imie VARCHAR (25), 
Nazwisko VARCHAR (25), 
Wiek INTEGER, 
Kurs TEXT
);

-- 3 Każdą tabelę uzupełnij danymi z załącznika
INSERT INTO Pracownicy5 (ID, Imie, Nazwisko, Wiek, Kurs)
VALUES 
(1,	'Anna',	'NOWAK', 34, 'DS'),
(2,	'Roman', 'KOWALSKI', 42, 'DS'), 
(3,	'Tomasz', 'WIŚNIEWSKI', 33,	'DS'),
(4,	'Agata', NULL , 43, 'DS'),
(5,	'Elżbieta',	'KOWALCZYK', NULL, 'Java'),
(6,	'Przemysław', 'KAMIŃSKI', NULL, 'Java'),
(7,	'Robert', 'LEWANDOWSKI', NULL, 'Java'),
(8,	'Radosław',	'ZIELIŃSKI', NULL, 'Java'),
(9,	'Robert', 'WOŹNIAK', NULL, 'Java'),
(10, 'Robert', 'SZYMAŃSKI',	34,	'Java'),
(11, 'Radosław', 'DĄBROWSKI', 35, NULL),
(12, 'Robert', 'KOZŁOWSKI',	NULL,	'UX'),
(13, 'Joanna', 'MAZUR',	26,	'UX'),
(14, 'Radosław', 'JANKOWSKI', 27, 'UX'),
(15, 'Patryk', 'LEWANDOWSKI', 28, NULL),
(16, NULL, 'ZIELIŃSKI', 28,	NULL),
(17, 'Andrzej',	'WOŹNIAK', 31, NULL),
(18, 'Andrze', 'LEWANDOWSKI', 30, NULL),
(19, 'Roman', 'ZIELIŃSKI', 39, NULL),
(20, 'Ewa',	'WOŹNIAK', 31, NULL);

SELECT * FROM Pracownicy5;

-- 4 Wyświetl listę pracowników wg kolumny Imię, eliminując powtarzające się pozycje.
SELECT DISTINCT Imie FROM Pracownicy5;

-- 5 Wyświetl listę pracowników wg kolumny Nazwisko eliminując powtarzające się pozycje
SELECT DISTINCT Nazwisko FROM Pracownicy5;

-- 6 Wyświetl kursy prowadzone przez pracowników o Nazwisku: Kowalczyk
SELECT Kurs FROM Pracownicy5 WHERE Nazwisko = 'Kowalczyk';

-- 7 Wyświetl listę pracowników, dla których nie znamy wieku.
SELECT * FROM Pracownicy5 WHERE Wiek IS NULL;

-- 8 Wyświetl wiek pracowników o Imieniu „Patryk”.
SELECT Wiek FROM Pracownicy5 WHERE Imie = 'Patryk';

-- 9 Zmień nazwę tabeli z  „Pracownicy” na „Mentorzy”
ALTER TABLE Pracownicy5
RENAME Mentorzy;