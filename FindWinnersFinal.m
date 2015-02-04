function win = FindWinnersFinal(data, w, p, show)

% scalar product distance
dAll = w*data';
[~, winners] = max(dAll,[],1); 
[iWinner, jWinner] = ind2sub([p.xOut, p.yOut], winners);
win(:,1) = iWinner;
win(:,2) = jWinner;
% plot if needed
if show
  dataInfo = load('SoCS_SampleInfo.txt');
  cathegories = unique(dataInfo(3, :));
  cc = hsv(cathegories(end));
  cc(4, :) = [1 0.5 0.2];
  rSymb = {'p', 'o','d','^','h','s','v'};
  % find how many is shared
  nShared = zeros(p.xOut, p.yOut);
  for k=1:p.nOut
    [i, j] = ind2sub([p.xOut, p.yOut], k);  
    nShared(i,j) = sum((iWinner == i).*(jWinner== j));
  end    
  
  hold on
  kk = hsv(7);
  kk(4, :) = [1 0.5 0.2];
  % plot person per person
  for k=1:p.nPersons
      iTemp = iWinner(k);
      jTemp = jWinner(k);
      colTemp = kk(dataInfo(3, k),:);
      symbTemp = rSymb{(dataInfo(3, k))};
      sizeTemp = 2 + 2*log(nShared(iTemp, jTemp)+1);
      nShared(iTemp, jTemp) = nShared(iTemp, jTemp) - 1;
      plot(iTemp, jTemp, 'Marker', symbTemp, 'MarkerSize', sizeTemp, 'MarkerEdgeColor', colTemp, 'MarkerFaceColor', colTemp);
  end
  axis([0 p.xOut+1 0 p.yOut+1]);
  hold off
end 