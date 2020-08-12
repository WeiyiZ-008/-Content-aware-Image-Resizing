function view_seam(im,seam,seamDirection)
imagesc(im);
hold on;
if(strcmp(seamDirection, 'HORIZONTAL'))     % horizontal seam
    plot(seam,'Color','r');
else                  % vertical seam
    [~,numRow] = size(seam);
    plot(seam(1,:),(1:numRow),'Color','r');
end
hold off;
