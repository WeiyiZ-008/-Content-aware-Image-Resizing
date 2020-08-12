prague = imread('inputSeamCarvingPrague.jpg');
energyImg = energy_img(prague);

for i=1:100
    [prague,energyImg] = decrease_width(prague,energyImg);
    energyImg = energy_img(prague);
end

imwrite(prague, 'outputReduceWidthPrague.png');
imagesc(prague);



second picture

mall = imread('inputSeamCarvingMall.jpg');
energyImg = energy_img(mall);

for i=1:100
    [mall,energyImg] = decrease_width(mall,energyImg);
    energyImg = energy_img(mall);
end

imwrite(mall, 'outputReduceWidthMall.png');
imagesc(mall);
