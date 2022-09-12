CREATE TABLE "bars"(
  "id" serial PRIMARY KEY,
  "name" varchar(64) NOT NULL,
  "address" jsonb NOT NULL
);

INSERT INTO "bars"("name", "address")
VALUES ('MAC', '{"country":"Ukraine","town":{
  "title":"Izum",
  "street":"Avenu 5"
}}');

SELECT ('"address"')['country']
FROM "bars";

SELECT "address"
FROM "bars";