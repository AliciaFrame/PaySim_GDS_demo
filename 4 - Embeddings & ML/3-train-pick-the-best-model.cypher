//3. train & pick the best model
CALL gds.alpha.ml.nodeClassification.train('fraud_graph', {
   nodeLabels: ['Client'],
   modelName: 'fraud-model',
   featureProperties: ['embedding', 'triangles','num_frauds','num_transactions','pageRank'], 
   targetProperty: 'is_fraudster', 
   metrics: ['F1_WEIGHTED','ACCURACY'], 
   holdoutFraction: 0.2, 
   validationFolds: 5, 
   randomSeed: 2,
   params: [
       {penalty: 0, maxEpochs: 1000},
       {penalty: 0.5, maxEpochs: 1000},
       {penalty: 1.0, maxEpochs: 1000}
       ]
    }) YIELD modelInfo
  RETURN
  modelInfo.bestParameters AS winningModel,
  modelInfo.metrics.F1_WEIGHTED.outerTrain AS trainGraphScore,
  modelInfo.metrics.F1_WEIGHTED.test AS testGraphScore
