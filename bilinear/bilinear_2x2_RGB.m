% 315CA Dinu Ion-Irinel
function out = bilinear_2x2_RGB (img, STEP = 0.1)
    % =============================================== =======================
    % Apply bilinear interpolation to the 2x2 img image with intermediate points
    % equidistant, specifying that img is a RGB color image.
    % f has known values ​​in points (1, 1), (1, 2), (2, 1) and (2, 2).
    % Basically, calls bilinear_2x2_interpolation on each channel of the image
    % img and reconstructs the colored image at the end
    % Parameters:
    % - img = 2x2 RGB image that wants to be interpolated
    % - STEP = distance between two successive points
    % =============================================== =======================

    % extraction of the red channel of the image
    red_channel = img (:,:, 1);
    % extract the green channel of the image
    green_channel = img (:,:, 2);
    % extract the blue channel of the image
    blue_channel = img (:,:, 3);

    % application of the bilinear_2x2 function for each image channel
    red_matrix = bilinear_2x2 (red_channel, STEP);
    green_matrix = bilinear_2x2 (green_channel, STEP);
    blue_matrix = bilinear_2x2 (blue_channel, STEP);
    size = 3;
    % formation of the final image with the 3 color channels
    out = cat (size, red_matrix, green_matrix, blue_matrix);
    
endfunction
