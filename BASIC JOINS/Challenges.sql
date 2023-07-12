SELECT c.hacker_id,
    h.name,
    count(c.challenge_id) AS challenges_created
FROM Hackers AS h
    JOIN Challenges AS c ON h.hacker_id = c.hacker_id
GROUP BY c.hacker_id,
    h.name
HAVING challenges_created = (
        SELECT count(c1.challenge_id)
        FROM Challenges AS c1
        GROUP BY c1.hacker_id
        ORDER BY count(*) desc
        limit 1
    ) 
    -- ^^ Gets the highest count
    or challenges_created NOT IN (
        SELECT count(c2.challenge_id)
        FROM Challenges AS c2
        GROUP BY c2.hacker_id
        HAVING c2.hacker_id <> c.hacker_id
    )
    -- ^^ Get the unrepeated unique totals, is actually 
    -- for repeated values but not in results in desired unique result
ORDER BY challenges_created DESC,
    c.hacker_id;

-- select h.hacker_id,
--     h.name,
--     count(*) As challenges_created
-- from hackers h
--     inner join challenges c on h.hacker_id = c.hacker_id
-- where
-- group by h.hacker_id,
--     h.name
-- order by count(*) desc

