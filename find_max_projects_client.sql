SELECT c.name, COUNT(p.*) as PROJECT_COUNT
FROM client c INNER JOIN project p ON c.id = p.client_id
GROUP BY p.client_id
HAVING COUNT(p.*) = (
 SELECT MAX(proj_count) FROM (SELECT COUNT(*) as proj_count FROM project GROUP BY client_id))
ORDER BY 1