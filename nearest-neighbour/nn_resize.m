% 315CA Dinu Ion-Irinel
function R = nn_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare nearest-neighbour
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================
    
    [m n nr_colors] = size(I);

    % convertirea imaginii de intrare la alb-negru daca este cazul
    if nr_colors > 1
        R = -1;
        return
    endif
    
    % cast la double pentru I
    I = double(I);
    % initiliazare matrice finala
    R = zeros(p, q);
    % determinarea factorilor de scalare
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);
   
    % definirea matricei de transformare pentru redimensionare
    T = [s_x, 0; 0, s_y];
    % calculare matrice inversa a transformarii
    T_INV = [1 / s_x, 0; 0, 1 /s_y];
    
    % parcurgerea fiecareui pixel din imagine
    for y = 0 : p - 1
        for x = 0 : q - 1
          % determinare x_p si y_p din spatiul imaginii initiale
            point = T_INV * [x; y];
            x_p = point(1);
            y_p = point(2);
            % trecea (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p = x_p + 1;
            y_p = y_p + 1;
            % calcularea celui mai apropiat vecin folosind functia round
            x_f = round([x_p]);
            y_f = round([y_p]);
            % calcularea valoarii pixelului din imaginea finala
            R(y + 1, x + 1) = I(y_f, x_f);
        endfor
    endfor
    % convertire matrice rezultat la uint8
    R = uint8(R);

endfunction