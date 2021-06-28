% 315CA Dinu Ion-Irinel
function out = nn_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================
    
    % extragerea canalului rosu al imaginii
    red_channel = img(:, :, 1);
    % extragerea canalului verde al imaginii
    green_channel = img(:, :, 2); 
    % extragerea canalului albastru al imaginii
    blue_channel = img(:, :, 3); 

    % aplicarea functiei nn_resize pentru fiecare canal al imaginii
    red_matrix = nn_resize(red_channel, p, q);
    green_matrix = nn_resize(green_channel, p, q);
    blue_matrix = nn_resize(blue_channel, p, q);
    size = 3;
    % formarea imaginii finale cu cele 3 canale de culori
    out = cat(size, red_matrix, green_matrix, blue_matrix);
    
endfunction
