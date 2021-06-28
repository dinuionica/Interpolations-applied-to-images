% 315CA Dinu Ion-Irinel
function out = bilinear_rotate_RGB (img, rotation_angle)
     % =============================================== =======================
     % Apply bilinear interpolation to rotate an RGB image at a given angle.
     % =============================================== =======================
    
    % extraction of the red channel of the image
     red_channel = img (:,:, 1);
     % extract the green channel of the image
     green_channel = img (:,:, 2);
     % extract the blue channel of the image
     blue_channel = img (:,:, 3);

     % application of the bilinear_rotated function for each channel of the image
     red_matrix = bilinear_rotate (red_channel, rotation_angle);
     green_matrix = bilinear_rotate (green_channel, rotation_angle);
     blue_matrix = bilinear_rotate (blue_channel, rotation_angle);
     size = 3;
     % formation of the final image with the 3 color channels
     out = cat (size, red_matrix, green_matrix, blue_matrix);

endfunction
