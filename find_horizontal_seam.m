function horizontalSeam = find_horizontal_seam(cumulativeEnergyMap)
[rowNum,colNum] = size(cumulativeEnergyMap);
[~,rowInd] = min(cumulativeEnergyMap(:,end));  % find the minimum pixel in the last coulmn and its row index
horizontalSeam = zeros(1,colNum);   % intialize the horizontal seam
horizontalSeam(1,colNum) = rowInd;   % the row index for last column

s1 = Inf;
s2 = Inf;
s3 = Inf;

for i=colNum:-1:2
    if rowInd - 1 > 0
        s1 = cumulativeEnergyMap(rowInd - 1, i-1);  % left up
    end
    if rowInd + 1 <= rowNum
        s2 = cumulativeEnergyMap(rowInd + 1, i-1);   % left down
    end
    
    s3 = cumulativeEnergyMap(rowInd, i-1);     % left middle
    
    if s1 < min(s2, s3)
        rowInd = rowInd - 1;
        horizontalSeam(1, i - 1) = rowInd;
    elseif s2 < min(s1, s3)
        rowInd = rowInd + 1;
        horizontalSeam(1, i - 1) = rowInd;
    else
        horizontalSeam(1, i - 1) = rowInd;
    end
    
    
    s1 = Inf;
    s2 = Inf;
    s3 = Inf;
end

