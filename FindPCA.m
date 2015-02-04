function [coeffMatrix, dataProjection] = FindPCA(input)

% ------------------------------------------ specifying PCA
[coeffMatrix, dataProjection, latent] = pca(input,'NumComponents', 2);


end