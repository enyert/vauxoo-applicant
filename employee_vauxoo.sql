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
    id_empl_dept INTEGER REFERENCES employee_department(id),
    boss_assigned_id INTEGER REFERENCES employee(id),
    CHECK (boss_assigned_id <> id)
);

CREATE TABLE employee_hobby (
    id SERIAL primary key,
    name VARCHAR(40) not null,
    description VARCHAR(200) not null,
    UNIQUE(name)
);

CREATE TABLE employee_hobby_mm (
    --id SERIAL primary key,
    employee_id INTEGER REFERENCES employee(id) ON UPDATE CASCADE ON DELETE CASCADE,
    hobby_id INTEGER REFERENCES employee_hobby(id) ON UPDATE CASCADE,
    UNIQUE(employee_id, hobby_id)
);

INSERT INTO employee_department (name, description)
VALUES
    ('Security', 'Security Department'),
    ('Development', 'Software Development'),
    ('QA', 'Quality and Assurance'),
    ('DBA', 'Database Administration'),
    ('Design', 'Graphical Designers'),
    ('Big Bosses', 'Our big bosses');

INSERT INTO employee (first_name, last_name, id_empl_dept, boss_assigned_id)
VALUES
    ('Fuad', 'Massum', 1, 2),
    ('Almazbek', 'Atambayev', 3, null),
    ('Mahamadou', 'Issoufu', 2, 2),
    ('Andrzej', 'Duda', 4, 2);

INSERT INTO employee_hobby (name, description)
VALUES
    ('Table Tennis', 'Only for chinese people'),
    ('Baseball', 'Only for fat people'),
    ('Volleyball', 'If you are not a libero then you need to be a giant');

INSERT INTO employee_hobby_mm (employee_id, hobby_id)
VALUES
    (1, 1),
    (1, 2),
    (2, 2),
    (2, 1),
    (3, 3),
    (3, 2);
