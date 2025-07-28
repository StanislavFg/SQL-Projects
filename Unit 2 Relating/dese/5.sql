select s.city, count(s.name) as cn
from schools as s
where s.type = "Public School"
group by s.city
having cn < 4
order by cn desc, s.city
