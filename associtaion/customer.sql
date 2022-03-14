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

