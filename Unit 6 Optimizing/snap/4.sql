select u.username
from users as u
join messages as m on m.to_user_id = u.id
group by u.username
order by count(m.id) desc
limit 1
