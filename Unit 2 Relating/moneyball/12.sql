select * from (select p.first_name, p.last_name
from players as p
join salaries as s on p.id = s.player_id
join performances as pe on p.id = pe.player_id
where s.year = '2001' and pe.year = '2001' and pe.RBI > 0
order by s.salary / pe.RBI
limit 10)

    intersect

select * from (select p.first_name, p.last_name
from players as p
join salaries as s on p.id = s.player_id
join performances as pe on p.id = pe.player_id
where s.year = '2001' and pe.year = '2001' and pe.H > 0
order by s.salary / pe.H
limit 10)

order by last_name
