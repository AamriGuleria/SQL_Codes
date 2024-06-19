-- delete p1 from Person p1,Person p2
-- where
-- p1.email=p2.email and p1.id>p2.id;
with duplicate as
(
    SELECT p1.id
    FROM Person p1
    JOIN Person p2 ON p1.email = p2.email
    WHERE p1.id > p2.id
)
DELETE FROM Person
WHERE id IN (select id from duplicate);