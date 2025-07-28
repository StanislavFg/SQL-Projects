select s.name, e.per_pupil_expenditure, g.graduated
from schools as s
join graduation_rates as g on s.id = g.school_id
join expenditures as e on s.district_id = e.district_id
order by e.per_pupil_expenditure desc, s.name;
