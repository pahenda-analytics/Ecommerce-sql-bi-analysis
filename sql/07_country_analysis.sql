-- Revenue by country

SELECT
    country,
    COUNT(DISTINCT customer_id) customers,
    ROUND(SUM(revenue),2) revenue,
    ROUND(SUM(profit),2) profit
FROM v_clean_ecommerce_data
GROUP BY country
ORDER BY revenue DESC;

-- Customer count by country

SELECT
    country,
    COUNT(DISTINCT customer_id) AS total_customers
FROM v_clean_ecommerce_data
GROUP BY country
ORDER BY total_customers DESC;
