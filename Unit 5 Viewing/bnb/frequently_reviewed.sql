create view frequently_reviewed as
select l.id, l.property_type, l.host_name, count(r.comments) as reviews
from listings as l
join reviews as r on l.id = r.listing_id
group by l.id
order by reviews desc
limit 100;
