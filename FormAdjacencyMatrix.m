function A = FormAdjacencyMatrix(xOut, yOut)

A = zeros(xOut*yOut, 1);

  for i=1:yOut
     for j=1:xOut
         
     index1 = (i-1)*xOut+j;
     
     i2 = i-1;
     j2 = j;
       if i2 >= 1 && i2 <= yOut && j2 >= 1 && j2 <= xOut
         index2 = (i2-1)*xOut+j2;
         A(index1, index2) = 1;
         A(index2, index1) = 1;
       end    
     i2 = i+1;
       if i2 >= 1 && i2 <= yOut && j2 >= 1 && j2 <= xOut
         index2 = (i2-1)*xOut+j2;
         A(index1, index2) = 1;
         A(index2, index1) = 1;
       end  
     i2 = i;
     j2 = j-1;
       if i2 >= 1 && i2 <= yOut && j2 >= 1 && j2 <= xOut
         index2 = (i2-1)*xOut+j2;
         A(index1, index2) = 1;
         A(index2, index1) = 1;
       end  
     j2 = j+1;
       if i2 >= 1 && i2 <= yOut && j2 >= 1 && j2 <= xOut
         index2 = (i2-1)*xOut+j2;
         A(index1, index2) = 1;
         A(index2, index1) = 1;
       end  
       
     end    
  end    


end

