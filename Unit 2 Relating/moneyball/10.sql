select p.first_name, p.last_name, s.salary, pe.HR, s.year, pe.year
from players as p
join salaries as s on p.id = s.player_id
join performances as pe on p.id = pe.player_id
where pe.year = s.year
order by p.id, s.year desc, pe.HR desc, s.salary desc
