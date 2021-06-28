% 315CA Dinu Ion-Irinel
function r = fxy(f, x, y)
    % =========================================================================
    % Aproximarea derivatei fata de x si y a lui f in punctul (x, y).
    % =========================================================================
     
    % daca x sau y se afla pe marginea imaginii derivata este considerata 0
    [m n] = size(f);
    if x == 1 || x == n || y == 1 || y == m
        r = 0;
    else
        % altfel calculam derivata folosind formula specifica
        f_xy = (f(y - 1, x - 1) + f(y + 1, x + 1) - f(y - 1, x + 1) - f(y + 1,x - 1)) / 4;
        r = f_xy;
    endif
   
endfunction