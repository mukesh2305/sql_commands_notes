DROP DATABASE IF EXISTS ig_clone;
CREATE DATABASE IF NOT EXISTS `ig_clone`;
USE `ig_clone`;

CREATE TABLE users (
    id int AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) UNIQUE NOT NULL, 
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(username)
    VALUES('mukesh'), 
          ('priti'),
          ('ketan'),
          ('kavita');

CREATE TABLE users (
    id int AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(100) UNIQUE NOT NULL,
    user_id INT FOREIGN KEY (user_id) REFERENCES users(id) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO users(image_url, user_id)
   VALUES ('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', 1),
          ('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', 2),
          ('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', 3),
          ('https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png', 4);