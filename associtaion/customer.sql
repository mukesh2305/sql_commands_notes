    CREATE TABLE customers (
        id INT AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100),
        email VARCHAR(100)
    );

    CREATE TABLE orders (
        id int AUTO_INCREMENT PRIMARY KEY,
        oder_date DATE,
        amount DECIMAL(8,2),
        customer_id INT ,
        FOREIGN KEY (customer_id) REFERENCES customers(id)
    );

    -- => when customer us deleted then related orders also deleted
    -- => ON DELETE CASCADE
        CREATE TABLE orders (
        id int AUTO_INCREMENT PRIMARY KEY,
        oder_date DATE,
        amount DECIMAL(8,2),
        customer_id INT ,
        FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE
    );

    INSERT INTO customers(first_name, last_name, email)
    VALUES('Boy', 'mukesh', 'mukesh123@gmail.com'), 
           ('Boy1', 'mukesh1', 'mukesh1@gmail.com'),
           ('Boy2', 'mukesh2', 'mukesh12@gmail.com'),
           ('Boy3', 'mukesh3', 'mukesh1234@gmail.com');


    INSERT INTO orders(oder_date,amount,customer_id)
    VALUES('2016/02/10',99.99 , 1), 
           ('2017/11/11',35.50, 1),
           ('2014/12/12',800.67,2),
           ('1999/04/11',12.50, 4);

        --    assoiciation
    select * from customers where last_name = "mukesh";
    select * from orders where customer_id = 1;


    -- select * from orders where customer_id = (
    --         select * from customers where last_name = "mukesh"
    -- );


-- implicit inner join
select * from customers, orders where customers.id = customer_id;


-- ////////////////////////////// Student and Paper //////////////////////////////

    CREATE TABLE students (
        id int AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100) 
    );

    INSERT INTO students(first_name)
        VALUES('mukesh'), 
              ('priti'),
              ('ketan'),
              ('kavita');

    CREATE TABLE papers (
        id int AUTO_INCREMENT PRIMARY KEY,
        grade VARCHAR(10),
        student_id INT,
        FOREIGN KEY (student_id) REFERENCES students(id)
    );

    INSERT INTO papers(grade,student_id )
        VALUES('A', 1), 
              ('B', 1),
              ('C', 2),
              ('D', 3);

-- =>        

    select first_name, grade  from students inner join papers on students.id = papers.student_id ;
    select first_name, grade from students left join papers on students.id = papers.student_id ;
    select first_name, grade from  papers right join students on students.id = papers.student_id ;
    select first_name, IFNULL(grade, 0) as grade from students left join papers on students.id = papers.student_id ;

    
     -- -> calculate avarage grade of all students
    select 
        first_name,
        IFNULL(AVG(grade), 0) as avarage,
    from students
    left join papers
         on students.id = papers.student_id
    group by students.id
    order by avarage desc;

    -- -> problem - 4
    select 
        first_name,
        IFNULL(AVG(amount), 0) as avarage
        CASE
            WHEN AVG(grade) IS NULL THEN 'FAIL'
            WHEN AVG(grade) >= 75 THEN 'Pass'
            ELSE 'Fail'
        END as passing_status
    from students
    left join papers
         on students.id = papers.student_id
    group by students.id
    order by avarage desc;
          

--  => MANY TO MANY realationship

CREATE TABLE reviewers (
        id int AUTO_INCREMENT PRIMARY KEY,
        first_name VARCHAR(100),
        last_name VARCHAR(100)
    );

INSERT INTO reviewers(first_name, last_name)
    VALUES('Blue', 'Steele'), 
          ('Wyatt', 'Earp'),
          ('Kimbra', 'Mastera'), 
          ('Domingo', 'Cortes'),
          ('Colt', 'Steele'),
          ('Pinkie', 'Petit'),
          ('Marlon', 'Crafford');


CREATE TABLE series (
    id int AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    released_year INT,
    genre VARCHAR(100)
);

