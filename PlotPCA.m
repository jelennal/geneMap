% case with preprocessed data
function PlotPCA(dataProjection, classType, w, A)

nPersons = size(dataProjection, 1);
dataInfo = load('SoCS_SampleInfo.txt');
cathegories = unique(dataInfo(classType, :));

pcaGroups = [];
for i=1:max(cathegories)
  groupi = struct('g', []);
  pcaGroups = [pcaGroups groupi];
end

for i=1:nPersons
   class = dataInfo(classType, i);       
   pcaGroups(class).g = [pcaGroups(class).g; [dataProjection(i,1) dataProjection(i,2)]]; 
end

 hold on
 cc = hsv(cathegories(end));
 cc(4, :) = [1 0.5 0.2];
 for i=cathegories
   positions = pcaGroups(i).g;
   color = i;
   plot(positions(:,1), positions(:,2), '.', 'MarkerSize', 5,'MarkerFaceColor', cc(color,:), 'MarkerEdgeColor', cc(color,:));
 end
 
 wProjection = w(:, [1,2]);
 gplot(A, wProjection, '-.k'); 
 hold off 
