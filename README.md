# geneMap

*Matlab implementation of Self-Organized map for HGDP SNP genotyping data.*
*For comparison to other dimensionality reduction methods, see L. van der Maaten's Matlab Dimensionality Reduction toolbox, available [here](http://lvdmaaten.github.io/drtoolbox/).*

[![click me](https://github.com/jelennal/geneMap/blob/master/pics/epoch40_90_150.jpg "Visualizing SOM at different stages of training")](https://vimeo.com/158672557)

###Including

1. Preprocessed HGDP data
  - original data is taken from Stanford's Human Genome Diversity Project [website](http://www.hagsc.org/hgdp/files.html)
  - 1,043 samples with 660,918 dimensions, reduced to 1,043 dimensions (mapped to sample space). Can be further reduced by PCA.
  - TODO: details of data preprocessing (missing values, two alleles)
2. Standard batch ordering and convergence phases of the algorithm
  - Default parameters were set following the recommendations from T. Kohonen's MATLAB Implementations and Applications of Self-Organizing map, available [here](http://docs.unigrafia.fi/publications/kohonen_teuvo/index.html). 
3. Video tracking of weight ordering in the first two principal components
  - During the run of the code, generated is [video](https://vimeo.com/158660924) showing the SOM grid projected to first two principal components   
4. Plots of the mapped data
  - comparison of the training data mapings to the nodes of the grid, distinguishing samples by Regions and Countries/Populations. 

###TODO 
  - to reduce [issues at the edges of the map](https://github.com/jelennal/geneMap/blob/master/pics/distance%20grid%20node%20to%20nearest%20sample.png), combining SOM updates with k-means updates.
  - adaptively adding nodes to the grid during training
  - mapping to surface instead of node of the grid
  - hexagonal connectivity (?)
  - implement comparison of representations ala Al-Oqaily&Kennedy 2008 [paper](http://crpit.com/confpapers/CRPITV87AlOqaily.pdf) 

###Visualization examples:

1. PCA
![click me][pca]
2. tSNE

<img src="https://github.com/jelennal/geneMap/blob/master/pics/tsne.png" width="400" height="400" />


3. SOM
![click me][som]
Two of the most common maps, with respect to relative orientation of regions. Left map was a result in about 75% runs, and right map in 20-25%.   

[pca]: https://github.com/jelennal/geneMap/blob/master/pics/pca.png "Some of the dominant PCA projections"
 
[som]: https://github.com/jelennal/geneMap/blob/master/pics/types%20of%20maps.png "Common SOMs. Left 75%, right 20-25%."
