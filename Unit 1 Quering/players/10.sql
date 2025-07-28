select "first_name", "last_name", "height" as "Average Height", "weight" as "Average Weight" from "players"
where "birth_country" = 'USA'
order by "height";

