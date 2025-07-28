update users
set "password" = "982c0381c279d139fd221fce974916e7"
where users.id = 1;

delete from user_logs
where "type" = "update" and "new_username" = "admin" and "new_password" = "982c0381c279d139fd221fce974916e7";

insert into user_logs("type", "old_username", "new_username", "new_password")
select 'update', 'admin', 'admin', (
    select "password"
    from users
    where username = "emily33"
);
