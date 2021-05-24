//4. (skip) label suspected fraudsters
MATCH (c:Client)-[]->(t:Transaction)
WHERE t.fraud=true
WITH c, COUNT(t) as num_frauds
WHERE num_frauds > 10
SET c.is_fraudster = 1