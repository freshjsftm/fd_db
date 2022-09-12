-- посчитать кол-во проданных телефонов
SELECT sum("quantity")
FROM "phones_to_orders";

-- посчитать кол-во проданных телефонов в каждом заказе
SELECT sum("quantity"), "orderId"
FROM "phones_to_orders"
GROUP BY "orderId";

--посчитать среднюю цену всех телефонов
SELECT avg("price")
FROM "phones"

--посчитать среднюю цену для каждого бренда
SELECT avg("price"), "brand"
FROM "phones"
GROUP BY "brand"

--посчитать количество моделей каждого бренда
SELECT count(*), "brand"
FROM "phones"
GROUP BY "brand"

--посчитать колво заказов каждого пользователя
SELECT count(*), "userId"
FROM "orders"
GROUP BY "userId"

--посчитать сколько в сумме стоят все телефоны на складе с ценой выше 15000
SELECT sum("price"*"quantity")
FROM "phones"
WHERE "price">15000


--посчитать количество моделей каждого бренда
SELECT count(*), "brand"
FROM "phones"
GROUP BY "brand"
LIMIT 1


SELECT *
FROM "users"
ORDER BY "height" DESC, "lastName"
LIMIT 10

--отсортировать всех женщин по дате рождения, по фамилии в порядке возрастания
SELECT *
FROM "users"
WHERE "isMale"= false
ORDER BY  "birthday" ,"lastName";

--вывести десятку телефонов, которых меньше всего на складе
SELECT *
FROM "phones"
ORDER BY "quantity"
LIMIT 10;

--вывести возрвст, фамилию, имя и отсортировать людей по возрасту, потом по фамилии, потом по имени по возрастанию 
SELECT extract("years" from age("birthday")), "firstName", "lastName"
FROM "users"
ORDER BY extract("years" from age("birthday")),"lastName", "firstName";




--посчитать колво людей определенного возраста
SELECT  count(*) AS "count", 
        extract("years" from age("birthday")) AS "age" 
FROM "users"
--WHERE extract("years" from age("birthday"))=33
GROUP BY "age"
HAVING count(*)<6
ORDER BY "age"


--показать бренды, у которых кол-во моделей меньше 5
SELECT count(*), "brand"
FROM "phones"
GROUP BY "brand"
HAVING count(*)<5;


--выведите бренды, у которых цена на телефон больше 10000
SELECT DISTINCT "brand"
FROM "phones"
WHERE "price" > 25000




SELECT *
FROM "phones"
WHERE "brand" ILIKE 's%y'



--BP



SELECT *
FROM "users"
WHERE "lastName" SIMILAR TO '_e{2}%'

SELECT *
FROM "users"
WHERE "lastName" LIKE '_e%'


--найти все почтs которіе начинаюся на букву с и имеют длину от 20 до 23 вкл
SELECT "email"
FROM "users"
WHERE "email" LIKE 'c%'
AND length("email") BETWEEN 20 AND 23
ORDER BY "email"

--найти и вывести количество символов в почте, которая начинается на w
SELECT "email" , length("email")
FROM "users"
WHERE "email" LIKE 'w%'

-- найти и вывести длину почты и посчитать кол-во одинаковых длин почты 
-- сгрупировать по длине
-- показать только те группы, где длина символов менее 25
SELECT count(*) , length("email") AS "length"
FROM "users"
WHERE length("email")<25
GROUP BY "length"
HAVING count(*) >5
ORDER BY "length"
