--получить заказы конкретного пользователя

SELECT "u"."id", "u"."email", "o"."id"
FROM "users" AS "u"
  JOIN "orders" AS "o" ON "o"."userId" = "u"."id"
WHERE "u"."id" = 77;

SELECT "u"."id", "u"."email", "o"."id"
FROM "users" "u"
  JOIN "orders" "o" ON "o"."userId" = "u"."id"
WHERE "u"."id" = 77;


SELECT "u"."id", "u"."email", "o"."id"
FROM "users" AS "u", "orders" AS "o"
WHERE "o"."userId" = "u"."id" AND "u"."id" = 77;



--Получить все заказі в которіх покупали Sony
SELECT "p"."brand", "p"."model", "o"."id"
FROM "orders" AS "o"
  JOIN "phones_to_orders" AS "pto" ON "o"."id"="pto"."orderId"
  JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
WHERE "p"."brand" ILIKE 'sony';


--посчитать колво заказов по каждому бренду
SELECT "p"."brand",  count("o"."id") AS "count"
FROM "orders" AS "o"
  JOIN "phones_to_orders" AS "pto" ON "o"."id"="pto"."orderId"
  JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
GROUP BY "p"."brand"
ORDER BY "count";


INSERT INTO phones (
    brand,
    model,
    price,
    quantity
  )
VALUES (
    'Elon',
    'Musk10',
    30000,
    100
  ),
  (
    'Elon',
    'MuskXX',
    32000,
    50
  );

--выбрать бренды телефонов которые покупают, отсортировать по бренду
SELECT "brand" FROM "phones"  AS "p"
JOIN "phones_to_orders" AS "po" ON "p"."id" = "po"."phoneId"
INTERSECT
SELECT "brand" FROM "phones"

SELECT DISTINCT "brand" FROM "phones"  AS "p"
JOIN "phones_to_orders" AS "po" ON "p"."id" = "po"."phoneId"




SELECT "p"."brand" , "p"."model"
FROM "phones"  AS "p"
JOIN "phones_to_orders" AS "po" ON "p"."id" = "po"."phoneId"
GROUP BY "p"."brand", "p"."model"
ORDER BY "p"."brand"


SELECT "p"."brand" , "p"."model"
FROM "phones_to_orders" AS "po"
JOIN "phones"  AS "p" ON "p"."id" = "po"."phoneId"
GROUP BY "p"."brand", "p"."model"
ORDER BY "p"."brand"


SELECT "p"."brand" , "p"."model"
FROM "phones_to_orders" AS "po"
FULL JOIN "phones"  AS "p" ON "p"."id" = "po"."phoneId"
GROUP BY "p"."brand", "p"."model"
ORDER BY "p"."brand"

SELECT "p"."brand" , "p"."model"
FROM "phones"  AS "p" 
FULL JOIN "phones_to_orders" AS "po" ON "p"."id" = "po"."phoneId"
GROUP BY "p"."brand", "p"."model"
ORDER BY "p"."brand"


SELECT "p"."brand" , "p"."model"
FROM "phones"  AS "p" 
RIGHT JOIN "phones_to_orders" AS "po" ON "p"."id" = "po"."phoneId"
GROUP BY "p"."brand", "p"."model"
ORDER BY "p"."brand"

SELECT "p"."brand" , "p"."model"
FROM "phones_to_orders" AS "po"
RIGHT JOIN "phones"  AS "p" ON "p"."id" = "po"."phoneId"
WHERE "po"."phoneId" IS NULL
GROUP BY "p"."brand", "p"."model"
ORDER BY "p"."brand"



SELECT "u"."email"
FROM "users" AS "u"
  JOIN "orders" AS "o" ON "u"."id" = "o"."userId"
  JOIN "phones_to_orders" AS "pto" ON "o"."id" = "pto"."orderId"
  JOIN "phones" AS "p" ON "pto"."phoneId" = "p"."id"
WHERE "p"."brand" ILIKE 'Iphone'




SELECT "u"."email", "p"."brand"
FROM "users" AS "u"
JOIN "orders" AS "o" ON "o"."userId" = "u"."id"
JOIN "phones_to_orders" "pto" ON "pto"."orderId" = "o"."id" 
JOIN "phones" AS "p" ON "pto"."phoneId" = "p"."id"
WHERE "p"."brand" ILIKE 'iphone';



SELECT "o"."id", "u"."email"
FROM "users" AS "u"
JOIN "orders" AS "o" ON "u"."id" = "o"."userId"
JOIN "phones_to_orders" AS "po" ON "o"."id" = "po"."orderId"
JOIN "phones" AS "p" ON "po"."phoneId" = "p"."id"
WHERE "p"."id" = 33



--получить пользователя и кол-во моделей, которые он покупал
--отсортировать по кол-ву

SELECT u.id, u."email", pto."phoneId"
FROM "users" AS u
JOIN "orders" AS o ON u."id" = o."userId"
JOIN "phones_to_orders" AS pto ON o."id" = pto."orderId"
WHERE u.id=477
GROUP BY u.id, u."email", pto."phoneId";

SELECT u."email", count(pto."phoneId")
FROM "users" AS u
JOIN "orders" AS o ON u."id" = o."userId"
JOIN "phones_to_orders" AS pto ON o."id" = pto."orderId"
WHERE u.id=477
GROUP BY u."email";

SELECT u.id ,"u"."firstName", "u"."lastName", count("pto"."quantity") AS "quantityModelUser"
FROM "users" AS "u"
  JOIN "orders" AS "o" ON "u"."id" = "o"."userId"
  JOIN "phones_to_orders" AS "pto" ON "o"."id" = "pto"."orderId"
  JOIN "phones" AS "p" ON "p"."id" = "pto"."phoneId"
-- WHERE u.id=3  
GROUP BY "u"."firstName", "u"."lastName", u.id

SELECT u."email", count(pto."phoneId")
FROM "users" AS u
JOIN "orders" AS o ON u."id" = o."userId"
JOIN "phones_to_orders" AS pto ON o."id" = pto."orderId"
GROUP BY u."email"
ORDER BY count(pto."phoneId")


SELECT u."id", u."email", count(pto."phoneId") AS "count"
FROM "users" AS u
JOIN "orders" AS o ON u."id" = o."userId"
JOIN "phones_to_orders" AS pto ON o."id" = pto."orderId"
GROUP BY u."id", u."email"
ORDER BY "count";


SELECT count("pto"."quantity"), concat("u"."firstName", ' ', "u"."lastName") "Full Name"
FROM "users" "u"
JOIN "orders" AS "o" ON "o"."userId" = "u"."id"
JOIN "phones_to_orders" "pto" ON "pto"."orderId" = "o"."id" 
GROUP BY "u"."firstName", "u"."lastName"
ORDER BY count("pto"."quantity")



SELECT "u"."email",
count("pto"."orderId")
FROM "users" AS "u"
    JOIN "orders" AS "o" ON "u"."id" = "o"."userId"
    JOIN "phones_to_orders" AS "pto" ON "o"."id" = "pto"."orderId"
GROUP BY "u"."email"
ORDER BY count("pto"."orderId")