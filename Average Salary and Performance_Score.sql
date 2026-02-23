-- Average salary by State.
 
-- Average Performed State.
SELECT State_name AS State, AVG(Performance_Score) AS Average_Performance_Score
FROM staff_records
JOIN state_metrics
ON staff_records.state_id = state_metrics.state_id
GROUP BY State
ORDER BY Average_Performance_Score DESC; 