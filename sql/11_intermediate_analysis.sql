-- CTEs

WITH MonthlyMetrics AS (

    SELECT
        DATE_TRUNC('month', invoice_date) AS sales_month,
        SUM(revenue) AS total_revenue,
        SUM(profit) AS total_profit,
        COUNT(DISTINCT invoice) AS total_orders

    FROM v_clean_ecommerce_data

    GROUP BY 1

)

SELECT *
FROM MonthlyMetrics
ORDER BY sales_month;

-- LAG()

WITH MonthlyMetrics AS (

    SELECT
        DATE_TRUNC('month', invoice_date) AS sales_month,
        SUM(revenue) AS total_revenue
    FROM v_clean_ecommerce_data
    GROUP BY 1

)

SELECT
    sales_month,
    total_revenue,
    LAG(total_revenue,1)
        OVER (
            ORDER BY sales_month
        ) AS previous_month_revenue
FROM MonthlyMetrics;

-- ROW_NUMBER()

SELECT
customer_id,
SUM(revenue) total_revenue,
ROW_NUMBER() OVER (
ORDER BY SUM(revenue) DESC
)
AS customer_rank
FROM v_clean_ecommerce_data
GROUP BY customer_id;

-- RANK()

SELECT
    customer_id,
    SUM(revenue) AS total_revenue,
    RANK()
        OVER (
            ORDER BY SUM(revenue) DESC
        ) AS revenue_rank
FROM v_clean_ecommerce_data
GROUP BY customer_id;

-- DENSE_RANK()

SELECT
    customer_id,
    SUM(revenue) AS total_revenue,
    DENSE_RANK()
        OVER (
            ORDER BY SUM(revenue) DESC
        ) AS revenue_rank
FROM v_clean_ecommerce_data
GROUP BY customer_id;

 -- Running totals

SELECT
    DATE_TRUNC('month', invoice_date) AS sales_month,
    SUM(revenue) AS revenue,

    SUM(SUM(revenue))
        OVER (
            ORDER BY DATE_TRUNC('month', invoice_date)
        ) AS running_total

FROM v_clean_ecommerce_data

GROUP BY 1

ORDER BY 1;
