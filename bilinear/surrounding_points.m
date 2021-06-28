% 315CA Dinu Ion-Irinel
function [x1 y1 x2 y2] = surrounding_points(n, m, x, y)
    % =========================================================================
    % Calcularea celor 4 puncte ce contin in interior (x, y)
    % Primeste si dimensiunea unei imagini m x n, pentru a asigura ca nu se
    % iese din matrice.
    % =========================================================================
    
    % calculare x1, y1, x2, y2
    x1 = floor(x);
    x2 = floor(x) + 1;
    y1 = floor(y);
    y2 = floor(y) + 1;

    % daca y1 se afla pe ultima linie y2 nu trebuie sa iasa din matrice
    if y1 == m 
      y1 = y1 - 1;
      y2 = y2 - 1;
    endif
    % daca x1 se afla pe ultima coloana x2 nu trebuie sa iasa din matrice
    if x1 == n 
      x1 = x1 - 1;
      x2 = x2 - 1;
    endif
endfunction