% This function is designed for part 2 problem 6 that we used to test our
% third selected images.

function output = part2_p6_img3()
    img = imread('part2_p6_image3.png');
    inputImg = img;
    energyImg = energy_img(img);

    for i=1:135
        [img,energyImg] = decrease_width(img,energyImg);
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