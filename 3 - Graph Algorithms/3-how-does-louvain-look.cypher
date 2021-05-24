//3. How does Louvain look?
CALL gds.louvain.stats('client_graph',{
    nodeLabels:['Client'],
    relationshipTypes:['TRANSACTED_WITH'],
    consecutiveIds:true
   })