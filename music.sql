-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
    id   SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE producers (
    id   SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE albums (
    id     SERIAL PRIMARY KEY,
    name   TEXT NOT NULL,
    release_date DATE NOT NULL
);

CREATE TABLE songs (
    id                  SERIAL PRIMARY KEY,
    title               TEXT    NOT NULL,
    duration_in_seconds INTEGER NOT NULL,
    artist_id           INT     NOT NULL REFERENCES artists (id),
    album_id            INT     NOT NULL REFERENCES albums (id)
);

CREATE TABLE song_producers (
    id          SERIAL PRIMARY KEY,
    song_id     INT NOT NULL REFERENCES songs (id),
    producer_id INT NOT NULL REFERENCES producers (id)
);