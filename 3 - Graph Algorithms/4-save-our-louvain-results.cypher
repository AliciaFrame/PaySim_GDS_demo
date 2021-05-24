// 4. Save our louvain results

CALL gds.louvain.write('client_graph',{
    nodeLabels:['Client'],
    relationshipTypes:['TRANSACTED_WITH'],
    consecutiveIds:true,
    writeProperty:'LouvainCommunity'
   })