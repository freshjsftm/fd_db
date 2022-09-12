
INSERT INTO "users" (
    "firstName",
    "lastName",
    "email",
    "isMale",
    "birthday",
    "height"
  )
VALUES (
    'Bred',
    'Pitt',
    'qweasd@qwe.qwe',
    true,
    '1975-02-02',
    1.87
  ),
  (
    'Fred',
    'Pitterson',
    'qweqwe@qwe.qwe',
    true,
    '1975-02-02',
    1.87
  );
  
--вывести всех пользователей, которые совершили заказы  INTERSECT
SELECT "id" FROM "users"
INTERSECT
SELECT "userId" FROM "orders"
--вывести всех пользователей, которые НЕ совершили заказы   EXCEPT
SELECT "id" FROM "users"
EXCEPT
SELECT "userId" FROM "orders"
