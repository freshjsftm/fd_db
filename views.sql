CREATE OR REPLACE VIEW "email_sezon_birthday" AS (
  SELECT(
  CASE extract("months" from "birthday")
      WHEN 1 THEN 'winter'
      WHEN 2 THEN 'winter'
      WHEN 3 THEN 'spring'
      WHEN 4 THEN 'spring'
      WHEN 5 THEN 'spring'
      WHEN 6 THEN 'summer'
      WHEN 7 THEN 'summer'
      WHEN 8 THEN 'summer'
      WHEN 9 THEN 'fall'
      WHEN 10 THEN 'fall'
      WHEN 11 THEN 'fall'
      ELSE 'winter'
    END
  ) AS "sezon", "birthday", "email", "id"
  FROM "users"
);
-- DROP VIEW "email_sezon_birthday";
SELECT * FROM "email_sezon_birthday"
ORDER BY "birthday";

--посчитать сколько пользователей родилось в каждом из сезонов
SELECT count("birthday"), "sezon"
FROM "email_sezon_birthday"
GROUP BY "sezon"

--пользователи какого сезона делают больше всего закзов

SELECT "esb"."sezon", count("o".*)
FROM "email_sezon_birthday" AS "esb"
  JOIN "orders" AS "o" ON "esb"."id" = "o"."userId"
GROUP BY "esb"."sezon"  

--пользователи какого сезона потратили больше всего денег

--создвть вьюшку: юзер и сколько денег он потратил
CREATE OR REPLACE VIEW "user_money" AS (
  SELECT "o"."userId" AS "userId", sum("p"."price"*"pto"."quantity")
  FROM "orders" AS "o"
    JOIN "phones_to_orders" AS "pto" ON "o"."id"="pto"."orderId"
    JOIN "phones" AS "p" ON "pto"."phoneId"="p"."id"
  GROUP BY "o"."userId"
  ORDER BY "o"."userId"
);

SELECT "esb"."sezon", sum("um"."sum")
FROM "email_sezon_birthday" AS "esb"
  JOIN "user_money" AS "um" ON "esb"."id"="um"."userId"
GROUP BY "esb"."sezon"
ORDER BY "esb"."sezon"
