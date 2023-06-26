SELECT cohorts.name AS cohort, count(assignment_submissions.assignment_id) as total_submissions
FROM students 
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohort
ORDER BY total_submissions DESC;