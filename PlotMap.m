function PlotMap(data, p, classType)

  dataInfo = load('SoCS_SampleInfo.txt');
  cathegories = unique(dataInfo(classType, :));
  rSymb = {'p', 'o','d','^','h','s','v'};
  % find how many is shared
  nShared = zeros(p.xOut, p.yOut);
  for k=1:p.nOut
    [i, j] = ind2sub([p.xOut, p.yOut], k);  
    nShared(i,j) = sum((data(:,1) == i).*(data(:,2)== j));
  end    
  
  % colors
  kk = hsv(7);
  kk(4, :) = [1 0.5 0.2];
  cc = prism(cathegories(end)); % prism or something
  
  subplot(1,2,1)
  hold on
  % plot person per person
  for k=1:p.nPersons
      iTemp = data(k,1);
      jTemp = data(k,2);
      colTemp = kk(dataInfo(3, k),:);
      symbTemp = rSymb{(dataInfo(3, k))};
      sizeTemp = 2 + 2*log(nShared(iTemp, jTemp)+1);
      nShared(iTemp, jTemp) = nShared(iTemp, jTemp) - 1;
      plot(iTemp, jTemp, 'Marker', symbTemp, 'MarkerSize', sizeTemp, 'MarkerEdgeColor', colTemp, 'MarkerFaceColor', colTemp);
  end
  hold off
  subplot(1,2,2)
  hold on
  % plot person per person
  for k=1:p.nPersons
      iTemp = data(k,1);
      jTemp = data(k,2);
      colTemp = cc(dataInfo(classType, k),:);
      symbTemp = rSymb{(dataInfo(3, k))};
      sizeTemp = 2 + 2*log(nShared(iTemp, jTemp)+1);
      nShared(iTemp, jTemp) = nShared(iTemp, jTemp) - 1;
      plot(iTemp, jTemp, 'Marker', symbTemp, 'MarkerSize', sizeTemp, 'MarkerEdgeColor', colTemp, 'MarkerFaceColor', colTemp);
  end
  axis([0 p.xOut+1 0 p.yOut+1]);
  hold off

  % classNames = {'CSouth Asia', 'East Asia', 'Middle East','Oceania','Africa','Europe','America'};
  % legend(classNames, 'Location','EastOutside'); 
  % gridLegend(p, 1, classNames, 'Location','EastOutside');
 
  
 