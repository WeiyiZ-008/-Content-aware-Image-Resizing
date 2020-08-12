function [reducedColorImg,reducedEnergyImg] = greedy_decrease_height(im,energyImg)

hor_seam = greedy_find_horizontal_seam(energyImg);
[rowNum,colNum] = size(energyImg);

reducedColorImg(:,:,1:3) = zeros(rowNum-1,colNum,3);    % initialize 3D and 2D matrix with shortter width
reducedEnergyImg = zeros(rowNum-1,colNum);

for i=1:colNum
    img_col_ch1 = im(:,i,1);
    img_col_ch2 = im(:,i,2);
    img_col_ch3 = im(:,i,3);
    energy_col = energyImg(:,i);
    
    remove_rowInd = hor_seam(1,i);
    
    img_col_ch1(remove_rowInd)=[];   % remove the row pixel in every vector
    img_col_ch2(remove_rowInd)=[];
    img_col_ch3(remove_rowInd)=[];
    energy_col(remove_rowInd)=[];    
    
    reducedColorImg(:,i,1) = img_col_ch1; % update to return matrixs
    reducedColorImg(:,i,2) = img_col_ch2; 
    reducedColorImg(:,i,3) = img_col_ch3; 
    reducedEnergyImg(:,i) = energy_col;
end
reducedColorImg = uint8(reducedColorImg);
