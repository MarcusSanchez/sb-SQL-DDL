-- Design the schema for a medical center.
-- - A medical center employs several doctors
-- - A doctors can see many patients
-- - A patient can be seen by many doctors
-- - During a visit, a patient may be diagnosed to have one or more diseases.

CREATE TABLE doctors
(
    id         INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name  VARCHAR NOT NULL
);

CREATE TABLE patients
(
    id         INT PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name  VARCHAR NOT NULL
);

CREATE TABLE diseases (
    id   INT PRIMARY KEY,
    name VARCHAR NOT NULL
);


-- junction tables --

CREATE TABLE doctors_patients (
    id         INT PRIMARY KEY,
    doctor_id  INT NOT NULL REFERENCES doctors (id),
    patient_id INT REFERENCES patients (id)
);

CREATE TABLE patients_diseases (
    id         INT PRIMARY KEY,
    patient_id INT REFERENCES patients (id),
    disease_id INT NOT NULL REFERENCES diseases (id)
);