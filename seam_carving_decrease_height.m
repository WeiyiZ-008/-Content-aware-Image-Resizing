prague = imread('inputSeamCarvingPrague.jpg');
energyImg = energy_img(prague);

for i=1:50
    [prague,energyImg] = decrease_height(prague,energyImg);
end

imwrite(prague, 'outputReduceHeightPrague.png');
imagesc(prague);




% second picture

mall = imread('inputSeamCarvingMall.jpg');
energyImg = energy_img(mall);

for i=1:50
    [mall,energyImg] = decrease_height(mall,energyImg);
end

imwrite(mall, 'outputReduceHeightMall.png');
imagesc(mall);


