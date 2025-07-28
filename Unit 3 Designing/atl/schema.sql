create table Passengers (
    "id" integer primary key,
    "first_name" text,
    "last_name" text,
    "age" integer
);

create table Airlines (
    "id" integer primary key,
    "name" text,
    "concourse" text
);

create table Flights(
    "id" integer primary key,
    "flight_number" integer,
    "airline_id" integer,
    "from" text,
    "to" text,
    "departure_time" text,
    "arrival_time" text,
    foreign key (airline_id) references Airlines(id)
);

create table CheckIns (
    "id" integer primary key,
    "checkIn_time" text,
    "passenger_id" integer,
    "flight_id" integer,
    foreign key (passenger_id) references Passengers(id),
    foreign key (flight_id) references Flights(id)
);
