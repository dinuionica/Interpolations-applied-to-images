% 315CA Dinu Ion-Irinel
function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 img cu puncte intermediare
    % echidistante, cu precizarea ca img este o imagine colorata RGB.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Practic, apeleaza bilinear_2x2_interpolation pe fiecare canal al imaginii
    % img si reconstruieste imaginea colorata la final
    % Parametrii:
    % - img = imaginea 2x2 RGB care doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================

    % extragerea canalului rosu al imaginii
    red_channel = img(:, :, 1);
    % extragerea canalului verde al imaginii
    green_channel = img(:, :, 2); 
    % extragerea canalului albastru al imaginii
    blue_channel = img(:, :, 3); 

    % aplicarea functiei bilinear_2x2 pentru fiecare canal al imaginii
    red_matrix = bilinear_2x2(red_channel, STEP);
    green_matrix = bilinear_2x2(green_channel, STEP);
    blue_matrix = bilinear_2x2(blue_channel, STEP);
    size = 3;
    % formarea imaginii finale cu cele 3 canale de culori
    out = cat(size,red_matrix,green_matrix,blue_matrix);
    
endfunction