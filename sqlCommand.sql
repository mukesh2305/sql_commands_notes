=> SHOW DATABASES; -- to see all the database; 

=> USE hello_world;  -- to use particular database;

=> CREATE DATABASE cate_app;  -- to crate database;

=> SELECT database(); -- which database we are using


-- //////////// TABLE ///////////////

-- => Create Tabele 
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

--    -> Insert multiple data into table
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
SELECT title, pages FROM book ORDER BY pages DESC LIMIT 1;

SELECT * FROM book ORDER BY pages ASC LIMIT 1 ;
SELECT * FROM book ORDER BY pages ASC LIMIT 1 OFFSET 1;
  
    --------- MIN/MAX with GROUP BY ------------
SELECT author_fname, author_lname, MIN(released_year) FROM book GROUP BY author_fname, author_lname;
select MAX(pages) FROM book GROUP BY author_fname, author_lname;

SELECT CONCAT(author_fname, " ", author_lname) AS author, MAX(pages) AS longest_book FROM book GROUP BY author_fname, author_lname;

    --------- SUM with GROUP BY ------------
SELECT SUM(pages) FROM book;
SELECT SUM(released_year) FROM book;

SELECT author_fname,author_lname, SUM(pages) FROM book GROUP BY  author_lname,author_fname;

    --------- AVG with GROUP BY ------------
SELECT AVG(released_year) FROM book;
SELECT AVG(pages) FROM book;

SELECT released_year,AVG(released_quantity) FROM book GROUP BY released_year;

-- CHAR => has fixed length 
-- VARCHAR => has variable length
-- if CHAR(5) is used then the length of the string will be 5

 

-- DECIMAL =>

-- DECIMAL(10,2) => 10 digits, 2 decimal places
-- DECIMAL(10,0) => 10 digits, 0 decimal places
-- DECIMAL(10,5) => 10 digits, 5 decimal places

-- FLOAT =>
-- pricision problem in float 

-- ///////// DATES & TIMES & DATETIME  //////////////



--   => DATE
-- value with dates but no times
-- DATE => YYYY-MM-DD Format

-- => TIME
-- value with times but no dates
-- TIME => HH:MM:SS Format

-- => DATETIME
-- value with dates and times
-- DATETIME => YYYY-MM-DD HH:MM:SS Format

CREATE TABLE people (
    name VARCHAR(30),
    birth_date DATE,
    birth_time TIME,
    birthdt DATETIME
);

INSERT INTO people (name, birth_date, birth_time, birthdt) 
VALUES ('mukesh', '1999-05-23', '12:00:00', '1999-05-23 12:00:00');

-- => DATE_FORMAT
CURDATE() => current date
CURTIME() => current time
NOW() => current date and time

date =1999-05-23
DAY(date) => 23
MONTH(date) => 5
YEAR(date) => 1999
DAYNAME(date) => sunday
DAYOFWEEK(date) => 1
DAYOFYEAR(date) => 

INSERT INTO people (name, birth_date, birth_time, birthdt) 
VALUES ('mahesh', CURDATE(),CURTIME() , NOW());

SELECT name, DAY(birth_date) AS day, MONTH(birth_date) AS month, YEAR(birth_date) AS year, DAYNAME(birth_date), DAYOFWEEK(birth_date), DAYOFYEAR(birth_date)  FROM people;
SELECT name, birthdt, DAYOFYEAR(birthdt), MONTH(birthdt), MONTHNAME(birthdt) FROM people;
SELECT name, birth_time, HOUR(birth_time), MINUTE(birth_time), SECOND(birth_time) FROM people;
SELECT DATE_FORMAT("2017-06-15", "%M %d %Y");
SELECT DATE_FORMAT("2017-06-15", "%M-%d-%Y");
SELECT DATE_FORMAT(birthdt, "%W") FROM people;

-- if we want date in number formate then use small letters 
SELECT DATE_FORMAT(birthdt, "%m/%d/%y at %h : %m") FROM people;


