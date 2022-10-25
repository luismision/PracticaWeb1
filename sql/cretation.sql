DROP TABLE USERS CASCADE ; 
DROP TABLE EVENTS CASCADE ; 
DROP TABLE TICKETS CASCADE ; 

CREATE TABLE USERS(
    username varchar(20),
    password varchar(20) NOT NULL,
    full_name varchar(50) NOT NULL,
    address varchar(100) NOT NULL,
    telefono int NOT NULL,
    CONSTRAINT PK_USERS PRIMARY KEY (username)
);

CREATE TABLE EVENTS(
    name varchar(50),
    city varchar(50), 
    room varchar(50),
    category varchar(50),
    date date NOT NULL,
    CONSTRAINT PK_EVENTS PRIMARY KEY (name, city, date)
);

CREATE TABLE TICKETS(
    code int,
    event_date date,
    event_name varchar(50),
    event_city varchar(50),
    owner varchar(20) NOT NULL,
    prize decimal(10,2) NOT NULL,
    CONSTRAINT PK_TICKETS PRIMARY KEY (code, event_name, event_city, event_date),
    CONSTRAINT FK_TICKETS_USERS FOREIGN KEY (owner) REFERENCES USERS(username) ON DELETE CASCADE,
    CONSTRAINT FK_TICKETS_EVENTS FOREIGN KEY (event_name, event_city, event_date) REFERENCES EVENTS(name, city, date) ON DELETE CASCADE,
    CONSTRAINT CHECK_PRIZE CHECK (prize BETWEEN 0 AND 9999999999) /*No se si esto es correcto*/
);
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO USERS VALUES ( 'user1', 'pass1', 'name1', 'address1', 123456789 );
( 'user2', 'pass2', 'name2', 'address2', 123456789 ),
( 'user3', 'pass3', 'name3', 'address3', 123456789 ),
( 'user4', 'pass4', 'name4', 'address4', 123456789 ),
( 'user5', 'pass5', 'name5', 'address5', 123456789 ),
( 'user6', 'pass6', 'name6', 'address6', 123456789 ),
( 'user7', 'pass7', 'name7', 'address7', 123456789 ),
( 'user8', 'pass8', 'name8', 'address8', 123456789 ),
( 'user9', 'pass9', 'name9', 'address9', 123456789 ),
( 'user10', 'pass10', 'name10', 'address10', 123456789 ),
( 'user11', 'pass11', 'name11', 'address11', 123456789 ),
( 'event1', 'city1', 'room1', 'category1', '2019-01-01' ),
( 'event2', 'city2', 'room2', 'category2', '2019-01-02' ),
( 'event3', 'city3', 'room3', 'category3', '2019-01-03' ),
( 'event4', 'city4', 'room4', 'category4', '2019-01-04' ),
( 'event5', 'city5', 'room5', 'category5', '2019-01-05' ),
( 'event6', 'city6', 'room6', 'category6', '2019-01-06' ),
( 'event7', 'city7', 'room7', 'category7', '2019-01-07' ),
( 'event8', 'city8', 'room8', 'category8', '2019-01-08' ),
( 'event9', 'city9', 'room9', 'category9', '2019-01-09' ),
( 1, '2019-01-01', 'event1', 'city1', 'user1', 1 ),
( 2, '2019-01-02', 'event2', 'city2', 'user2', 2 ),
( 3, '2019-01-03', 'event3', 'city3', 'user3', 3 ),
( 4, '2019-01-04', 'event4', 'city4', 'user4', 4 ),
( 5, '2019-01-05', 'event5', 'city5', 'user5', 5.1 ),
( 6, '2019-01-06', 'event6', 'city6', 'user6', 6.2),
( 7, '2019-01-07', 'event7', 'city7', 'user7', 7.3 ),
( 8, '2019-01-08', 'event8', 'city8', 'user8', 8.3 ),
( 10, '2019-01-09', 'event9', 'city9', 'user10', 9999999999.5);
