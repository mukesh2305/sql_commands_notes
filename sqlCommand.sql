=> SHOW DATABASES; -- to see all the database; 

=> USE hello_world;  -- to use particular database;

=> CREATE DATABASE cate_app;  -- to crate database;

=> SELECT database(); -- which database we are using


-- //////////// TABLE ///////////////

=> Create Tabele 
 CREATE TABLE cats (
    name varchar(50),
    age INT(11)
);

=> SHOW tables; -- show all the tables inside the current use database;

=> SHOW COLUMNS FROM cats; || => DESC cate; -- show table schema 

=> DROP TABLE cats; -- drop table from the database.

-- => Insert into single table 
INSERT INTO unique_cats2 (name, age)
VALUES ('Jetson', 7); 

   -> Insert multiple data into table
      INSERT INTO cats (name, age)
      VALUES ('Jetson', 7),
             ('jan', 6),
             ('man', 5);

-- => view data from the table 
SELECT * FROM cats;
SELECT name FROM cats; -- particular value from the table
SELECT name, age FROM cats; -- particular value from the table





-- => Create Tabele values are not Null
 CREATE TABLE cats2 (
    name varchar(100) NOT NULL,
    age INT(11) NOT NULL
);

-- => create Table with default value 
 CREATE TABLE cats3 (
    name varchar(50) NOT NULL DEFAULT 'unnamed',
    age INT(11) NOT NULL DEFAULT 99
);

-- => PRIMARY kEY CONCEPET 
CREATE TABLE unique_cats2 (
    cat_id INT NOT NULL AUTO_INCREMENT,
    name varchar(100) , 
    age INT,
    PRIMARY KEY (cat_id)
);


-- => WHERE CONDITION
SELECT * FROM cats WHERE age = 4;
SELECT * FROM cats WHERE age > 4;
SELECT * FROM cats WHERE name = 'Egg';
SELECT cate_id, age FROM cats WHERE cate_id = age ;
SELECT cate_id AS id FROM cats;


-- => UPDATE DATA
UPDATE cats SET breed = "Shorthair" WHERE breed = 'Tabby';
UPDATE cats  SET age = 14  WHERE name = 'Mistry';

-- => DELETE Table DATA  
DELETE FROM cats WHERE name = 'Egg'; -- delete data from the table
DELETE FROM cats; -- delete all the data from the table;

-- =>  DROP the TABLE
DROP TABLE shirts;

-- => LOAD sql file into the database
source cats.sql -- cats.sql is the file name;

-- => DROP column from the table
ALTER TABLE cats DROP breed;

-- => CHANGE TABLE name
ALTER TABLE employees  
RENAME TO book; 

-- => change the column data type
ALTER TABLE book
MODIFY author_lname varchar(100);


-- //////////// String Methods ///////////////

-- => CONCATENATE two table Columns
SELECT CONCAT(column1,' ',column2) FROM table_name;
SELECT CONCAT(author_fname,' ', author_lname) FROM book;
SELECT CONCAT(author_fname,' ', author_lname) AS full_name FROM book;
SELECT author_fname AS first_name, author_lname AS last_name, CONCAT(author_fname,' ', author_lname) as full_name FROM book;
SELECT CONCAT_WS (' - ',title , author_fname, author_lname) AS full_name FROM book;

SELECT CONCAT (title, "...") AS short_title FROM book;
SELECT CONCAT (SUBSTRING(title, 1, 10), "...") AS short_title FROM book ;
SELECT CONCAT (SUBSTRING(title, 1, 10), "...") AS short_title FROM book LIMIT 1;


-- => SUBSTRING methods 
SELECT SUBSTRING('Hello World',1,4); -- result => 'Hell'
SELECT SUBSTRING('Hello World',7); -- result => 'World'
SELECT SUBSTRING('Hello World',-3); -- result => 'rld'

SELECT SUBSTRING('Hello World',1,LENGTH('Hello World')); -- result => 'Hello World'
SELECT SUBSTRING(title,1,10) from book; 


-- => REPLACE methods
SELECT REPLACE('Hello World', 'Hello', 'Hi'); -- result => 'Hi World'
SELECT REPLACE('Hello World', 'l', '7'); -- result => 'He77o Wor7d'
SELECT REPLACE(title,'e',3) from book; 

