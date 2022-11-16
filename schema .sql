CREATE DATABASE catalog_of_things;

CREATE TABLE game(
  id INT GENERATED ALWAYS AS IDENTITY,
  multiplayer VARCHAR(3),
  last_played_at DATE,
  archived BOOLEAN,
  author_id INT,
  CONSTRAINT fk_game FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
  PRIMARY KEY(id)
);

CREATE TABLE author(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  first_name VARCHAR(250),
  last_name VARCHAR(250),
  PRIMARY KEY(id)
);

CREATE TABLE MUSICALBUM (
  id SERIAL PRIMARY KEY,
  music_album_name VARCHAR(100),
  on_spotify BOOLEAN,
  release_date DATE,
  FOREIGN KEY(genre_id) REFERENCES GENRE (id) ON DELETE CASCADE
);

CREATE TABLE GENRE (
  id INT SERIAL PRIMARY KEY,
  genre_name VARCHAR(100),
)