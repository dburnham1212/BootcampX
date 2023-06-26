SELECT students.name AS student, avg(assignment_submissions.duration) as average_assignment_duration, avg(assignments.duration) average_estimated_duration 
FROM students 
JOIN assignment_submissions ON assignment_submissions.student_id = students.id
JOIN assignments ON assignment_id = assignments.id
WHERE students.end_date IS NULL
GROUP BY student
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_assignment_duration;