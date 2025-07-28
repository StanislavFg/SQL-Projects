
-- *** The Lost Letter ***
select "address", "type"
from "addresses"
where "id" = (
    select "to_address_id" from "packages"
    where "contents" like "Congratulatory letter" and "from_address_id" = (
        select "id" from "addresses"
        where "address" = "900 Somerville Avenue"
    ) and "id" = (
        select "package_id" from "scans"
        where "action" = "Drop"
    )
);

-- *** The Devious Delivery ***

select "packages"."contents", "scans"."address_id", "packages"."id"
from "packages"
join "scans" on "packages"."to_address_id" = "scans"."address_id"
where "scans"."action" = "Pick" and "packages"."from_address_id" is Null;

select "s"."action", "s"."timestamp", "a"."type", "s"."package_id"
from "scans" as "s"
join "addresses" as "a" on "a"."id" = "s"."address_id"
where "s"."package_id" = 5098;

-- *** The Forgotten Gift ***
select "packages"."contents", "scans"."address_id", "addresses"."address", "packages"."id"
from "packages"
join "scans" on "packages"."to_address_id" = "scans"."address_id"
join "addresses" on "packages"."from_address_id" = "addresses"."id"
where "scans"."action" = "Pick" and "addresses"."address" = "109 Tileston Street";

select "s"."action", "s"."timestamp", "a"."address", "s"."package_id", "d"."name"
from "scans" as "s"
join "addresses" as "a" on "a"."id" = "s"."address_id"
join "drivers" as "d" on "d"."id" = "s"."driver_id"
where "s"."package_id" = 9523;

