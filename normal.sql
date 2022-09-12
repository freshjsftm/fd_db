--2 normal form
CREATE TABLE positions(
  id,
  name,
  is_car
)
INSERT INTO positions (name,is_car)
VALUES ('dir', false), ('teacher', false),('driver', true); 

CREATE TABLE workers(
  id serial primary key,
  name,
  departament,
  position_id REFERENCES positions.id
);

INSERT INTO workers(
  name,
  position_id)
VALUES ('Elon', 1), ('Tom', 2),('Fred',3);  




CREATE TABLE students(id)

CREATE TABLE teachers(id)

CREATE TABLE s_t_subject(
  s_id REFERENCES students.id,
  t_id REFERENCES teachers.id,
  subj varchar(128),
  primary key (s_id, t_id)
)

INSERT INTO s_t_subject 
VALUES (1, 1, 'js'),(2, 1, 'js'),(3, 1, 'js'), (1, 2, 'sql');