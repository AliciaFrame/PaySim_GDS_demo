// 2. (Skip) Create client - client relationships
//2. Create client - client relationships
CALL gds.graph.create.cypher(
'client_graph', 
'MATCH (c:Client) return id(c) as id', 
'MATCH (c:Client)-[:PERFORMED]->(t)-[:TO]->(c2:Client) return id(c) as source, id(c2) as target, sum(t.amount) as amount, "TRANSACTED_WITH" as type '
)