select distinct(t.name)
from teams as t
join performances as p on t.id = p.team_id
join players as pl on p.player_id = pl.id
where pl.first_name = "Satchel" and pl.last_name = "Paige"
