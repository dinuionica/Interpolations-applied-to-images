% 315CA Dinu Ion-Irinel
function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prelucrarea matricilor Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    
    % determinare dimensiuni imaginii
    [m n] = size(I);
    
    % convertire matrice I la double
      I = double(I);
    % parcurgerea fiecarui pixel din imagine
      for y = 1 : m
        for x = 1 : n
          % determinare matrice cu derivate fata de x Ix
          Ix(y,x) = fx(I, x, y);
          % determinare matrice cu derivate fata de y Iy
          Iy(y,x) = fy(I, x, y);
          % determinare matrice cu derivate fata de xy Ixy
          Ixy(y,x) = fxy(I, x, y);

        endfor
      endfor
      
endfunction

