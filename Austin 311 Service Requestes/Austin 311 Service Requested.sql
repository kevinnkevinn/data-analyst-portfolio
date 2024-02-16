SELECT * FROM bigquery-public-data.austin_311.311_service_requests;

-- Service Request Type
SELECT complaint_description, COUNT(*) AS request_count
FROM `bigquery-public-data.austin_311.311_service_requests`
WHERE created_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY complaint_description
ORDER BY request_count DESC
LIMIT 10;

--- Service Request Volume Trend
SELECT 
  DATE_TRUNC(created_date, YEAR) AS year,
  COUNT(*) AS total_requests
FROM `bigquery-public-data.austin_311.311_service_requests`
WHERE created_date BETWEEN '2018-01-01' AND '2023-12-31'
GROUP BY year
ORDER BY year ASC;

-- Service Request Response Time
SELECT
  complaint_description,
  AVG(DATE_DIFF(close_date, created_date, DAY)) AS average_resolution_time_in_days
FROM `bigquery-public-data.austin_311.311_service_requests`
WHERE close_date IS NOT NULL
GROUP BY complaint_description
ORDER BY average_resolution_time_in_days ASC;

-- Service Request based on Season
SELECT 
  EXTRACT(MONTH FROM created_date) AS month,
  complaint_description,
  COUNT(*) AS total_requests
FROM `bigquery-public-data.austin_311.311_service_requests`
GROUP BY month, complaint_description
ORDER BY month ASC, total_requests DESC;

-- Day Service
SELECT 
  EXTRACT(DAYOFWEEK FROM created_date) AS day_of_week,
  complaint_description,
  COUNT(*) AS total_requests
FROM `bigquery-public-data.austin_311.311_service_requests`
GROUP BY day_of_week, complaint_description
ORDER BY day_of_week ASC, total_requests DESC;

-- Location-based Services
SELECT 
  county,
  complaint_description,
  COUNT(*) AS total_requests
FROM `bigquery-public-data.austin_311.311_service_requests`
GROUP BY county, complaint_description
ORDER BY total_requests DESC;

-- Service based on Status
SELECT 
  status,
  COUNT(*) AS total_requests
FROM `bigquery-public-data.austin_311.311_service_requests`
GROUP BY status
ORDER BY total_requests DESC;

-- Response Time Trends by Type of Service
SELECT 
  EXTRACT(YEAR FROM created_date) AS year,
  complaint_description,
  AVG(DATE_DIFF(close_date, created_date, DAY)) AS average_resolution_time
FROM `bigquery-public-data.austin_311.311_service_requests`
WHERE close_date IS NOT NULL
GROUP BY year, complaint_description
ORDER BY year ASC, average_resolution_time ASC;

-- Source-based Services
SELECT 
  source,
  complaint_description,
  COUNT(*) AS total_requests
FROM `bigquery-public-data.austin_311.311_service_requests`
GROUP BY source, complaint_description
ORDER BY total_requests DESC;

-- Service Request by Demographics
SELECT 
  CASE
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM created_date) <= 18 THEN 'Under 18'
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM created_date) BETWEEN 19 AND 30 THEN '19-30'
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM created_date) BETWEEN 31 AND 40 THEN '31-40'
    WHEN EXTRACT(YEAR FROM CURRENT_DATE()) - EXTRACT(YEAR FROM created_date) BETWEEN 41 AND 50 THEN '41-50'
    ELSE 'Over 50'
  END AS age_group,
  complaint_description,
  COUNT(*) AS total_requests
FROM `bigquery-public-data.austin_311.311_service_requests`
WHERE EXTRACT(YEAR FROM created_date) IS NOT NULL
GROUP BY age_group, complaint_description
ORDER BY total_requests DESC;



