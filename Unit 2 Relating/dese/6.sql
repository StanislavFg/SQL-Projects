select s.name from
schools as s
where s.id in (
    select school_id
    from graduation_rates
    where graduated = 100
)
