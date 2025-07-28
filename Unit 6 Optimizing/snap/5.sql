select f.friend_id
from friends as f
join users as u on f.user_id = u.id
where u.username = 'lovelytrust487'
intersect
select f.friend_id
from friends as f
join users as u on f.user_id = u.id
where u.username = 'exceptionalinspiration482'
