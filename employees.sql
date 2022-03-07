 CREATE TABLE employees (
 	id INT  NOT NULL AUTO_INCREMENT,
    last_name varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100),
    age INT NOT NULL,
    current_status varchar(100) NOT NULL DEFAULT 'employed',/**/
    PRIMARY KEY (id)
);

 CREATE TABLE employees (
 	id INT  NOT NULL AUTO_INCREMENT  PRIMARY KEY,
    last_name varchar(100) NOT NULL,
    first_name varchar(100) NOT NULL,
    middle_name varchar(100),
    age INT NOT NULL,
    current_status varchar(100) NOT NULL DEFAULT 'employed',
);

 CREATE TABLE cats (
 	cate_id INT  NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(100),
    breed varchar(100),
    age INT(100)
);

INSERT INTO cats (name, breed, age)
VALUES ('Ringo', 'Tobby', 4),
       ('Cindy', 'Maine Coon', 6),
       ('Dumbledore', 'Main Coon', 11),
       ('Egg', 'Persia',4),
       ('Mistry', 'Tabby', 13),
       ('George Michael', 'Ragdoll', 9),
       ('Jackson', 'Sphunx', 7);


-- shirts_db create 

 CREATE TABLE shirts (
 	shirt_id INT  NOT NULL AUTO_INCREMENT  PRIMARY KEY,
    article varchar(100) ,
    color varchar(100) ,
    shirt_size varchar(100) ,
    last_won INT 
);


INSERT INTO shirts (article, color, shirt_size, last_won)
VALUES ('t-shirt', 'white', 'S', 10),
       ('t-shirt', 'Green', 'S', 200),
       ('polo shirt', 'black', 'M', 10),
       ('tank top', 'blue', 'S', 50),
       ('t-shirt', 'pink', 'S', 0),
       ('polo shirt', 'red', 'M', 5),
       ('tank top', 'white', 'S', 200),
       ('tank top', 'blue', 'M', 15);

-- add row into the shirts table
INSERT INTO shirts (article, color, shirt_size, last_won)
VALUES ('polo shirt', 'purple', 'M',50);
    

UPDATE shirts  SET shirt_size= 'L'  WHERE article = 'polo shirt' ;
DELETE FROM shirts WHERE last_won = 200 ;