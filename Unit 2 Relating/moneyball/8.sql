select salary
from salaries as s
join performances as pe on s.player_id = pe.player_id
where s.year = '2001'
order by pe.HR desc limit 1;
