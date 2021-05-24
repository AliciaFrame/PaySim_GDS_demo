//3. ...and who do they interact with?
MATCH (c:Client{name:"Jackson Chavez"})-[r:PERFORMED]->(:Transaction)-[:TO]->(c2:Client)
RETURN DISTINCT c2.name, COUNT (c2) as num_transactions ORDER BY num_transactions DESC