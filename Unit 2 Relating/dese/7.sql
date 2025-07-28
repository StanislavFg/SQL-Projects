select s.name
from schools as s
join districts as d on s.district_id = d.id
where d.name = "Cambridge"
