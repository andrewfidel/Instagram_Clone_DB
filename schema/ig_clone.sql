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
