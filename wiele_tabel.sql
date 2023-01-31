/*a. Napisz kwerendę, która zwróci wszystkich klientów z zamówieniami zrealizowanymi w dniu 2008-01-08*/

SELECT CUST_NAME, ORD_DATE
FROM customer
JOIN orders 
ON customer.CUST_CODE = orders.CUST_CODE
WHERE ORD_DATE = '2008-01-08';

/*b. Napisz kwerendę, która zwróci listę agentów oraz klientów wraz z ich obszarem działalności, którzy należą do tego samego obszaru */

SELECT AGENT_NAME, CUST_NAME, agents.WORKING_AREA
FROM agents
JOIN customer ON agents.WORKING_AREA = customer.WORKING_AREA
ORDER BY WORKING_AREA;
 
/*INNER JOIN
a. Wyszukaj listę klientów, którzy podjęli współpracę z agentami spoza swojego obszaru działalności 
oraz tymi, których prowizja jest powyżej 12%; kolumna z nazwą pośrednika powinna mieć nazwę „Salesman”*/

SELECT CUST_NAME, customer.WORKING_AREA, customer.AGENT_CODE, agents.WORKING_AREA, agents.COMMISSION
FROM customer
JOIN agents 
ON agents.AGENT_CODE = customer.AGENT_CODE
WHERE agents.COMMISSION > 0.12
     AND customer.WORKING_AREA <> agents.WORKING_AREA;


/*b. Wyszukaj szczegóły dot. Zamówień: nr zamówienia, datę, kwotę, klienta (nazwa kolumny powinna być „Customer Name”) 
oraz agenta (w tym wypadku nazwa kolumny to „Salesman”), który pracuje dla tego klienta oraz jego prowizję od zamówienia*/

SELECT ORD_NUM, ORD_DATE, ORD_AMOUNT, customer.CUST_NAME AS Customer_Name, agents.AGENT_NAME AS Salesman, agents.COMMISSION
FROM orders 
JOIN agents
ON agents.AGENT_CODE = orders.AGENT_CODE
JOIN customer
ON customer.CUST_CODE = orders.CUST_CODE;
 

/*LEFT JOIN
a. Wyszukaj listę - posortowaną rosnąco wg kodu klienta (jego id) – klientów pracujących zarówno indywidualnie, 
jak również za pośrednictwem pośredników (nazwij kolumnę zawierającą nazwy pośredników jako „Salesman”), 
wyszukaj również ich obszar działalności*/
 
SELECT CUST_NAME, agents.AGENT_NAME AS SALESMAN, customer.WORKING_AREA AS customer_working_area
FROM customer
LEFT JOIN agents
ON customer.AGENT_CODE = agents.AGENT_CODE
ORDER BY CUST_CODE;

/*RIGHT JOIN
a. Wyszukaj listę pośredników pracujących dla jednego bądź więcej klientów 
lub takich, którzy jeszcze nie podjęli współpracy z żadnym klientem, 
posortuj listę rosnąco wg kolumny kodu pośrednika (agenta); 
nazwij kolumnę zawierającą nazwy pośredników jako „Salesman”, 
wyszukaj również ich obszar działalności */
 
SELECT agents.AGENT_CODE, 
	   agents.AGENT_NAME,
	   customer.AGENT_CODE AS CUSTOMERS_AGENT_CODE, 
	   agents.WORKING_AREA
 FROM customer
 RIGHT JOIN agents
 ON customer.AGENT_CODE = agents.AGENT_CODE
 ORDER BY agents.AGENT_CODE;
 
/*CROSS JOIN
a. Wyszukaj iloczyn kartezjański pośredników oraz klientów, w taki sposób, 
że każdy pośrednik będzie widoczny dla wszystkich klientów i vice versa.*/
SELECT customer.CUST_NAME, agents.AGENT_NAME
FROM customer
CROSS JOIN agents;

/*b. Wyszukaj iloczyn kartezjański pośredników oraz klientów, w taki sposób, 
że każdy pośrednik będzie widoczny dla wszystkich klientów i vice versa, ale tylko jeżeli pośrednik jest z tego samego obszaru co klient.*/

SELECT customer.CUST_NAME, customer.WORKING_AREA, agents.AGENT_NAME, agents.WORKING_AREA 
FROM customer
CROSS JOIN agents
WHERE agents.WORKING_AREA = customer.WORKING_AREA;


