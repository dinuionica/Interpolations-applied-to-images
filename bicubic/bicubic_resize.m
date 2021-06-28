% 315CA Dinu Ion-Irinel
function R = bicubic_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare bicubica
    % Transforma imaginea I din dimensiune m x n in dimensiune p x q
    % =========================================================================

    [m n nr_colors] = size(I);

    % cast la double pentru I
    I = double(I);
    % initializare matricea finala
    R = zeros(p, q);

    % daca imaginea e alb negru, o ignoram
    if nr_colors > 1
        R = -1;
        return
    endif
    % determinarea factorilor de scalare
    s_x = (q - 1) / (n - 1);
    s_y = (p - 1) / (m - 1);

    % definirea matricei de transformare pentru redimensionare
    T = [s_x 0; 0 s_y];
    % calculare matrice inversa a transformarii
    T_INV = [1 / s_x, 0; 0, 1 /s_y];
    
    % determinare matrici de derivare
     [Ix Iy Ixy] = precalc_d(I);

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
            % determinarea punctelor ce inconjoara punctul (xp, yp)
            [x1 y1 x2 y2] = surrounding_points(n, m, x_p, y_p);

            % calculare coeficienti de interpolare A
            A = bicubic_coef(I, Ix, Iy, Ixy, x1, y1, x2, y2);
            % trecerea coordonatelor (xp, yp) in patratul unitate
            x_p = x_p - x1;
            y_p = y_p - y1;
            %calcularea valoarii interpolata a pixelului (x, y)
            R(y + 1, x + 1) = [1 x_p x_p^2 x_p^3] * A * [1 y_p y_p^2 y_p^3]';
        endfor
    endfor

    % convertire matrice rezultat la uint8
    R = uint8(R);
endfunction
