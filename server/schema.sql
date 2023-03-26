CREATE DATABASE todo_app;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255)
);

CREATE TABLE todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  completed BOOLEAN DEFAULT false,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
  id INT AUTO_INCREMENT PRIMARY KEY,
  todo_id INT,
  user_id INT,
  shared_with_id INT,
  FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Insert two users into the users table
INSERT INTO `users`(`id`, `name`, `email`, `password`) VALUES (1,'Josue','user1@example.com','password1');
INSERT INTO `users`(`id`, `name`, `email`, `password`) VALUES (2,'Andrea','user2@example.com','password2');

-- Insert todos into the todos table, associated with the first user 
INSERT INTO `todos`(`id`, `title`, `completed`, `user_id`) 
VALUES 
(1, 'Go for a morning run', false, 1),
(2, 'Work on project presentation', false, 1),
(3, 'Read 30 pages of book', false, 1),
(4, 'Practice yoga', false, 1),
(5, 'Clean the house', false, 1),
(6, 'Study React Native', false, 1),
(7, 'Walking the dog', false, 1),
(8, 'Listen to a podcast', false, 1),
(9, 'Cook dinner', false, 1),
(10, 'Get 8 hours of sleep', false, 1);

-- Share todo 1 of user 1 whit user 2
INSERT INTO `shared_todos`(`id`, `todo_id`, `user_id`, `shared_with_id`) 
VALUES (1, 1, 1, 2);