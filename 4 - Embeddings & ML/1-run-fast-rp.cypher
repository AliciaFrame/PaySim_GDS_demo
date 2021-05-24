// 1. Run FastRP
CALL gds.fastRP.write('client_graph',{
	nodeLabels:['Client'],
    relationshipTypes:['TRANSACTED_WITH'], 
    embeddingDimension:50, 
    writeProperty:'embedding'
})