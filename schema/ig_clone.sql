-- to run this file to mysql server:
-- mysql> source /Users/Drew/Documents/Udemy lectures/Ultimate MYSQL Bootcamp/instagram_clone_db/schema/ig_clone.sql

CREATE DATABASE ig_clone;
USE ig_clone;

CREATE TABLE users (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT NOW()
)

INSERT INTO users (username) VALUES
  ('BlueCat'),
  ('CharlieBrown'),
  ('ColtSteele');

CREATE TABLE photos (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  image_url VARCHAR(255) NOT NULL,
  user_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE comments (
  id INTEGER AUTO_INCREMENT PRIMARY KEY,
  comment_text VARCHAR(255) NOT NULL,
  user_id INTEGER NOT NULL,
  photo_id INTEGER NOT NULL,
  created_at TIMESTAMP DEFAULT NOW(),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (photo_id) REFERENCES photos(id)
);
