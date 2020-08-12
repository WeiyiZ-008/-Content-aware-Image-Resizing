function verticalSeam = find_vertical_seam(cumulativeEnergyMap)
[rowNum,colNum] = size(cumulativeEnergyMap);
[~,colInd] = min(cumulativeEnergyMap(end,:));  % find the minimum pixel in the last row and its index
verticalSeam = zeros(1,rowNum);   % intialize the vertical seam
verticalSeam(1,rowNum) = colInd;   % the column index for last row

s1 = Inf;
s2 = Inf;
s3 = Inf;

for i=rowNum:-1:2
    if colInd - 1 > 0
        s1 = cumulativeEnergyMap(i - 1, colInd - 1);
    end
    if colInd + 1 <= colNum
        s2 = cumulativeEnergyMap(i - 1, colInd + 1);
    end
    
    s3 = cumulativeEnergyMap(i - 1, colInd);
    
    if s1 < min(s2, s3)
        colInd = colInd - 1;
        verticalSeam(1, i - 1) = colInd;
    elseif s2 < min(s1, s3)
        colInd = colInd + 1;
        verticalSeam(1, i - 1) = colInd;
    else
        verticalSeam(1, i - 1) = colInd;
    end
    
    s1 = Inf;
    s2 = Inf;
    s3 = Inf;
end