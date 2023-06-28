SELECT teachers.name as teacher, cohorts.name as cohort, COUNT(assistance_requests.*) as total_assistances FROM cohorts
JOIN students ON students.cohort_id = cohorts.id
JOIN assistance_requests ON assistance_requests.student_id = students.id
JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;

CREATE TABLE assignment_submissions(
  id SERIAL PRIMARY KEY NOT NULL,
  ons_id VARCHAR(255),
  ons_region VARCHAR(255),
  constituency_name VARCHAR(255),
  county_name VARCHAR(255),
  region_name VARCHAR(255),
  country_name VARCHAR(255),
  constituency_type VARCHAR(255),
  party_name VARCHAR(255),
  party_abbreviation VARCHAR(255),
  firstname VARCHAR(255),
  surname VARCHAR(255),
  gender VARCHAR(255),
  sitting_mp VARCHAR(255),
  former_mp VARCHAR(255),
  votes INTEGER,
  share INTEGER,
  change INTEGER
);

CREATE TABLE ge(
  ons_id,
  ons_region,
  constituency_name,
  county_name,
  region_name,
  country_name,
  constituency_type,
  party_name,
  party_abbreviation,
  firstname,
  surname,
  gender,
  sitting_mp,
  former_mp,
  votes,
  share,
  change
);