INSERT INTO series(title,released_year, genre)
    VALUES('Archer', 2009, 'Animation'), 
          ('Fargo', 2014, 'Drama'),
          ('Arrested Development', 2003, 'Comedy'),
          ("Bob's Burgers", 2011, 'Animation'),
          ('Bojack Horseman', 2014, 'Animation'),
          ('Breaking Bad', 2008, 'Drama'),
          ('Curb Your Enthusiasm', 2014, 'Comedy'),
          ('Daredevil', 2015, 'Action'),
          ('Doctor Who', 2005, 'Science Fiction'),
          ('Game of Thrones', 2011, 'Fantasy'),
          ('House of Cards', 2013, 'Drama'),
          ('How I Met Your Mother', 2005, 'Comedy');

CREATE TABLE reviews (
    id int AUTO_INCREMENT PRIMARY KEY,
    rating DECIMAL(2,1),
    reviewer_id INT, 
    series_id INT ,
    FOREIGN KEY (reviewer_id) REFERENCES reviewers(id) ON DELETE CASCADE,
    FOREIGN KEY (series_id) REFERENCES series(id) ON DELETE CASCADE
);

INSERT INTO reviews(series_id, reviewer_id, rating)
    VALUES(1, 1, 8.0),(1, 2, 7.5), (1, 3, 8.5), (1, 4, 7.7), (1, 5, 8.9),
          (2, 1, 8.1),(2, 2, 6.0), (2, 3, 8.0), (2, 4,8.4), (2, 5, 9.9),
          (3, 1, 7.0),(3, 2, 7.5), (3, 3, 8.0), (3, 4,7.1), (3, 5, 8.0),
          (4, 1, 9.5),(4, 2, 7.8), (4, 3, 8.3), (4, 4,7.6), (4, 5, 8.5),
          (5, 1, 6.5),(5, 2, 9.0), (5, 3, 8.1), (5, 4,9.3), (5, 5, 8.9);

--  challenge 1 
select * from series inner JOIN reviews ON series.id = reviews.series_id;
select title, rating from series join reviews on series.id = reviews.series_id;

-- challenge 2 Averag rating of all series
select  
    title, IFNULL(AVG(rating), 0) as avarage_rating 
from series 
    left join reviews on series.id = reviews.series_id 
GROUP BY series.id
 ORDER BY avarage_rating desc;

-- changele 3
select 
    first_name, 
    last_name,
    rating 
from reviewers
     join reviews on reviewers.id = reviews.reviewer_id;
     
-- challenge 4 unreviewed series we have to identify 
SELECT * from series 
    left join reviews on series.id = reviews.series_id 
WHERE reviews.series_id IS NULL; -- we can select any filed that is null like rating, reviewer_id, series_id;


-- challenge 5 Genre Avg rating
  -- => 1 first way
select 
    genre, 
    IFNULL(AVG(rating), 0) as avarage_rating
from series
    left join reviews on series.id = reviews.series_id
group by genre;

  -- => 2 second way
select 
    genre, 
    AVG(rating) as avarage_rating
from series
    inner join reviews on series.id = reviews.series_id
group by genre;
   

-- challenge 6 
 -- => 1 approach
select 
    first_name, 
    last_name,
    COUNT(rating) as count_of_reviews,
    IFNULL(min(rating), 0) as min_rating,
    IFNULL(max(rating), 0) as max_rating,
    IFNULL(AVG(rating), 0) as avarage_rating,
    CASE 
        WHEN COUNT(rating)>=1 THEN 'active'
        ELSE 'inactive'
    END as reviewer_status
from reviewers
LEFT join reviews
      on reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;


 -- => 2 approach

select 
    first_name, 
    last_name,
    COUNT(rating) as count_of_reviews,
    IFNULL(min(rating), 0) as min_rating,
    IFNULL(max(rating), 0) as max_rating,
    IFNULL(AVG(rating), 0) as avarage_rating,
    IF(COUNT(rating)>=1, 'active', 'inactive') as reviewer_status
from reviewers
LEFT join reviews
      on reviewers.id = reviews.reviewer_id
GROUP BY reviewers.id;


-- challenge 7 title, rating, reviewer - 3 Tables

select 
    title,
    rating,
    CONCAT(first_name, ' ', last_name) as reviewer
from series
    inner join reviews on series.id = reviews.series_id
    inner join reviewers on reviewers.id = reviews.reviewer_id
ORDER BY rating desc;

