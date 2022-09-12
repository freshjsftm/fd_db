CREATE TYPE task_status AS ENUM('done', 'processing', 'reject');

CREATE TABLE "user_tasks"(
  "id" serial PRIMARY KEY,
  "body" text NOT NULL,
  "userId" INT REFERENCES "users"("id"),
  "status" task_status NOT NULL,
  "deadLine" TIMESTAMP NOT NULL DEFAULT current_timestamp
);

INSERT INTO "user_tasks"("body","userId","status")
VALUES ('text task 1', 1, 'done'),
('text task 0', 1, 'reject');

INSERT INTO "user_tasks"("body","userId","status")
VALUES ('qwerty', 3, 'done');

--add column
ALTER TABLE "user_tasks"
ADD COLUMN "createdAt" TIMESTAMP NOT NULL DEFAULT current_timestamp CHECK("createdAt"<=current_timestamp);

--drop column
ALTER TABLE "user_tasks"
DROP COLUMN "createdAt";

ALTER TABLE "user_tasks"
ADD CONSTRAINT "check_body" CHECK ("body" != '');

ALTER TABLE "user_tasks"
DROP CONSTRAINT "user_tasks_createdAt_check";

--drop NUL NULL
ALTER TABLE "user_tasks"
ALTER COLUMN "status" DROP NOT NULL;

ALTER TABLE "user_tasks"
ALTER COLUMN "status" SET NOT NULL;

ALTER TABLE "user_tasks"
ALTER COLUMN "status" SET DEFAULT 'processing';

ALTER TABLE "user_tasks"
ALTER COLUMN "status" DROP DEFAULT;

ALTER TABLE "user_tasks"
ALTER COLUMN "body" TYPE VARCHAR(256);

ALTER TABLE "user_tasks"
RENAME COLUMN "body" TO "content";

ALTER TABLE "user_tasks"
RENAME  TO "tasks";

SELECT * 
FROM  "tasks";