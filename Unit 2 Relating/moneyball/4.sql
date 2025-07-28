select first_name, last_name, salary
from players as p
join salaries as s on p.id = s.player_id
where s.year = '2001'
order by s.salary, p.first_name, p.last_name, p.id limit 50;
