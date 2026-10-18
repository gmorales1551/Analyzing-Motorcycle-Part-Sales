-- Calculate monthly wholesale net revenue by product line and warehouse
SELECT 
    product_line,
    CASE 
        WHEN EXTRACT(month FROM date) = 6 THEN 'June'
        WHEN EXTRACT(month FROM date) = 7 THEN 'July'
        WHEN EXTRACT(month FROM date) = 8 THEN 'August'
    END AS month,
    warehouse,
    SUM(total) - SUM(payment_fee) AS net_revenue
FROM sales
WHERE EXTRACT(month FROM date) IN (6, 7, 8) 
  AND client_type = 'Wholesale'
GROUP BY product_line, month, warehouse
ORDER BY product_line, month, net_revenue DESC;
