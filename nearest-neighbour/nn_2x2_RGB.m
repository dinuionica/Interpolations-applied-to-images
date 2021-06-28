% 315CA Dinu Ion-Irinel
function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB.
    % =========================================================================
    
    % extragerea canalului rosu al imaginii
    red_channel = img(:, :, 1);
    % extragerea canalului verde al imaginii
    green_channel = img(:, :, 2); 
    % extragerea canalului albastru al imaginii
    blue_channel = img(:, :, 3); 

    % aplicarea functiei nn_2x2 pentru fiecare canal al imaginii
    red_matrix = nn_2x2(red_channel, STEP);
    green_matrix = nn_2x2(green_channel, STEP);
    blue_matrix = nn_2x2(blue_channel, STEP);
    size = 3;
    % formarea imaginii finale cu cele 3 canale de culori
    out = cat(size,red_matrix,green_matrix,blue_matrix);
    
endfunction
