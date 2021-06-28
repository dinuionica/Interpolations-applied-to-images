% 315CA Dinu Ion-Irinel
function r = fx(f, x, y)
    % =========================================================================
    % Aproximarea derivatei fata de x a lui f in punctul (x, y).
    % =========================================================================

    % daca x se afla pe marginea imaginii derivata este considerata 0
    [m n] = size(f);
    if x == 1 || x == n
        r = 0;
    else
        % altfel calculam derivata folosind formula specifica
        f_x = (f(y,x + 1) - f(y,x - 1)) / 2;
        r = f_x;
    endif

endfunction