SELECT 
    SUBSTRING(
        REPLACE (title, 'e', 3),
        1, 
        10
    ) AS short_title
FROM book;

-- => REVERSE string methods
SELECT REVERSE('Hello World'); -- result => 'dlroW olleH'
SELECT REVERSE(author_fname) from book; 
SELECT CONCAT(title,' ',  REVERSE(title)) from book;

-- => CHARACTER METHODS to calculate the length of the string
SELECT CHAR_LENGTH('Hello World'); -- result => 11
SELECT author_fname, CHAR_LENGTH(author_fname) AS total_length from book;

-- => Convert to UPPER and LOWER case
SELECT UPPER('Hello World'); -- result => 'HELLO WORLD'
SELECT UPPER(title) from book;
SELECT LOWER('Hello World'); -- result => 'hello world'
SELECT CONCAT("myFavouraite book is ", LOWER(title)) from book;

-- => DISCINCT KEYWORD
SELECT DISTINCT author_lname FROM book;
SELECT DISTINCT released_year FROM book;
SELECT DISTINCT CONCAT(author_fname , " ", author_lname) AS full_name FROM book;
SELECT DISTINCT author_fname , author_lname FROM book;


-- => ORDER BY
SELECT author_fname, author_lname FROM book ORDER BY author_lname; -- => ascending order BY default
SELECT author_fname, author_lname FROM book ORDER BY author_lname DESC;
SELECT author_fname, author_lname FROM book ORDER BY  2; -- => 2(author_lname) means second order

SELECT author_fname, author_lname FROM book ORDER BY author_fname, author_lname ;

-- => LIMIT
SELECT author_fname, author_lname FROM book ORDER BY author_fname, author_lname LIMIT 1 ;
SELECT title FROM book ORDER BY author_fname, author_lname LIMIT 10 ;
SELECT title FROM book ORDER BY author_fname LIMIT 1  ;
SELECT title FROM book ORDER BY author_fname LIMIT 10, 1 ;
SELECT author_fname FROM book  LIMIT 2 OFFSET 1;

-- => LIKES
SELECT author_fname FROM book WHERE author_fname LIKE '%h%';
SELECT author_fname FROM book WHERE author_fname LIKE 'd%';
SELECT author_fname FROM book WHERE author_fname LIKE '%a';
SELECT title FROM book WHERE title  LIKE 'The Namesake';
SELECT title FROM book WHERE title  LIKE 'the%'; -- => this operator is not case sensitive
SELECT title FROM book WHERE released_quantity  LIKE '____'; -- => 4 underscores means 4 digits
SELECT title FROM book WHERE title  LIKE '%\%%';
SELECT title FROM book WHERE title  LIKE '%\_%';

-- => COUNT 
SELECT COUNT(*) FROM book;
SELECT COUNT(DISTINCT author_fname) FROM book;
SELECT COUNT(title) FROM book WHERE title LIKE '%the%';

-- => GROUP BY
SELECT  author_lname, COUNT(*) FROM book GROUP BY author_lname;
SELECT title, author_lname, author_fname FROM book GROUP BY author_lname ;
SELECT  author_lname, author_fname, COUNT(*) FROM book GROUP BY author_lname ;
SELECT released_year, COUNT(*) FROM book GROUP BY released_year;

-- => Min, Max, Avg, Sum
SELECT MIN(released_year) FROM book;
SELECT MIN(pages) FROM book;

SELECT MAX(released_year) FROM book;
SELECT MAX(pages) FROM book;

SELECT MAX(pages), title FROM book; -- => this will return the max pages and the first title of the book
                                    -- => this is not a proper way to do it

SELECT * FROM book WHERE pages = (SELECT MIN(pages) FROM book); -- => this will return the min page row
SELECT * FROM book WHERE pages = (SELECT MAX(pages) FROM book); -- => this will return the max page row
SELECT title, pages FROM book WHERE pages = (SELECT MAX(pages) FROM book);

SELECT * FROM book ORDER BY pages ASC LIMIT 1 ;
SELECT * FROM book ORDER BY pages ASC LIMIT 1 OFFSET 1;

