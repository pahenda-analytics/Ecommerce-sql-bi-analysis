-- Churn metrics

SELECT
    churn_flag,
    COUNT(*) customers,
    ROUND(AVG(revenue),2) avg_revenue,
    ROUND(AVG(profit),2) avg_profit
FROM v_clean_ecommerce_data
GROUP BY churn_flag;
