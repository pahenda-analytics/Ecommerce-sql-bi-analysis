--Return metrics

SELECT
    COUNT(*) AS return_transactions,
    ROUND(ABS(SUM(revenue)),2) AS returns_value,
    ROUND(ABS(SUM(profit)),2) AS returns_profit_impact
FROM v_clean_ecommerce_data
WHERE invoice LIKE 'C%';

--Returns by category

SELECT
    category,
    COUNT(*) AS returns,
    ROUND(ABS(SUM(revenue)),2) AS return_value
FROM v_clean_ecommerce_data
WHERE invoice LIKE 'C%'
GROUP BY category
ORDER BY return_value DESC;

--Returns by customer segment

SELECT
    customer_segment,
    COUNT(*) AS returns,
    ROUND(ABS(SUM(revenue)),2) AS return_value
FROM v_clean_ecommerce_data
WHERE invoice LIKE 'C%'
GROUP BY customer_segment
ORDER BY return_value DESC;
