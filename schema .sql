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

CREATE TABEL book (
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  Publish_date DATE (30),
  publisher  VARCHAR (250),
  cover_state VARCHAR (250),
  PRIMARY KEY(id)
);

CREATE TABEL label (
  id  INTEGER GENERATED ALWAYS AS IDENTITY,
  title VARCHAR (250),
  color VARCHAR (200),
  PRIMARY key  (id)
);
