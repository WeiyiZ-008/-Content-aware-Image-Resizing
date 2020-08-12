prague = imread('inputSeamCarvingPrague.jpg');
energyImg = energy_img(prague);
cum_ver = cumulative_min_energy_map(energyImg,'VERTICAL');
cum_hor = cumulative_min_energy_map(energyImg,'HORIZONTAL');
seam_hor = find_horizontal_seam(cum_hor);
seam_ver = find_vertical_seam(cum_ver);

greedy_seam_hor = greedy_find_horizontal_seam(energyImg);
%view_seam(prague,seam_hor,'HORIZONTAL');
%view_seam(prague,seam_hor,'HORIZONTAL');
view_seam(prague,greedy_seam_hor,'HORIZONTAL');


% % dp programming 
% for i=1:100
%     [prague,energyImg] = decrease_height(prague,energyImg);
% end
% 
% %imwrite(prague, 'outputReduceWidthPrague.png');
% imagesc(prague);