-- => DATE MATH
-- CURDATE()
SELECT DATEDIFF(NOW(), birth_date) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt,  DATE_ADD(birthdt, INTERVAL 1 SECOND) FROM people;
SELECT birthdt, DATE_SUB(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, birthdt + INTERVAL 1 MONTH FROM people;
SELECT birthdt, birthdt + INTERVAL 1 DAY + INTERVAL 10 HOUR FROM people;
SELECT birthdt, birthdt - INTERVAL 1 MONTH FROM people;


-- /////////////////////////////////////////////

CREATE TABLE comments (
    content VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE comments2 (
    content VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
CREATE TABLE comments2 (
    content VARCHAR(255),
    created_at TIMESTAMP DEFAULT NOW() ON UPDATE NOW()
);


INSERT INTO comments (content) 
VALUES   ('world'),
         ('this is a comment'),
         ('this is another comment');

-- //////////////////////////////////////////////


-- ////////////////////// LOGICAL OPERATORS ///////////////////////////////

-- => != (not equal)
SELECT title, author_lname, author_fname FROM book WHERE released_year != 2017;

-- => NOT LIKE
SELECT title FROM book WHERE title  NOT LIKE "A%";

-- => > (greater than), < (less than), >= (greater than or equal to), <= (less than or equal to)
SELECT title, author_lname, author_fname, released_year FROM book WHERE released_year < 2017;
SELECT title, author_lname, author_fname, released_year FROM book WHERE released_year > 2003;
SELECT title, author_lname, author_fname, released_year FROM book WHERE released_year <= 2017;
SELECT title, author_lname, author_fname, released_year FROM book WHERE released_year >= 2003;

-- just fun
SELECT 99 > 1;  -- output = 1,  1 = true, 0 = false
SELECT 99 < 1;  -- output = 0,  1 = true, 0 = false

-- => LOGICAL AND(&&)
SELECT title, author_lname, author_fname, released_year FROM book WHERE author_lname = 'Eggers' AND released_year > 2010;

-- => LOGICAL OR(||)
SELECT title, author_lname, released_year FROM book WHERE author_lname = 'Eggers' OR released_year > 2010;

-- => BETWEEN (between) (logical and is pair with between)
SELECT title, author_lname, released_year FROM book WHERE released_year BETWEEN 2000 AND 2010;

-- => NOT BETWEEN (not between) (logical and is pair with not between)
SELECT title, author_lname, released_year FROM book WHERE released_year NOT BETWEEN 2000 AND 2010;


--> CAST() => change data type
SELECT CAST('2017-05-02' AS DATETIME) ;
SELECT name, birthdt from people WHERE birthdt BETWEEN CAST('1980-01-01' AS DATETIME) AND CAST('2000-01-01' AS DATETIME);


-- => IN (in)  (in is same as OR)
SELECT title, author_lname, released_year FROM book WHERE author_lname IN ('Eggers', 'Lahiri');


-- => NOT IN (not in) 
SELECT title, author_lname, released_year FROM book WHERE author_lname NOT IN ('Eggers', 'Lahiri');

-- => % (modulus)
SELECT title, author_lname, released_year FROM book WHERE released_year % 2 = 0;

-- => CASE (case)
SELECT title,  released_year,
    CASE 
        WHEN released_year >= 2000  THEN 'Modern Lit'
        ELSE '20th Century Lit'
    END AS GNERE;
FROM book;

SELECT title, released_quantity,
    CASE 
        WHEN released_quantity BETWEEN 0 AND 50  THEN '*'
        WHEN released_quantity BETWEEN 51 AND 100 THEN '**'
        ELSE '***'
    END AS stock
FROM book;


-- => implicit inner join
select * from customers, orders where customers.id = orders.customer_id;

-- => Explicit inner join
    select * from customers join orders on customers.id = orders.customer_id;
    -- both are same
    select * from customers inner join orders on customers.id = orders.customer_id;


    select first_name, last_name, SUM(amount) as total_amount 
    from customers join orders on customers.id = orders.customer_id group by orders.customer_id order by total_amount desc;

-- => LEFT JOIN
    select * from customers left join orders on customers.id = orders.customer_id ;

    select 
        first_name, 
        last_name, 
        IFNULL(SUM(amount), 0) as total_amount
    FROM customers
    LEFT JOIN orders
    GROUP BY customers.id
    ORDER BY total_amount;

-- => RIGHT JOIN
    select * from customers right join orders on customers.id = orders.customer_id ;