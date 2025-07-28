create table Ingredients (
    "id" integer primary key,
    "type" text,
    "unit" text,
    "price per unit" text
);

CREATE TABLE Donut_Ingredients (
    "donut_id" integer,
    "ingredient_id" integer,
    "quantity" text,
    "unit" text,
    PRIMARY KEY (donut_id, ingredient_id),
    FOREIGN KEY (donut_id) REFERENCES Donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(id),
    FOREIGN KEY (unit) REFERENCES Ingredients(unit)
);

create table Donuts (
    "id" integer primary key,
    "name" text,
    "gluten_free" boolean,
    "price per unit" text
);

create table Customers (
    "id" integer primary key,
    "first_name" text,
    "last_name" text,
    "order_history_id" integer,
    foreign key (order_history_id) references Orders(order_number)
);

create table Orders (
    "order_number" integer primary key,
    "donut_id" integer,
    "donut_name" text,
    "customer_id" integer,
    "customer_name" text,
    foreign key (donut_id) references Donuts(id)
    foreign key (customer_id) references Customers(id)
);
