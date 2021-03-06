% read and preprocess data 
data = (load('NS_660755markersPreprocessed.txt'))';
[~, data, eig] = pca(data, 'NumComponents', 40);
[p.nPersons, p.nMarkers] = size(data);
data = 10*data/max(max(data)); %rescale data to range within [-10, 10]
%%                                                           | parameters |
% network
p.xOut = 60;                       
p.yOut = round(p.xOut*eig(2)/eig(1)); 
p.nOut = p.xOut*p.yOut;
p.makeMovie = 1;
% batch, epochs
p.batch = 10;
p.edges = 0;
p.nEpochs = 50;  
p.nCEpochs = 0; 
% Ordering parameters
% eta - learning rate | sigma - neighborhood width
p.eta0 = 0.1;                           
p.sigma0 = 0.2*norm([1 1] - [p.xOut p.yOut]);
nOrderIter = p.nPersons*20*floor(sqrt(p.xOut*p.yOut)/10 + 0.5);
p.etafun = 1; % 0/1/2/3 | linear/exponential/log/sigmoid
p.sigmafun = 1;
p.tau1 = 2*nOrderIter;
p.tau2 = 2*p.tau1/(log(p.sigma0)); 
% Convergence parameters
p.eta = 0.001;
p.sigma = 0.5; 

%%                                                             | TRAINING |
w = 0.01*(2*rand(p.nOut, p.nMarkers) - ones(p.nOut, p.nMarkers));
% initialize to first two principal components
[wI, wJ] = ndgrid(linspace(min(data(:,1)),max(data(:,1)),p.xOut), ...
                  linspace(min(data(:,2)),max(data(:,2)),p.yOut));
w(:,1) = w(:,1) + 0.05*reshape(wI, p.nOut, 1);
w(:,2) = w(:,1) + 0.05*reshape(wJ, p.nOut, 1);
%                                                              | ORDERING |
w = Ordering(w, data, p);
% 10 #########################                             | CONVERGENCE  |
%w = Convergence(w, data, p);
%%                                                                | final |
figure(4)
win = FindWinnersFinal(data, w, p, 0);
PlotMap(win, p, 1);

% save results
save(strcat(datestr(now),'.mat'), 'p', 'w');