function w = CompetitionUpdate( eta, sigma, currentIn, w, p, positionsI, positionsJ)

% find winners for each in batch
[nBatch, nDim] = size(currentIn);
dAll = permute(repmat(currentIn', 1, 1, p.nOut), [3 1 2]) -...
               repmat(w, 1, 1, nBatch);
[~, winners] = min(sum(dAll.^2, 2)); 

d = zeros(nBatch, nDim);
for i=1:nBatch            % 6 ############### get rid of FOR
    d(i,:) = dAll(winners(i), :, i);
end  % size(dAll) = (winners x distances x batch )  

% find winner coordinates, find distances
[iWinner, jWinner] = ind2sub([p.xOut, p.yOut], winners);
dGrid = sqrt((repmat(positionsI, 1, nBatch) - repmat(squeeze(iWinner)', p.nOut, 1)).^2 +...
             (repmat(positionsJ, 1, nBatch) - repmat(squeeze(jWinner)', p.nOut, 1)).^2);  
h = exp(-0.5*dGrid/(sigma^2));
dw = eta*(h*d)./nBatch; %? 
w = w + dw;   

