SELECT
(
SELECT count(DISTINCT add_id)
FROM
add_clicks
)
/
(
SELECT count(DISTINCT view_id)
FROM
add_views
) as ratio;