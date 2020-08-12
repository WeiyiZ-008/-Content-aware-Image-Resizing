% compute the gradient magnituede
function energyImg  = energy_img(img)
img_gray = rgb2gray(img);
[x,y] = imgradientxy(img_gray);   % compute the x and y-directional gradienst
[energyImg ,~] = imgradient(x,y);
