% 315CA Dinu Ion-Irinel
function out = bilinear_resize_RGB (img, p, q)
    % =============================================== =======================
    % Resize image img a.i. it should be of size p x q.
    % The img image is colored.
    % Basically, it calls the bilinear function 3 times on each channel of the image.
    % =============================================== =======================

    % extraction of the red channel of the image
    red_channel = img (:,:, 1);
    % extract the green channel of the image
    green_channel = img (:,:, 2);
    % extract the blue channel of the image
    blue_channel = img (:,:, 3);

    % application of the bilinear_resize function for each channel of the image
    red_matrix = bilinear_resize (red_channel, p, q);
    green_matrix = bilinear_resize (green_channel, p, q);
    blue_matrix = bilinear_resize (blue_channel, p, q);
    size = 3;
    % formation of the final image with the 3 color channels
    out = cat (size, red_matrix, green_matrix, blue_matrix);

endfunction
