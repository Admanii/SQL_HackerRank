SELECT
  CASE
    WHEN grades.grade < 8 THEN NULL
    WHEN grades.grade >= 8 THEN students.NAME
  END,
  Grades.grade,
  students.MARKS
from
  students
  INNER JOIN Grades
WHERE
  students.marks >= Grades.min_mark
  and students.marks <= Grades.max_mark
ORDER BY
  Grades.GRADE DESC,
  STUDENTS.NAME ASC;