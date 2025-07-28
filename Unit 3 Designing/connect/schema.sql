create table Users (
    "id" integer primary key,
    "first_name" text,
    "last_name" text,
    "username" text,
    "password" text
);


create table Schools (
    "id" integer primary key,
    "name" text,
    "type" text,
    "location" text,
    "year_founded" integer
);


create table Company (
    "id" integer primary key,
    "name" text,
    "industry" text,
    "location" text
);


create table UserConnections (
    user1_id integer,
    user2_id integer,
    primary key (user1_id, user2_id),
    foreign key (user1_id) references Users(id),
    foreign key (user2_id) references Users(id)
);


create table UserSchoolAffliation (
    "user_id" integer,
    "school_id" integer,
    "start_date" text,
    "end_date" text,
    "degree" text,
    primary key ("user_id", "school_id", "start_date", "degree"),
    foreign key (user_id) references Users(id),
    foreign key (school_id) references Schools(id)
);


CREATE TABLE UserCompanyAffiliations (
    "user_id" integer,
    "company_id" integer,
    "start_date" text,
    "end_date" text,
    "title" text,
    primary key ("user_id", "company_id", "start_date", "title"),
    foreign key (user_id) references Users(id),
    foreign key (company_id) references Company(id)
);
