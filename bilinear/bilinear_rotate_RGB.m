% 315CA Dinu Ion-Irinel
function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
   % extragerea canalului rosu al imaginii
    red_channel = img(:, :, 1);
    % extragerea canalului verde al imaginii
    green_channel = img(:, :, 2); 
    % extragerea canalului albastru al imaginii
    blue_channel = img(:, :, 3); 

    % aplicarea functiei bilinear_rotate pentru fiecare canal al imaginii
    red_matrix = bilinear_rotate(red_channel, rotation_angle);
    green_matrix = bilinear_rotate(green_channel, rotation_angle);
    blue_matrix = bilinear_rotate(blue_channel, rotation_angle);
    size = 3;
    % formarea imaginii finale cu cele 3 canale de culori
    out = cat(size, red_matrix, green_matrix, blue_matrix);

endfunction