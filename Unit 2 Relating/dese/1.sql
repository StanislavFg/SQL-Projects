select s.name, s.city
from schools as s
where s.type like "Public School" and s.state = "MA"
