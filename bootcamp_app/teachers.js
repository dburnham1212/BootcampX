const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const cohortDate = process.argv[2] || 'JUL02';
// Store all potentially malicious values in an array.
const values = [`${cohortDate}`];

pool.query(`
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
JOIN assistance_requests ON assistance_requests.student_id = students.id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE cohorts.name = $1
ORDER BY teacher;
`, values)
.then(res => {
  res.rows.forEach(request => {
    console.log(`${request.cohort}: ${request.teacher}`);
  })
}).catch(err => console.error('query error', err.stack));