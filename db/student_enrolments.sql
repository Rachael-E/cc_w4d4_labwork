DROP TABLE IF EXISTS houses;
DROP TABLE IF EXISTS students;


CREATE TABLE houses (
  id SERIAL4 primary key,
  name VARCHAR(255)
);

CREATE TABLE students (
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  second_name VARCHAR(255),
  house_id INT4 REFERENCES houses(id),
  age INT
);
