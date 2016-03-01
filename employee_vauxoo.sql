-- Your sql code in this file
-- NOTE: Please, don't add sentence to create database in this script file.
--       You can create database locally to test it.
--       Consider add ';' at end sentence.

--- Using PostgreSQL

CREATE TABLE employee_department (
    id SERIAL primary key,
    name VARCHAR(40) not null,
    description VARCHAR(200) not null,
    UNIQUE(name)
);

CREATE TABLE employee (
    id BIGSERIAL primary key,
    first_name VARCHAR(40) not null,
    last_name VARCHAR(40) not null,
    id_empl_dept INTEGER REFERENCES employee_department(id)
);

INSERT INTO employee_department (name, description)
VALUES
    ('Security', 'Security Department'),
    ('Development', 'Software Development'),
    ('QA', 'Quality and Assurance'),
    ('DBA', 'Database Administration'),
    ('Design', 'Graphical Designers'),
    ('Big Bosses', 'Our big bosses');

INSERT INTO employee (first_name, last_name, id_empl_dept)
VALUES
    ('Fuad', 'Massum', 1),
    ('Almazbek', 'Atambayev', 3),
    ('Mahamadou', 'Issoufu', 2),
    ('Andrzej', 'Duda', 4);
