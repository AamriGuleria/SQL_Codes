SELECT p.category , AVG(s.sale_price) AS average_sale_price
FROM
products p
JOIN
sales s
ON
product.product_id=sales.product_id
group by category;
