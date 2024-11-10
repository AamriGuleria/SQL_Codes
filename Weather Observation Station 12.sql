/*
Enter your query here.
*/
select distinct CITY
from
STATION
where
LOWER(SUBSTRING(CITY,1,1)) not in ('a','e','i','o','u')
AND LOWER(SUBSTRING(CITY,LENGTH(CITY),1)) not in ('a','e','i','o','u')