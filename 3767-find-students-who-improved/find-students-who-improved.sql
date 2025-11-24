WITH ranked AS (
  SELECT
    student_id,
    subject,
    score,
    exam_date,
    ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date)        AS rn_asc,
    ROW_NUMBER() OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC)   AS rn_desc,
    COUNT(*)      OVER (PARTITION BY student_id, subject)                          AS cnt
  FROM Scores
)
SELECT
  student_id,
  subject,
  MAX(CASE WHEN rn_asc  = 1 THEN score END) AS first_score,
  MAX(CASE WHEN rn_desc = 1 THEN score END) AS latest_score
FROM ranked
GROUP BY student_id, subject
HAVING MAX(cnt) > 1
   AND MAX(CASE WHEN rn_desc = 1 THEN score END) > MAX(CASE WHEN rn_asc = 1 THEN score END)
ORDER BY student_id, subject;
