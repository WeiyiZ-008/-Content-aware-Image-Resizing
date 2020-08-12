% This function is designed for part 2 problem 6 that we used to test our
% second selected images.

function output = part2_p6_img2()
    img = imread('part2_p6_image2.png');
    inputImg = img;
    energyImg = energy_img(img);
    
    for i=1:150
        [img,energyImg] = decrease_height(img,energyImg);
    end
    
    simpleResizedImg = imresize(inputImg,[480 538]);
    output = img;
    
    subplot(3,2,1)
    imagesc(inputImg)
    title('Orinigal Input Image')

    subplot(3,2,2)
    imagesc(img)
    title("System's Resized Image")
    
    subplot(3,2,3)
    imagesc(simpleResizedImg)
    title("Simple Resized Image")
end