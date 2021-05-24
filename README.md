# PaySim_GDS_demo
Demo of using the graph data science library (Neo4j GDS 1.6) on a simulated fraud data set with Bloom. You'll need Neo4j 4.0+ and GDS 1.5+, available on our [download center](https://neo4j.com/download-center/).

This demo is built to work with a PaySim dataset generated from @voutilad's [PaySim demo](https://github.com/voutilad/paysim-demo). You can grab a small version of the dataset [here](https://drive.google.com/file/d/1M_TqX_n48PaWNvUH1lxC8PF7gmXK-6Xf/view?usp=sharing) as a Neo4j dump file, or generate your own. My demo was run on a graph with ~1.5M nodes and ~2M relationships, on an instance with 16G RAM / 4 vCPUS. 
