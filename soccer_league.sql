DROP DATABASE soccer_db;
CREATE DATABASE soccer_db;
\c soccer_db;

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    region_name TEXT UNIQUE NOT NULL
);

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    team_name TEXT UNIQUE NOT NULL,
    region_id INTEGER REFERENCES regions 
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams 
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE stadiums
(
    id SERIAL PRIMARY KEY,
    stadium_name TEXT UNIQUE NOT NULL,
    region_id INTEGER REFERENCES regions
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    stadium_id INTEGER REFERENCES stadiums,
    team1_id INTEGER REFERENCES teams,
    team2_id INTEGER REFERENCES teams,
    referee_id INTEGER REFERENCES referees,
    season_id INTEGER REFERENCES seasons
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    game_id INTEGER REFERENCES games,
    player_id INTEGER REFERENCES players
);

CREATE TABLE rankings
(
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES seasons,
    rankings INT NOT NULL,
    team_id INTEGER REFERENCES teams 
);

INSERT INTO regions (region_name)
VALUES
('ENG'),
('ITA'),
('FRA');

INSERT INTO teams (team_name, region_id)
VALUES
('Balls', 1),
('Hexagons', 2),
('Fields', 3);

INSERT INTO players (first_name, last_name, team_id)
VALUES
('Soccer', 'McFootball', 1),
('Football', 'McSoccer', 1),
('Dan', 'Goalie', 2),
('Ryan', 'Foul', 3);

INSERT INTO referees (first_name, last_name)
VALUES
('Zebra', 'Whistle'),
('Rolling', 'Fists'),
('Red', 'Card');

INSERT INTO stadiums (stadium_name, region_id)
VALUES
('Britain Stad', 1),
('Spaghetti Hall', 2),
('French Field', 3);

INSERT INTO seasons (start_date, end_date)
VALUES
('2020-01-30','2020-08-09'),
('2021-02-01','2021-08-12'),
('2022-01-28','2022-08-05');

INSERT INTO games (stadium_id, team1_id, team2_id, referee_id, season_id)
VALUES
(2,1,2,2,1),
(3,2,3,2,1),
(1,3,1,3,1);

INSERT INTO goals (game_id, player_id)
VALUES
(1,2),
(1,1),
(2,4),
(3,3);

INSERT INTO rankings (season_id, rankings, team_id)
VALUES
(1,1,2),
(1,2,3),
(1,3,1);