/*c. Wyszukaj iloczyn kartezjański pośredników oraz klientów, w taki sposób, 
że każdy pośrednik będzie widoczny dla wszystkich klientów i vice versa, 
ale tylko jeżeli pośrednik jest z innego obszaru niż klient, a klient posiada swoją własną ocenę (‘grade’)*/

SELECT customer.CUST_NAME, customer.WORKING_AREA, agents.AGENT_NAME, agents.WORKING_AREA
FROM customer
CROSS JOIN agents
WHERE customer.WORKING_AREA <> agents.WORKING_AREA 
	  AND customer.GRADE IS NOT NULL;

/*UNION
a. Wyszukaj wszystkich pośredników (ich kod – nazwij kolumne „ID” oraz nazwa agenta); 
przypisz im wartość ‘Salesman’ w kolumnie o nazwie „Rodzaj”) oraz klientów – ich ID i nazwa (wartość ‘Customer’ w kolumnie „Rodzaj”) 
zlokalizowanych w Londynie*/

SELECT AGENT_CODE AS ID, 
	   AGENT_NAME,
       WORKING_AREA,
       'Salesman' AS 'Rodzaj'
FROM agents
WHERE WORKING_AREA = 'London'

UNION

SELECT CUST_CODE AS ID,
       CUST_NAME,
       WORKING_AREA,
       'Customer' AS 'Rodzaj'
FROM customer
WHERE WORKING_AREA = 'London';

/*b. Napisz kwerendę, która zwróci raport pokazujący, który pośrednik przyjął największe i najmniejsze zamówienia na każdy dzień*/

WITH minimalne_zamowienie AS (
	 SELECT ORD_DATE data_zamowienia, 
		    MIN(ORD_AMOUNT) AS minimalne
	FROM orders
	GROUP BY data_zamowienia
    ),

 max_zamowienie AS (
	SELECT ORD_DATE AS data_zamowienia,
		   MAX(ORD_AMOUNT) AS maksymalne
	FROM orders
	GROUP BY data_zamowienia
    )
    
(SELECT agents.AGENT_NAME,
	    data_zamowienia,
        ORD_AMOUNT,
        'minimalne' AS 'wartosc'
 FROM minimalne_zamowienie
 JOIN orders ON orders.ORD_DATE = minimalne_zamowienie.data_zamowienia
 JOIN agents ON agents.AGENT_CODE = orders.AGENT_CODE
 ORDER BY data_zamowienia)

 UNION 
 
 (SELECT  agents.AGENT_NAME,
	     ORD_DATE AS data_zamowienia,
         ORD_AMOUNT,
	     'maksymalne' AS 'wartosc'
FROM max_zamowienie
JOIN orders ON orders.ORD_DATE = max_zamowienie.data_zamowienia
JOIN agents ON agents.AGENT_CODE = orders.AGENT_CODE
ORDER BY data_zamowienia);

/*WITH
a. Wyszukaj pośrednika w Londynie z prowizją powyżej 14% - nazwij widok „londonstaff”*/

WITH londonstaff AS (
	SELECT AGENT_NAME
	FROM agents
	WHERE WORKING_AREA = 'London' 
	AND COMMISSION > 0.14)
SELECT *
FROM londonstaff;


/* b. Utwórz widok „gradecount”, aby uzyskać liczbę klientów dla każdej oceny (‘grade’)*/

WITH gradecount AS (
	SELECT GRADE,
		   COUNT(DISTINCT customer.CUST_CODE) AS CUST_NUMBER  
	FROM customer
    GROUP BY customer.GRADE)
SELECT *
FROM gradecount;

/*c. Utwórz widok (o nazwie „total_per_dzien”) do śledzenia liczby klientów, 
średniej kwoty zamówień oraz ogólnej sumy zamówień na każdy dzień*/

WITH total_per_dzien AS (
	SELECT ORD_DATE AS data_zamowienia,
		   COUNT(CUST_CODE) AS liczba_klientow,
		   COUNT(ORD_NUM) AS suma_zamowien,
		   AVG(ORD_AMOUNT) AS sred_kwota_zamowien 
	FROM orders
	GROUP BY ORD_DATE
	ORDER BY ORD_DATE)
SELECT *
FROM total_per_dzien;
