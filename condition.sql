SELECT "isMale"
FROM "users";

/*
CASE 
  WHEN cond1=true THEN act1
  WHEN cond2=true THEN act2
  WHEN cond3=true THEN act3
  ELSE act4
END
*/
/*
CASE expression
  WHEN v1 THEN act1
  WHEN v2 THEN act2
  WHEN v3 THEN act3
  ELSE act4
END
*/

SELECT (
  CASE
    WHEN "isMale" THEN 'male'
    ELSE 'female'
  END
) AS "gender", "isMale", "firstName"
FROM "users";



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
) AS "sezon", "birthday"
FROM "users";

--вывести день рождения,  возраст и  молодой и старый 33

--вывести телефоны и если бренд айфон выводим APPLE иначе выводим - OTHER


--вывести телефоны и колонку level  - если цена выше средней -ABOVE , а иначе - BELOW
SELECT (
    CASE
        WHEN "price" > ( SELECT avg("price") FROM "phones" ) THEN 'ABOVE'
        ELSE 'BELOW'
    END
) AS "LEVEL", *
FROM "phones";

SELECT sum(
  CASE
    WHEN extract("years" from age("birthday"))>50 THEN 1
    ELSE 0
  END
)
FROM "users";






SELECT COALESCE(NULL,15,12);

UPDATE "phones"
SET "description"='Функция COALESCE возвращает первый попавшийся аргумент, отличный от NULL. '
WHERE id=2

SELECT "model", COALESCE("description", 'Not description')
FROM "phones";


SELECT NULLIF(50,50);
SELECT NULLIF(12,50);
SELECT NULLIF(NULL,50);
SELECT NULLIF(NULL,NULL);
SELECT "model", NULLIF('Not description', "description")
FROM "phones"




SELECT  "email", "id"
FROM "users"
WHERE "id" NOT IN (SELECT "userId" FROM "orders");

SELECT * 
FROM "phones"
WHERE "id" != ALL(SELECT "phoneId" FROM "phones_to_orders");

--выбрать телефоны, которые не покупали
SELECT "brand" 
FROM "phones"
WHERE "id"  NOT IN (SELECT "phoneId" FROM "phones_to_orders") ;

SELECT EXISTS (SELECT "id" FROM "users" 
WHERE extract("days" from "birthday")=33);


SELECT "u"."email"
FROM "users" AS "u"
WHERE NOT EXISTS(
  SELECT * FROM "orders" AS "o" WHERE "u"."id"="o"."userId"
);



