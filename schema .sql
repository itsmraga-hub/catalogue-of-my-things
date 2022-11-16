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