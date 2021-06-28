% 315CA Dinu Ion-Irinel
function out = nn_2x2_RGB (img, STEP = 0.1)
     % ======================================================================
     % Apply nearest neighbor interpolation to the 2x2 img dotted image
     % equidistant intermediate.
     % img is a RGB color image.
     % ======================================================================
    
     % extraction of the red channel of the image
     red_channel = img (:,:, 1);
     % extract the green channel of the image
     green_channel = img (:,:, 2);
     % extract the blue channel of the image
     blue_channel = img (:,:, 3);

     % application of the nn_2x2 function for each image channel
     red_matrix = nn_2x2 (red_channel, STEP);
     green_matrix = nn_2x2 (green_channel, STEP);
     blue_matrix = nn_2x2 (blue_channel, STEP);
     size = 3;
     % formation of the final image with the 3 color channels
     out = cat (size, red_matrix, green_matrix, blue_matrix);
    
endfunction
