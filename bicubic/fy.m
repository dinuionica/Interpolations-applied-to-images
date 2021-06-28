% 315CA Dinu Ion-Irinel
function r = fy(f, x, y)
    % =========================================================================
    % Aproximarea derivatei fata de y a lui f in punctul (x, y).
    % =========================================================================

    % daca y se afla pe marginea imaginii derivata este considerata 0
    [m n] = size(f);
    if y == 1 || y == m 
        r = 0;
    else
        % altfel calculam derivata folosind formula specifica
        f_y = (f(y + 1,x) - f(y - 1,x)) / 2;
        r = f_y;
    endif

endfunction