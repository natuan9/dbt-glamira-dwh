WITH calendar AS (
  SELECT
    day AS date
  FROM UNNEST(GENERATE_DATE_ARRAY('2015-01-01', '2030-12-31', INTERVAL 1 DAY)) AS day
)

SELECT
    FORMAT_DATE('%Y%m%d', date) AS date_id,
    date,
    EXTRACT(YEAR FROM date) AS year,
    EXTRACT(QUARTER FROM date) AS quarter,
    EXTRACT(MONTH FROM date) AS month,
    FORMAT_DATE('%B', date) AS month_name,
    EXTRACT(WEEK FROM date) AS week_of_year,
    EXTRACT(DAY FROM date) AS day_of_month,
    EXTRACT(DAYOFWEEK FROM date) AS day_of_week,
    FORMAT_DATE('%A', date) AS day_name,
    CASE WHEN EXTRACT(DAYOFWEEK FROM date) IN (1,7) THEN TRUE ELSE FALSE END AS is_weekend
FROM calendar
