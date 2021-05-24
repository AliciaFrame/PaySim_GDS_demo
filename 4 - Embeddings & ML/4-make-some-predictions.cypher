// 4. make some predictions!

//Label the data we want to make predictions on
MATCH (c:Client) WHERE NOT (c:model_data) SET c:predict_data;

// load the graph
CALL gds.graph.create('predict_graph',
{
	Client:{
    	label:'predict_data',
        properties:{
        	embedding:{property:'embedding', defaultValue:0},
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

//update the in-memory graph with some new predictions
CALL gds.alpha.ml.nodeClassification.predict.mutate('predict_graph', {
  nodeLabels: ['Client'], //filter our the character nodes
  modelName: 'fraud-model',
  mutateProperty: 'predicted_fraudster',
  predictedProbabilityProperty: 'predicted_fraud_probability'
});

//write the predictions back to the database
CALL gds.graph.writeNodeProperties(
  'predict_graph',
  ['predicted_fraudster', 'predicted_fraud_probability'],
  ['Client']
);