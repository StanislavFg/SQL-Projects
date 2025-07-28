create view june_vacancies as
select l.id, l.property_type, l.host_name, count(a.available) as days_vacant
from listings as l
join availabilities as a on l.id = a.listing_id
where a.available like 'TRUE' and a."date" like '%-06-%'
group by l.id;
