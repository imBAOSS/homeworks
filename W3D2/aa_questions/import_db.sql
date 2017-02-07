DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)

);

DROP TABLE if exists replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  reply_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
  FOREIGN KEY (reply_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,


  FOREIGN KEY (user_id) REFERENCES users(id)
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('bob', 'jones'),
  ('joe', 'smith'),
  ('jane', 'doe'),
  ('mary', 'blige');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('question A', "what's the deal yo", (SELECT id FROM users WHERE fname = 'bob' AND lname = 'jones')),
  ('question B', "what time is it", (SELECT id FROM users WHERE fname = 'bob' AND lname = 'jones')),
  ('question C', "where you at", (SELECT id FROM users WHERE fname = 'mary' AND lname = 'blige')),
  ('question D', "who let the dogs out", (SELECT id FROM users WHERE fname = 'jane' AND lname = 'doe'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'bob' AND lname = 'jones'),
    (SELECT id FROM questions WHERE title = 'question A')),
  ((SELECT id FROM users WHERE fname = 'bob' AND lname = 'jones'),
    (SELECT id FROM questions WHERE title = 'question B')),
  ((SELECT id FROM users WHERE fname = 'jane' AND lname = 'doe'),
    (SELECT id FROM questions WHERE title = 'question B')),
  ((SELECT id FROM users WHERE fname = 'joe' AND lname = 'smith'),
    (SELECT id FROM questions WHERE title = 'question B')),
  ((SELECT id FROM users WHERE fname = 'joe' AND lname = 'smith'),
    (SELECT id FROM questions WHERE title = 'question D'));

INSERT INTO
  replies (body, question_id, user_id, reply_id)
VALUES
  ("reply to question C", (SELECT id FROM questions WHERE title = 'question C'),
    (SELECT id FROM users WHERE fname = 'bob' AND lname = 'jones'), NULL),
  ("reply to question A", (SELECT id FROM questions WHERE title = 'question A'),
    (SELECT id FROM users WHERE fname = 'joe' AND lname = 'smith'), NULL),
  ("reply to question B", (SELECT id FROM questions WHERE title = 'question B'),
    (SELECT id FROM users WHERE fname = 'mary' AND lname = 'blige'), NULL),
  ("reply to question D", (SELECT id FROM questions WHERE title = 'question D'),
    (SELECT id FROM users WHERE fname = 'joe' AND lname = 'smith'), NULL);

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'bob' AND lname = 'jones'),
    (SELECT id FROM questions WHERE title = 'question C')),
  ((SELECT id FROM users WHERE fname = 'jane' AND lname = 'doe'),
    (SELECT id FROM questions WHERE title = 'question A'));
