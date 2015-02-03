# geneMap

*Matlab implementation of Self-Organized map for HGDP SNP genotyping data.*
*For comparison to other dimensionality reduction methods, we used L. van der Maaten's Matlab Dimensionality Reduction toolbox, available [here](http://lvdmaaten.github.io/drtoolbox/).*


###Including

1. Preprocessed HGDP data
  - original data is taken from Stanford's Human Genome Diversity Project [website](http://www.hagsc.org/hgdp/files.html)
  - 1,043 samples with 660,918 dimensions, reduced to 1,043 dimensions (maped to sample space). By default, our algorithm will further reduce the dimensionality to first 200 principal components. 
  - TODO: details of data preprocessing (missing values, two alleles)
2. Standard batch ordering and convergence phases of the algorithm
  - Default parameters were set following the recommendations from T. Kohonen's MATLAB Implementations and Applications of Self-Organizing map, available [here](http://docs.unigrafia.fi/publications/kohonen_teuvo/index.html). 
  - To reduce issues at the edges of the map, SOM updates are combined with k-means updates.
3. Video tracking of weight ordering in the first two principal components
  - During the run of the code, generated is video showing the SOM grid projected to first two principal   
4. Plots of the mapped data
  - comparison of the training data mapings to the nodes of the grid, distinguishing samples by Regions and Countries/Populations. 
  - TODO: add legend, examples

###To do 
  - adaptively adding nodes to the grid during training
  - mapping to surface instead of node of the grid
  - hexagonal connectivity (?)
  - implement comparison of representations ala Al-Oqaily&Kennedy 2008 [paper](http://crpit.com/confpapers/CRPITV87AlOqaily.pdf) 
