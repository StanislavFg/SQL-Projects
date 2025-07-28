CREATE TABLE meteorites_temp (
    "name" text,
    "id" integer PRIMARY KEY,
    "nametype" text,
    "class" text,
    "mass" real,
    "discovery" text,
    "year" text,
    "lat" real,
    "long" real
);


.mode csv
.import meteorites.csv meteorites_temp
.mode table

delete from meteorites_temp
where nametype = "Relict";

update meteorites_temp
set "mass" = round("mass", 2)
where "mass" is not NULL;

update meteorites_temp
set "mass" = NULL
where trim(year) = '';

update meteorites_temp
set "lat" = round("lat", 2)
where "lat" is not NULL;

update meteorites_temp
set "lat" = NULL
where trim(year) = '';

update meteorites_temp
set "long" = round("long", 2)
where "long" is not NULL;

update meteorites_temp
set "long" = NULL
where trim(year) = '';

update meteorites_temp
set "year" = NULL
where trim(year) = '';

CREATE TABLE meteorites (
    "id" integer PRIMARY KEY,
    "name" text,
    "class" text,
    "mass" real,
    "discovery" text,
    "year" text,
    "lat" real,
    "long" real
);

insert into meteorites ("name", "class", "mass", "discovery", "year", "lat", "long" )
select "name", "class", "mass", "discovery", "year", "lat", "long"  from meteorites_temp
order by "year", "name";

DROP TABLE "meteorites_temp";
