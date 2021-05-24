// 5. find fraud rings
MATCH (c:Client) 
WITH DISTINCT(c.LouvainCommunity) as louvain_id, count(c) as num_members
WHERE num_members > 5
WITH louvain_id, num_members
MATCH (c:Client) WHERE c.is_fraudster=1 AND c.LouvainCommunity = louvain_id
WITH louvain_id, num_members, count(c) AS count_fraudsters
RETURN louvain_id, num_members,count_fraudsters, toFloat(count_fraudsters)/toFloat(num_members) AS fraction_fraud
ORDER BY fraction_fraud DESC

