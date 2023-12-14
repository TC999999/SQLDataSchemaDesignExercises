DROP DATABASE medical_db;
CREATE DATABASE medical_db;
\c medical_db;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_number TEXT UNIQUE,
    email TEXT UNIQUE
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    phone_number TEXT UNIQUE,
    email TEXT UNIQUE
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER NOT NULL REFERENCES patients,
    visit_date DATE NOT NULL,
    symptoms TEXT
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    disease_name TEXT NOT NULL
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    visit_id INTEGER NOT NULL REFERENCES visits ON DELETE CASCADE,
    diagnosis INTEGER NOT NULL REFERENCES diseases,
    prescription TEXT NOT NULL,
    other_notes TEXT
);

INSERT INTO doctors (first_name, last_name, phone_number, email)
VALUES
('Drake', 'Ramoray', 9999999999, 'howudoin@gmail.com'),
('Regina', 'Phalange', 2223334444, 'ohno345@gmail.com'),
('Ken', 'Adams', 1234567890, 'weonabreak@gmail.com');

INSERT INTO patients (first_name, last_name, phone_number, email)
VALUES
('Rachel','Green', 7892344567, 'worldworsthangovr@gmail.com'),
('Chandler', 'Bing', 1098763451, 'givemefreedom@gmail.com'),
('Gunther', 'Centralperk', 8765432109, 'wasinotsupposeto@gmail.com');

INSERT INTO visits (doctor_id, patient_id, visit_date, symptoms)
VALUES
(1, 1, '1980-03-09', 'chills, dizziness, runny nose'),
(1, 2, '1980-04-05', 'sore throat, chills, groats on throat, constant coughing'),
(2, 2, '1980-06-17', 'splitting headache on half of head'),
(3, 2, '1981-01-23', NULL),
(3, 3, '1981-02-28', NULL),
(1, 3, '1981-05-06', NULL),
(2, 1, '1981-07-11', NULL);

INSERT INTO diseases (disease_name)
VALUES
('common cold'),
('strep throat'),
('bronchitis'),
('migraines');

INSERT INTO diagnoses (visit_id, diagnosis, prescription, other_notes)
VALUES
(1, 1, 'bed rest', NULL),
(2, 2, 'penicillin', 'family has history of penicillin allergies'),
(2, 3, 'cough syrup', NULL),
(3, 4, 'nerve pain medication', 'family has history of migraines');