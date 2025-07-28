select s.year, s.salary
from salaries as s
join players as p on s.player_id = p.id
where p.first_name = 'Cal' and p.last_name = 'Ripken'


order by "year" desc
