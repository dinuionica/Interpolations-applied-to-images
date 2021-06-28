% 315CA Dinu Ion-Irinel
function out = bicubic_resize_RGB (img, p, q)
    % =============================================== =======================
    % Resize image img a.i. it should be of size p x q.
    % The img image is colored.
    % Basically, it calls the bicubic_resize function 3 times on each channel of the image.
    % =============================================== =======================


    % extraction of the red channel of the image
    red_channel = img (:,:, 1);
    % extract the green channel of the image
    green_channel = img (:,:, 2);
    % extract the blue channel of the image
    blue_channel = img (:,:, 3);

    % application of the bicubic_resize function for each image channel
    red_matrix = bicubic_resize (red_channel, p, q);
    green_matrix = bicubic_resize (green_channel, p, q);
    blue_matrix = bicubic_resize (blue_channel, p, q);
    size = 3;
    % formation of the final image with the 3 color channels
    out = cat (size, red_matrix, green_matrix, blue_matrix);

endfunction
