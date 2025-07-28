select p.first_name, p.last_name
from players as p
join salaries as s on p.id = s.player_id
order by s.salary desc limit 1
