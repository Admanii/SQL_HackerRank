SELECT s.hacker_id,
    h.name,
    (
        SELECT SUM(max_score)
        FROM (
                SELECT hacker_id, challenge_id, MAX(score) AS max_score
                FROM submissions
                GROUP BY hacker_id, challenge_id
            ) AS subquery
        WHERE subquery.hacker_id = s.hacker_id
    ) AS total_max_score
FROM submissions s
    join hackers h on s.hacker_id = h.hacker_id
GROUP BY s.hacker_id, h.name
HAVING total_max_score > 0
ORDER BY total_max_score desc, s.hacker_id;