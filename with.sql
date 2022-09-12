--извлечь все заказы стоимостью выше среднего чека 

--1) стоимость каждого заказа
SELECT "pto"."orderId", sum("pto"."quantity"*"p"."price")
FROM "phones_to_orders" AS "pto"
  JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
GROUP BY "pto"."orderId"

--2)получить средний чек
SELECT avg("co"."cost")
FROM(
  SELECT "pto"."orderId", sum("pto"."quantity"*"p"."price") AS "cost"
  FROM "phones_to_orders" AS "pto"
    JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
  GROUP BY "pto"."orderId"
) AS "co"
--WHERE "co"."cost" > avg("co"."cost")

--3)извлечь все заказы стоимостью выше среднего чека
SELECT "co".*
FROM(
  SELECT "pto"."orderId", sum("pto"."quantity"*"p"."price") AS "cost"
  FROM "phones_to_orders" AS "pto"
    JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
  GROUP BY "pto"."orderId"
) AS "co"
WHERE "co"."cost" > (
      SELECT avg("co"."cost")
      FROM(
        SELECT "pto"."orderId", sum("pto"."quantity"*"p"."price") AS "cost"
        FROM "phones_to_orders" AS "pto"
          JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
        GROUP BY "pto"."orderId"
      ) AS "co"
);
--------REFACTOR
WITH "cost_orders" AS (
  SELECT "pto"."orderId", sum("pto"."quantity"*"p"."price") AS "cost"
  FROM "phones_to_orders" AS "pto"
    JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
  GROUP BY "pto"."orderId"
)
SELECT "co".*
FROM "cost_orders" AS "co"
WHERE "co"."cost" > (SELECT avg("co"."cost") FROM "cost_orders" AS "co");



SELECT "u"."id", "o"."id"
  FROM "users" AS "u"
    JOIN "orders" AS "o" ON "u"."id"="o"."userId"


--достать пользователей у которых количество заказов больше среднего
--количество заказов каждого пользователя
--среднее
--приводим к результату







