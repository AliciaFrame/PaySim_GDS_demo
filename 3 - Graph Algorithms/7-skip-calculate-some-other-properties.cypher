// 7. (skip) Calculate some other properties
CALL gds.degree.write('client_graph',{
    nodeLabels:['Client'],
    relationshipTypes:['TRANSACTED_WITH'],
    writeProperty:'degree'
   });
   
 CALL gds.pageRank.write('client_graph',{
    nodeLabels:['Client'],
    relationshipTypes:['TRANSACTED_WITH'],
    writeProperty:'pageRank'
   });  
   
CALL gds.pageRank.write('client_graph',{
    nodeLabels:['Client'],
    relationshipTypes:['TRANSACTED_WITH'],
    writeProperty:'pageRank'
   });
   
CALL gds.triangleCount.write('client_graph',{
    nodeLabels:['Client'],
    relationshipTypes:['TRANSACTED_WITH'],
    writeProperty:'triangles'
   });
   