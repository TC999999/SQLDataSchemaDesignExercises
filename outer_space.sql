-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE orbital_bodies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL UNIQUE
);

CREATE TABLE planets_orbital_period
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE planets_orbital_bodies
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  orbits_around_id INTEGER REFERENCES orbital_bodies
);

CREATE TABLE planets_galaxies
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  galaxy_id INTEGER REFERENCES galaxies
);

CREATE TABLE planets_moons
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets,
  moon_id INTEGER REFERENCES moons
);

INSERT INTO planets (name)
VALUES
('Earth'),
('Mars'),
('Venus'),
('Neptune'),
('Proxima Centauri b'),
('Gliese 876 b');

INSERT INTO orbital_bodies (name)
VALUES
('The Sun'),
('Proxima Centauri'),
('Gliese 876');

INSERT INTO galaxies (name)
VALUES
('Milky Way');

INSERT INTO moons (name)
VALUES
('The Moon'),
('Phobos'),
('Deimos'),
('Naiad'),
('Thalassa'),
('Despina'),
('Galatea'),
('Larissa'),
('S/2004 N 1'),
('Proteus'),
('Triton'),
('Nereid'),
('Halimede'),
('Sao'),
('Laomedeia'),
('Psamathe'),
('Neso');

INSERT INTO planets_orbital_period (planet_id, orbital_period_in_years)
VALUES
(1, 1.00),
(2, 1.88),
(3, 0.62),
(4, 164.8),
(5, 0.03),
(6, 0.23);

INSERT INTO planets_orbital_bodies(planet_id, orbits_around_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 2),
(6, 3);

INSERT INTO planets_galaxies(planet_id, galaxy_id)
VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1);

INSERT INTO planets_moons (planet_id, moon_id)
VALUES
(1, 1),
(2, 2),
(2, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17);