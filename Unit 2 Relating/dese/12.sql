select d.name, e.per_pupil_expenditure, s.exemplary
from districts as d
join expenditures as e on d.id = e.district_id
join staff_evaluations as s on d.id = s.district_id
where e.per_pupil_expenditure > (
    select avg(e.per_pupil_expenditure) as app
    from expenditures as e
) and s.exemplary > (
    select avg(s.exemplary) as ase
    from staff_evaluations as s
) and d.type = "Public School District"
order by s.exemplary desc, e.per_pupil_expenditure desc;
