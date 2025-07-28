select to_user_id
from messages
where from_user_id = (
    select id
    from users
    where username like 'creativewisdom377'
)
group by to_user_id
order by count(id) desc
limit 3
