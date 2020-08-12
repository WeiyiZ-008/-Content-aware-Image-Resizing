function verticalSeam = greedy_find_veertical_seam(energyImg)
[rowNum,colNum] = size(energyImg);

%find the minimum in first row
[~,cur_ind] = min(energyImg(1,:));
verticalSeam = zeros(1,rowNum);   % intialize the vertical seam
verticalSeam(1,1) = cur_ind;   % the column index for first row

s1 = Inf;
s2 = Inf;
s3 = Inf;
    
for i=2:rowNum
    if cur_ind - 1 > 0
        s1 = energyImg(i, cur_ind - 1);
    end
    if cur_ind + 1 <= colNum
        s2 = energyImg(i, cur_ind + 1);
    end
    
    s3 = energyImg(i, cur_ind);
    
    if s1 < min(s2, s3)
        cur_ind = cur_ind - 1;
        verticalSeam(1, i) = cur_ind;
    elseif s2 < min(s1, s3)
        cur_ind = cur_ind + 1;
        verticalSeam(1, i) = cur_ind;
    else
        verticalSeam(1, i) = cur_ind;
    end
    
    s1 = Inf;
    s2 = Inf;
    s3 = Inf;
    
    
end
