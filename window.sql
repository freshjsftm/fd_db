SELECT "u"."email", "u"."id",
count("o"."userId")
FROM  "users" AS "u"
  JOIN "orders" AS "o" ON "u"."id"="o"."userId"
GROUP BY   "u"."email", "u"."id"

SELECT "u"."email", "o"."id",
count("o"."userId") OVER (PARTITION BY "o"."userId")
FROM  "users" AS "u"
  JOIN "orders" AS "o" ON "u"."id"="o"."userId"

--заказ модель телефона и сумма заказа
SELECT "pto"."orderId", "p"."model" , "p"."id",
sum("p"."price"*"pto"."quantity") OVER (PARTITION BY "pto"."orderId" ORDER BY "p"."id" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
FROM "phones_to_orders" AS "pto"
  JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"