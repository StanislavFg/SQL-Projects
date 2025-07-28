select d.name, e.pupils
from districts as d
join expenditures as e on d.id = e.district_id
