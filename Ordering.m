function w = Ordering(w, data, p)

tic
eta = p.eta0;
sigma = p.sigma0;
[positionsI, positionsJ] = ndgrid(1:p.xOut, 1:p.yOut);
positionsI = reshape(positionsI, p.nOut, 1);
positionsJ = reshape(positionsJ, p.nOut, 1);
% for the movie
scrsz = get(groot,'ScreenSize');
%wait = waitbar(0, 'Wait', 'Position', [(scrsz(3)-600) (scrsz(4)-50) 300 50]); %[500 500 300 50]);   
A = FormAdjacencyMatrix(p.xOut, p.yOut);
dataProjection = data(:,[1,2]);
minI = min(dataProjection(:,1))-0.5;
minJ = min(dataProjection(:,2))-0.5;
fig = figure('position',[1 1 scrsz(3)/2 scrsz(4)/3]);
nFrame = 1;
%frame = zeros(p.nEpochs*round(p.nPersons/p.batch));

for k = 1:p.nEpochs 
 elapsed = toc; 
 message = strcat('Epoch: ',int2str(k),'/',int2str(p.nEpochs),' | Time passed: ', num2str(elapsed/60, 2),'min');
 fprintf('%s\n', message);
 %waitbar(k/p.nEpochs, wait, message);  
 personPerm = randperm(p.nPersons);   
 for i=1:p.batch:(p.nPersons-p.batch)   
   % projected weights on principal components
   if p.makeMovie && mod(i-1, 10) == 0
     subplot(1,2,1)
     cla
     text(minI, minJ,strcat...
         ('iter:',int2str(k),'|log(lr):',num2str(log(eta),2),'|nb:',num2str(sigma,2)));
     PlotPCA(dataProjection, 3, w, A);
     frame(nFrame) = getframe(fig);
     nFrame = nFrame + 1;
   end    
   currentIteration = (k-1)*p.nPersons + i; 
   currentIn = data(personPerm(i:(i+p.batch-1)),:);
   % find winners and update
   w = CompetitionUpdate(eta,sigma,currentIn,w,p,positionsI,positionsJ);
   sigma = p.sigma0*exp(-currentIteration/(p.tau1));
   eta = p.eta0*exp(-currentIteration/p.tau2);
 end
 if p.makeMovie && (mod(k, 4) == 0 || k < 5)
     subplot(1,2,2)
     cla
     win = FindWinnersFinal(data, w, p, 1);
     frame(nFrame) = getframe(fig);
     nFrame = nFrame + 1;
 end      
end

%close(wait)
% save the movie
if p.makeMovie == 1 
    size(frame)
    writerObj = VideoWriter(strcat(datestr(now),'.avi'));
    open(writerObj);
    slowdown = 2;
    for i = 1:(nFrame-1)
       for j=1:slowdown
        writeVideo(writerObj, frame(i))
       end 
    end
   close(writerObj);    
end
