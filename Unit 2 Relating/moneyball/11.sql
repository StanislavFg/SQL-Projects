select p.first_name, p.last_name, s.salary / pe.H as "dollars per hit"
from players as p
join salaries as s on p.id = s.player_id
join performances as pe on p.id = pe.player_id
where s.year = '2001' and pe.year = '2001' and pe.H > 0
order by "dollars per hit" limit 10

