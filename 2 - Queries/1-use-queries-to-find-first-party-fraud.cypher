// 1. Use Queries to find first party fraud
//4. Use Queries to find first party fraud
MATCH p=(c1:Client)-[:HAS_EMAIL|:HAS_PHONE|:HAS_SSN] ->(n)<- [:HAS_EMAIL|:HAS_PHONE|:HAS_SSN]-(c2:Client)
WHERE c1.id<>c2.id
RETURN p limit 5