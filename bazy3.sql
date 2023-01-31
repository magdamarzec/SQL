/*1. Stwórz Bazę Pracownicy/Jeżeli ją już masz, zaktualizuj wpisy w tabelach.
2. Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:

ID
Imię
Nazwisko
Wiek
Kurs
3. Każdą tabelę uzupełnij danymi z załącznika, lub zaktualizuj.
4. Wyświetl listę pracowników o Nazwisku: KOWALCZYK.
5. Wyświetl listę pracowników w wieku od 30 lat do 40 lat.
6. Wyświetl listę pracowników, których nazwisko nie zawiera „and”.
7. Wyświetl listę pracowników z ID od 1 do 7.
8. Wyświetl listę pracowników z brakującymi danymi.
9. Wyświetl wszystkich pracowników, którzy nie prowadzą żadnego kursu.*/

-- 1 Stwórz Bazę Pracownicy/Jeżeli ją już masz, zaktualizuj wpisy w tabelach
USE pracownicy;

-- 2 Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS

CREATE TABLE Pracownicy3 (
ID INTEGER PRIMARY KEY, 
Imię VARCHAR (25), 
Nazwisko VARCHAR (25), 
Wiek INTEGER, 
Kurs TEXT
);

-- 3 Każdą tabelę uzupełnij danymi z załącznika

INSERT INTO Pracownicy3 (ID, Imię, Nazwisko, Wiek, Kurs)
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
(11, 'Radosław', 'DĄBROWSKI', 35, ''),
(12, 'Robert', 'KOZŁOWSKI', '' ,'UX'),
(13, 'Joanna', 'MAZUR',	26,	'UX'),
(14, 'Radosław', 'JANKOWSKI', 27, 'UX'),
(15, 'Patryk', 'LEWANDOWSKI', 28, 'Tester'),
(16, '', 'ZIELIŃSKI', 28,	'Tester'),
(17, 'Andrzej',	'WOŹNIAK', 31, 'Tester'),
(18, 'Andrze', 'LEWANDOWSKI', 30, 'Tester'),
(19, 'Roman', 'ZIELIŃSKI', 39, 'Tester'),
(20, 'Ewa',	'WOŹNIAK', 31, 'Tester');

SELECT * FROM Pracownicy3;

-- 4 Wyświetl listę pracowników o Nazwisku: KOWALCZYK.
SELECT * FROM Pracownicy3 WHERE Nazwisko = 'KOWALCZYK';

-- 5 Wyświetl listę pracowników w wieku od 30 lat do 40 lat.
SELECT * FROM Pracownicy3 WHERE Wiek >= 30 AND Wiek <= 40
ORDER BY Wiek;

-- 6 Wyświetl listę pracowników, których nazwisko nie zawiera „and”
SELECT * FROM Pracownicy3 WHERE Nazwisko NOT LIKE '%and%';

-- 7  Wyświetl listę pracowników z ID od 1 do 7
SELECT * FROM Pracownicy3 WHERE ID >= 1 AND ID <= 7;

-- 8 Wyświetl listę pracowników z brakującymi danymi
SELECT * FROM Pracownicy3 WHERE Imię = '' OR Nazwisko = '' OR Wiek = '' OR Kurs = '';

-- 9 Wyświetl wszystkich pracowników, którzy nie prowadzą żadnego kursu
SELECT * FROM Pracownicy3 WHERE KURS = '';