// 2. Load a graph to make predictions on
MATCH (c:Client) WHERE c.is_fraudster=0 OR c.is_fraudster=1 SET c:model_data;

CALL gds.graph.create('fraud_graph',
{
	Client:{
    	label:'model_data',
        properties:{
            embedding:{property:'embedding'},
            pageRank:{property:'pageRank', defaultValue:0},
            triangles:{property:'triangles', defaultValue:0},
            degree:{property:'degree', defaultValue:0},
            num_transactions:{property:'num_transactions',defaultValue:0},
            total_transaction_amnt:{property:'total_transaction_amnt',defaultValue:0},
            num_frauds:{property:'num_frauds',defaultValue:0},
            is_fraudster:{property:'is_fraudster',defaultValue:0}
        }
    }
}, {
	TO: {type:'TO'} //I don't actually need this
});
