CREATE SCHEMA tr;
CREATE TABLE tr.users(
  id serial PRIMARY KEY,
  login VARCHAR(128) CHECK(login != ''),
  email VARCHAR(128) CHECK(email != ''),
  password VARCHAR(128) CHECK(password != '')
);
--переименовать password в password_hash
--добавить ограничения NOT NULL для login, email, password_hash
--добавить логину значение по умолчанию anonim
--создать таблицу workers(id, salary, department, position)
CREATE TABLE tr.workers(
    id serial primary key,
    salary DECIMAL(10,2) CHECK(salary > 0),
    department varchar(64) check(department != '') NOT NULL,
    position varchar(64) check(position != '') NOT NULL
)

--добавить связь к таблицам user_id
ALTER TABLE tr.workers
ADD COLUMN user_id INT REFERENCES tr.users(id);

ALTER TABLE tr.users
RENAME COLUMN password TO password_hash;

ALTER TABLE tr.users
ALTER COLUMN login SET NOT NULL,
ALTER COLUMN email SET NOT NULL,
ALTER COLUMN password_hash SET NOT NULL;

ALTER TABLE tr.users
ALTER COLUMN login SET DEFAULT 'anonim';

--добавить уникальность почте
ALTER TABLE tr.users
ADD UNIQUE(email);

INSERT INTO tr.users (login, email, password_hash)
VALUES ('qwerty','qweq@wer.er', 'qwewer'), ('asdfgh','asdadew@wer.er', 'qasdsawew');

INSERT INTO tr.users (email, password_hash)
VALUES ('qwe@wer.er', 'qwewer'), ('asdade@wer.er', 'qasdsawew');

INSERT INTO tr.workers (salary, department, position, user_id)
VALUES (23000, 'hr', 'hr', 1), (23400, 'dev', 'dev', 2);

--выбрать почту пользователей, которые не работают
SELECT u.id
FROM tr.users AS u
 LEFT JOIN tr.workers AS w ON w.user_id = u.id
WHERE w.user_id IS NULL  

--выбрать логин и зарплату, работающих
SELECT  u.login, w.salary
FROM tr.users AS u
 JOIN tr.workers AS w ON w.user_id = u.id


--
