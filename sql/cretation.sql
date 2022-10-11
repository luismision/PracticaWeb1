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