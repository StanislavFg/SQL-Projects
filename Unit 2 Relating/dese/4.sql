select s.city, count(s.name) as cn
from schools as s
where s.type = "Public School"
group by s.city
order by cn desc, s.city
limit 10;
