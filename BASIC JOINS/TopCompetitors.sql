SELECT s.hacker_id,
  h.name
FROM hackers h
  RIGHT JOIN submissions s ON h.hacker_id = s.hacker_id
  LEFT JOIN challenges c ON c.challenge_id = s.challenge_id
  LEFT JOIN Difficulty d ON d.difficulty_level = c.difficulty_level
WHERE d.score = s.score
GROUP BY s.hacker_id,
  h.name
HAVING COUNT(h.name) > 1
ORDER BY COUNT(h.name) DESC,
  s.hacker_id ASC;
-- Apparently works with inner join too xD