function [reducedColorImg,reducedEnergyImg] = greedy_decrease_width(im,energyImg) 

ver_seam = greedy_find_veertical_seam(energyImg);
[rowNum,colNum] = size(energyImg);

reducedColorImg(:,:,1:3) = zeros(rowNum,colNum-1,3);    % initialize 3D and 2D matrix with shortter width
reducedEnergyImg = zeros(rowNum,colNum-1);

for i=1:rowNum
    img_row_ch1 = im(i,:,1);
    img_row_ch2 = im(i,:,2);
    img_row_ch3 = im(i,:,3);
    energy_row = energyImg(i,:);
    
    remove_colInd = ver_seam(1,i);
    
    img_row_ch1(remove_colInd)=[];   % remove the column pixel in every vector
    img_row_ch2(remove_colInd)=[];
    img_row_ch3(remove_colInd)=[];
    energy_row(remove_colInd)=[];    
    
    reducedColorImg(i,:,1) = img_row_ch1; % update to return matrixs
    reducedColorImg(i,:,2) = img_row_ch2; 
    reducedColorImg(i,:,3) = img_row_ch3; 
    reducedEnergyImg(i,:) = energy_row;
end
reducedColorImg = uint8(reducedColorImg);