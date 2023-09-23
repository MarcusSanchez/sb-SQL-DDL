-- Design a schema for a simple sports league. Your schema should keep track of
-- - All of the teams in the league
-- - All of the goals scored by every player for each game
-- - All of the players in the league and their corresponding teams
-- - All of the referees who have been part of each game
-- - All of the matches played between teams
-- - All of the start and end dates for season that a league has
-- - The standings/rankings of each team in the league
-- (This doesn’t have to be its own table if the data can be captured somehow).

CREATE TABLE teams (
    id   INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE players (
    id      INT PRIMARY KEY,
    name    VARCHAR(255) NOT NULL,
    team_id INT          NOT NULL REFERENCES teams (id)
);

CREATE TABLE referees (
    id   INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE matches (
    id       INT PRIMARY KEY,
    team1_id INT  NOT NULL REFERENCES teams (id),
    team2_id INT  NOT NULL REFERENCES teams (id),
    date     DATE NOT NULL
);

CREATE TABLE goals (
    id               INT PRIMARY KEY,
    team_id          INT NOT NULL REFERENCES teams (id),
    opposing_team_id INT NOT NULL REFERENCES teams (id),
    player_id        INT NOT NULL REFERENCES players (id),
    match_id         INT NOT NULL REFERENCES matches (id)
);

CREATE TABLE seasons (
    id         INT PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date   DATE NOT NULL
);

CREATE TABLE standings (
    id        INT PRIMARY KEY,
    team_id   INT NOT NULL REFERENCES teams (id),
    season_id INT NOT NULL REFERENCES seasons (id),
    rank      INT NOT NULL UNIQUE CHECK (rank > 0)
);

-- junction tables --

CREATE TABLE matches_referees (
    id         INT PRIMARY KEY,
    match_id   INT NOT NULL REFERENCES matches (id),
    referee_id INT NOT NULL REFERENCES referees (id)
);

CREATE TABLE matches_seasons (
    id        INT PRIMARY KEY,
    match_id  INT NOT NULL REFERENCES matches (id),
    season_id INT NOT NULL REFERENCES seasons (id)
);