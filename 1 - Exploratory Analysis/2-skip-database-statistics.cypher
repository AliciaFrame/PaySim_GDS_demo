// 2. (skip) Database statistics
//2. Database statistics

CALL db.labels() YIELD label
CALL apoc.cypher.run('MATCH (:`'+label+'`) RETURN count(*) as freq', {})
YIELD value
WITH label, value.freq AS freq
CALL apoc.meta.stats() YIELD nodeCount
WITH *, 3 AS precision
WITH *, 10^precision AS factor, toFloat(freq)/toFloat(nodeCount) AS relFreq
RETURN label AS nodeLabel, freq AS frequency,
round(relFreq*factor)/factor AS relativeFrequency
ORDER BY freq DESC;