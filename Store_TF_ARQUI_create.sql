-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-06-17 05:02:55.253

-- tables
-- Table: Calification
CREATE TABLE Calification (
    id int  NOT NULL,
    stars int  NOT NULL,
    description varchar(30)  NOT NULL,
    CONSTRAINT Calification_pk PRIMARY KEY  (id)
);

-- Table: Categories
CREATE TABLE Categories (
    id int  NOT NULL,
    name varchar(30)  NOT NULL,
    description varchar(30)  NOT NULL,
    CONSTRAINT Categories_pk PRIMARY KEY  (id)
);

-- Table: Customers
CREATE TABLE Customers (
    id int  NOT NULL,
    name varchar(30)  NOT NULL,
    surname varchar(30)  NOT NULL,
    address varchar(30)  NOT NULL,
    phone int  NOT NULL,
    birthDate date  NOT NULL,
    email int  NOT NULL,
    CONSTRAINT Customers_pk PRIMARY KEY  (id)
);

-- Table: CustomersReview
CREATE TABLE CustomersReview (
    Customers_id int  NOT NULL,
    Products_id int  NOT NULL,
    Review_id int  NOT NULL,
    publicationDate date  NOT NULL,
    CONSTRAINT CustomersReview_pk PRIMARY KEY  (Customers_id,Review_id)
);

-- Table: Order
CREATE TABLE "Order" (
    id int  NOT NULL,
    Customers_id int  NOT NULL,
    Products_id int  NOT NULL,
    price money  NOT NULL,
    CONSTRAINT Order_pk PRIMARY KEY  (Products_id,Customers_id,id)
);

-- Table: Products
CREATE TABLE Products (
    id int  NOT NULL,
    name varchar(30)  NOT NULL,
    description varchar(30)  NOT NULL,
    price money  NOT NULL,
    Categories_id int  NOT NULL,
    CONSTRAINT Products_pk PRIMARY KEY  (id)
);

-- Table: Promotions
CREATE TABLE Promotions (
    id int  NOT NULL,
    name int  NOT NULL,
    startDate date  NOT NULL,
    finishDate date  NOT NULL,
    Products_id int  NOT NULL,
    CONSTRAINT Promotions_pk PRIMARY KEY  (id)
);

-- Table: Review
CREATE TABLE Review (
    id int  NOT NULL,
    Calification_id int  NOT NULL,
    message varchar(30)  NOT NULL,
    CONSTRAINT Review_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: CustomersReview_Products (table: CustomersReview)
ALTER TABLE CustomersReview ADD CONSTRAINT CustomersReview_Products
    FOREIGN KEY (Products_id)
    REFERENCES Products (id);

-- Reference: Order_Customers (table: Order)
ALTER TABLE "Order" ADD CONSTRAINT Order_Customers
    FOREIGN KEY (Customers_id)
    REFERENCES Customers (id);

-- Reference: Order_Products (table: Order)
ALTER TABLE "Order" ADD CONSTRAINT Order_Products
    FOREIGN KEY (Products_id)
    REFERENCES Products (id);

-- Reference: Products_Categories (table: Products)
ALTER TABLE Products ADD CONSTRAINT Products_Categories
    FOREIGN KEY (Categories_id)
    REFERENCES Categories (id);

-- Reference: Promotions_Products (table: Promotions)
ALTER TABLE Promotions ADD CONSTRAINT Promotions_Products
    FOREIGN KEY (Products_id)
    REFERENCES Products (id);

-- Reference: Review_Calification (table: Review)
ALTER TABLE Review ADD CONSTRAINT Review_Calification
    FOREIGN KEY (Calification_id)
    REFERENCES Calification (id);

-- Reference: Table_11_Customers (table: CustomersReview)
ALTER TABLE CustomersReview ADD CONSTRAINT Table_11_Customers
    FOREIGN KEY (Customers_id)
    REFERENCES Customers (id);

-- Reference: Table_11_Review (table: CustomersReview)
ALTER TABLE CustomersReview ADD CONSTRAINT Table_11_Review
    FOREIGN KEY (Review_id)
    REFERENCES Review (id);

-- End of file.

