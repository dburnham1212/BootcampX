SELECT AVG(total_duration) AS average_total_duration FROM (SELECT cohorts.name AS cohort, SUM(completed_at-started_at) as total_duration FROM cohorts
JOIN students ON cohorts.id = students.cohort_id
JOIN assistance_requests ON student_id = students.id
GROUP BY cohorts.name
ORDER BY total_duration) as total_ar_durtation;
