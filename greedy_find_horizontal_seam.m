function horizontalSeam = greedy_find_horizontal_seam(energyImg)
[rowNum,colNum] = size(energyImg);

%find the minimum in first column
[~,cur_row] = min(energyImg(:,1));
horizontalSeam = zeros(1,colNum);   % intialize the vertical seam
horizontalSeam(1,1) = cur_row;   % the column index for first row

s1 = Inf;
s2 = Inf;
s3 = Inf;
    
for i=2:colNum
    if cur_row - 1 > 0
        s1 = energyImg(cur_row - 1, i);
    end
    if cur_row + 1 <= rowNum
        s2 = energyImg( cur_row + 1, i);
    end
    
    s3 = energyImg(cur_row, i);
    
    if s1 < min(s2, s3)
        cur_row = cur_row - 1;
        horizontalSeam(1, i) = cur_row;
    elseif s2 < min(s1, s3)
        cur_row = cur_row + 1;
        horizontalSeam(1, i) = cur_row;
    else
        horizontalSeam(1, i) = cur_row;
    end
    
    s1 = Inf;
    s2 = Inf;
    s3 = Inf;
    
    
end