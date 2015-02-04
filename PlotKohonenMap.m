function PlotKohonenMap4(Groups, classType, xOut, yOut, sharedWinners)

dataInfo = load('SoCS_SampleInfo.txt');


 % --------------------------- find name of regions/populations/coutries
 nClasses = max(dataInfo(classType,:));
 Group = Groups(classType).G;
 
 classNames = [];
 for i=1:nClasses
     name = GetOriginName(i, classType);
     classNames = [classNames; {name}];
 end
 
 
 if classType == 3
   classNames = {'CSouth Asia', 'East Asia', 'Middle East','Oceania','Africa','Europe','America'};
   cc = hsv(nClasses);
   cc(4, :) = [1 0.5 0.2];
 else
   cc = jet(nClasses);
   t1 = hsv(nClasses);
   t2 = lines(nClasses);
   cc(1:2:nClasses) = t1(nClasses:-2:1);
   cc(1:3:nClasses) = t2(1:3:nClasses);   
 end
 p=0;

 
 % -------------------------- actual plot ----------------------------
 % define colors
 hold on

 
 %legend('CSouth Asia', 'East Asia', 'Middle East','Oceania','Africa','Europe','America','Location','NorthEast');
 %legend(classNames, 'Location','NorthEast') 
 if classType == 3
    for i=1:nClasses
     winners = Group(i).g;
     color = i;
     if isempty(winners)
      i 
      winners = [0 0]; 
     end
     %plot(winners(:,1), winners(:,2), 'ok', 'MarkerSize', 10,'MarkerFaceColor', cc(color,:));
     p(i) = plot(winners(:,1), winners(:,2), 'ok', 'MarkerSize', 8,'MarkerFaceColor', cc(color,:));
    end
    
    %legend(classNames, 'Location','EastOutside'); 
    gridLegend(p, 1, classNames, 'Location','EastOutside');
 
    
    hold on
    shared = sharedWinners(:, 1:2);
    colors = sharedWinners(:, 3);
    nShared = size(sharedWinners, 1);
    for i=1:nShared
       color = colors(i);  % 'MarkerEdgeColor', cc(color,:)
       plot(shared(i,1), shared(i,2), 'ok', 'MarkerSize', 4,'MarkerFaceColor', cc(color,:));     
    end
    hold off
 
 else
     
   for i=1:nClasses
     winners = Group(i).g;
     color = i;
    if isempty(winners)
       i 
       winners = [0 0]; 
    end
    % plot(winners(:,1), winners(:,2), 'ok', 'MarkerSize', 10,'MarkerFaceColor', cc(color,:));
    p(i) = plot(winners(:,1), winners(:,2), 'ok', 'MarkerSize', 10,'MarkerFaceColor', cc(color,:));
 
   end
  
   %gridLegend(p, 5, classNames, 'Location','SouthOutside');     
 end    
 
 axis([0 xOut+1 0 yOut+1]);
 hold off
 
 
 
end