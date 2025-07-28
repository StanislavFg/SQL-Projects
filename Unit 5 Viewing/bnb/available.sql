create view available as
select l.id, l.property_type, l.host_name, a.date
from listings as l
join availabilities as a on l.id = a.listing_id
where a.available like 'TRUE';
