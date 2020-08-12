% RGB = imread('nice.png');
% gray_img = rgb2gray(RGB);
% [x,y] = imgradientxy(gray_img);   % compute the x and y-directional gradienst
% [result,~] = imgradient(x,y);
% imagesc(result);
% 
% %vertical cumulative energy, top -> bottom
% [numRow,numCol] = size(result)
% vertical_map = zeros(numRow,numCol);   %initialize to all zeros
% first_row = result(1,:);
% vertical_map(1,:) = first_row;    %initialize the first row value
% 
% for i=2:numRow
%    for j=1:numCol
%        if (j==1)
%            vertical_map(i,j)= result(i,j) + min(vertical_map(i-1,j),vertical_map(i-1,j+1));
%        elseif(j==numCol)
%            vertical_map(i,j)= result(i,j) + min(vertical_map(i-1,j-1),vertical_map(i-1,j));
%        else
%            vertical_map(i,j)= result(i,j) + min(vertical_map(i-1,j-1),min(vertical_map(i-1,j),vertical_map(i-1,j+1)));
%        end     
%    end
% end
% 
% % imagesc(vertical_map);
% 
% 
% %horizontal cumulative energy, left -> right
% horizontal_map = zeros(numRow,numCol);   %initialize to all zeros
% first_column = result(:,1);
% horizontal_map(:,1) = first_column;    %initialize the first row value
% 
% for i=2:numCol
%    for j=1:numRow
%        if (j==1)
%            horizontal_map(j,i)= result(j,i) + min(horizontal_map(j,i-1),horizontal_map(j+1,i-1));
%        elseif(j==numRow)
%            horizontal_map(j,i)= result(j,i) + min(horizontal_map(j-1,i-1),horizontal_map(j,i-1));
%        else
%            horizontal_map(j,i)= result(j,i) + min(horizontal_map(j-1,i-1),min(horizontal_map(j,i-1),horizontal_map(j+1,i-1)));
%        end     
%    end
% end
% 
% imagesc(horizontal_map);


function cumulativeEnergyMap = cumulative_min_energy_map(energyImg,seamDirection)
[numRow,numCol] = size(energyImg);

if(strcmp(seamDirection, 'HORIZONTAL'))
    horizontal_map = zeros(numRow,numCol);   %initialize to all zeros
    first_column = energyImg(:,1);
    horizontal_map(:,1) = first_column;    %initialize the first row value

    for i=2:numCol
       for j=1:numRow
           if (j==1)
               horizontal_map(j,i)= energyImg(j,i) + min(horizontal_map(j,i-1),horizontal_map(j+1,i-1));
           elseif(j==numRow)
               horizontal_map(j,i)= energyImg(j,i) + min(horizontal_map(j-1,i-1),horizontal_map(j,i-1));
           else
               horizontal_map(j,i)= energyImg(j,i) + min(horizontal_map(j-1,i-1),min(horizontal_map(j,i-1),horizontal_map(j+1,i-1)));
           end     
       end
    end
    cumulativeEnergyMap = horizontal_map;
elseif(strcmp(seamDirection, 'VERTICAL'))
    vertical_map = zeros(numRow,numCol);   %initialize to all zeros
    first_row = energyImg(1,:);
    vertical_map(1,:) = first_row;    %initialize the first row value

    for i=2:numRow
       for j=1:numCol
           if (j==1)
               vertical_map(i,j)= energyImg(i,j) + min(vertical_map(i-1,j),vertical_map(i-1,j+1));
           elseif(j==numCol)
               vertical_map(i,j)= energyImg(i,j) + min(vertical_map(i-1,j-1),vertical_map(i-1,j));
           else
               vertical_map(i,j)= energyImg(i,j) + min(vertical_map(i-1,j-1),min(vertical_map(i-1,j),vertical_map(i-1,j+1)));
           end     
       end
    end
    cumulativeEnergyMap = vertical_map;
end

