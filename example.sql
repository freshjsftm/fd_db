
CREATE TABLE a(wa VARCHAR(4), q int);
CREATE TABLE b(wb VARCHAR(4));

INSERT INTO a VALUES ('qwe',1), ('asd', 8), ('zxc', 35);
INSERT INTO b VALUES ('qwe'), ('asd'), ('zxc'), ('rrrr');
INSERT INTO a VALUES ('www',1);

SELECT wb FROM b
EXCEPT
SELECT wa FROM a

SELECT wa FROM a
EXCEPT
SELECT wb FROM b