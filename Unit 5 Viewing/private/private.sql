create table triplets(
    sentence_id int,
    start_pos int,
    "length" int
);

insert into triplets values (14,98,4);
insert into triplets values (114,3,5);
insert into triplets values (618,72,9);
insert into triplets values (630,7,3);
insert into triplets values (932,12,5);
insert into triplets values (2230,50,7);
insert into triplets values (2346,44,10);
insert into triplets values (3041,14,5);


create view message as
select substr(s.sentence, t.start_pos, t.length)
as phrase
from triplets as t
join sentences as s on s.id = t.sentence_id;
