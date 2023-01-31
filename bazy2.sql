/*1 Stwórz Bazę Pracownicy/Jeżeli ją już masz, zaktualizuj wpisy w tabelach.
2 Stwórz Tabelę Pracownicy z pięcioma kolumnami, a także dobierz i ustaw dla każdej CONSTRAINTS:
ID
Imię
Nazwisko
Wiek
Kurs
3. Każdą tabelę uzupełnij danymi z załącznika lub zaktualizuj.
4. Wyświetl listę pracowników w wieku 28 lat.
5. Wyświetl listę pracowników w wieku 30 lat i młodszych.
6. Wyświetl listę pracowników, których nazwisko zawiera „ski”.
7. Wyświetl listę pracowników z ID: 1,4,7,18,20.
8. Wyświetl listę pracowników z wprowadzonymi kompletnymi danymi.
9. Wyświetl wszystkich pracowników, którzy nie prowadzą kursu DS*/

USE Pracownicy;

-- 2
CREATE TABLE Pracownicy2 (
ID INTEGER PRIMARY KEY, 
Imię VARCHAR (25), 
Nazwisko VARCHAR (25), 
Wiek INTEGER, 
Kurs TEXT
);

-- 3
INSERT INTO Pracownicy2 (ID, Imię, Nazwisko, Wiek, Kurs)
VALUES 
(1,	'Anna',	'NOWAK', 34, 'DS'),
(2,	'Roman', 'KOWALSKI', 42, 'DS'), 
(3,	'Tomasz', 'WIŚNIEWSKI', 33,	'DS'),
(4,	'Agata', 'WÓJCIK', 43, 'DS'),
(5,	'Elżbieta',	'KOWALCZYK', 28, 'Java'),
(6,	'Przemysław', NULL, 34, 'Java'),
(7,	'Robert', NULL, 35, 'Java'),
(8,	'Radosław',	'ZIELIŃSKI', 38, 'Java'),
(9,	NULL, 'WOŹNIAK', 26, 'Java'),
(10, 'Robert', 'SZYMAŃSKI',	34,	'Java'),
(11, 'Radosław', 'DĄBROWSKI', 35, NULL),
(12, 'Robert', 'KOZŁOWSKI',	NULL,	'UX'),
(13, 'Joanna', 'MAZUR',	26,	'UX'),
(14, 'Radosław', 'JANKOWSKI', 27, 'UX'),
(15, 'Patryk', 'LEWANDOWSKI', 28, 'Tester'),
(16, NULL, 'ZIELIŃSKI', 28,	'Tester'),
(17, 'Andrzej',	'WOŹNIAK', 31, 'Tester'),
(18, 'Andrze', 'LEWANDOWSKI', 30, 'Tester'),
(19, 'Roman', NULL, 39, 'Tester'),
(20, 'Ewa',	'WOŹNIAK', 31, 'Tester');



-- 4 Wyświetl listę pracowników w wieku 28 lat.
SELECT * FROM Pracownicy WHERE Wiek = 28;

-- 5 Wyświetl listę pracowników w wieku 30 lat i młodszych.
SELECT * FROM Pracownicy WHERE Wiek <= 30;

-- 6 Wyświetl listę pracowników, których nazwisko zawiera „ski”
SELECT * FROM Pracownicy WHERE Nazwisko LIKE '%ski%';

-- 7 Wyświetl listę pracowników z ID: 1,4,7,18,20.
SELECT * FROM Pracownicy 
WHERE NR IN (1, 4, 7, 18, 20);

-- 8 Wyświetl listę pracowników z wprowadzonymi kompletnymi danymi.
SELECT * FROM Pracownicy WHERE Imię IS NOT NULL AND Nazwisko IS NOT NULL AND Wiek IS NOT NULL AND Kurs IS NOT NULL;

-- 9 Wyświetl wszystkich pracowników, którzy nie prowadzą kursu DS
SELECT * FROM Pracownicy WHERE Kurs = 'DS';



