-- 1. Inspect total number of requests

SELECT COUNT(*)
FROM van_311_requests;

-- 2. Total number and percentage of closed service requests

SELECT
	COUNT(CASE WHEN Status = 'Close' THEN 1 END) AS closed_requests,
	ROUND(100 * COUNT(CASE WHEN Status = 'Close' THEN 1 END) / COUNT(*), 2) AS closed_pct
FROM van_311_requests;

-- 3. Top 10 most frequent service request types

SELECT 
	service_request_type, 
	COUNT(*) AS request_count
FROM van_311_requests
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 4. Top 10 most frequent departments

SELECT 
	department, 
	COUNT(*) AS request_count
FROM van_311_requests
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;

-- 5. Requests by channel

SELECT 
	channel, 
	COUNT(*) AS total_request
FROM van_311_requests
GROUP BY 1
ORDER BY 2 DESC;

-- 6. Requests by neighbourhood

SELECT
	count(*),
	local_area
FROM van_311_requests
GROUP BY 2
ORDER BY 1 DESC;


-- 6. Top 10 departments with highest resolution time

WITH resolution AS (
SELECT
	*,
	ROUND(EXTRACT(EPOCH FROM (last_modified_timestamp - service_request_open_timestamp)/86400),1) AS resolution_days
FROM van_311_requests
WHERE status = 'Close'
)

SELECT
	DISTINCT department,
	AVG(resolution_days) OVER (PARTITION BY department) AS avg_resolution_time,
	COUNT(*) OVER (PARTITION BY department) AS total_records
FROM resolution
ORDER BY 2 DESC
LIMIT 10

-- 7. Top 10 service request types with highest resolution time

WITH resolution AS (
SELECT
	*,
	ROUND(EXTRACT(EPOCH FROM (last_modified_timestamp - service_request_open_timestamp)/86400),1) AS resolution_days
FROM van_311_requests
WHERE status = 'Close'
)

SELECT
	DISTINCT service_request_type,
	AVG(resolution_days) OVER (PARTITION BY service_request_type) AS avg_resolution_time,
	COUNT(*) OVER (PARTITION BY service_request_type) AS total_records
FROM resolution
ORDER BY 2 DESC
LIMIT 10


