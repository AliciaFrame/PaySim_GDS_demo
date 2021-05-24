//5. (Skip) Clean up
CALL gds.beta.model.drop('fraud-model');
CALL gds.graph.drop('client_graph');
CALL gds.graph.drop('fraud_graph');
CALL gds.graph.drop('predict_graph');
MATCH (c:model_data) remove c:model_data;
MATCH (c:predict_data) remove c:predict_data;
MATCH (c:Client) remove c.predicted_fraudster;
MATCH (c:Client) remove c.predicted_fraud_probability;