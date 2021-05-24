//8. (skip) some Cypher Feature Engineering
MATCH (c:Client)-[:PERFORMED]->(t:Transaction)
WITH c, count(t) as num_transaction, sum(t.amount) as total_transaction_volume
SET c.num_transactions=num_transaction, c.total_transaction_amnt=total_transaction_volume;

MATCH (c:Client)-[:PERFORMED]->(t:Transaction{fraud:true})
WITH c, count(t) as num_frauds
SET c.num_frauds=num_frauds;