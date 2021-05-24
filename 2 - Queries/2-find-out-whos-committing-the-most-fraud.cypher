//2. Find out who's committing the most fraud
MATCH (c:Client)-[]->(t:Transaction)
WHERE t.fraud=true
RETURN c.name, COUNT(t) AS num_frauds ORDER BY num_frauds DESC