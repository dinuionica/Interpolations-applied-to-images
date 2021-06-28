% 315CA Dinu Ion-Irinel
function R = bilinear_rotate(I, rotation_angle)
    % =========================================================================
    % Rotirea imaginii alb-negru I de dimensiune m x n cu unghiul
    % rotation_angle, aplicand interpolare biliniara.
    % rotation_angle este exprimat in radiani.
    % =========================================================================

    [m n nr_colors] = size(I);

    % cast I la double
    I = double(I);
    % daca imaginea e alb negru, o ignoram
    if nr_colors > 1
        R = - 1;
        return
    endif

    % calculare cos si sin de rotation_angle
    cos_angle = cos(rotation_angle);
    sin_angle = sin(rotation_angle);
    % initializare matric finala plina de zerouri
    matrix = zeros(m, n);
    % determinare matrice de transformare
    T = [cos_angle, -sin_angle; sin_angle, cos_angle];
    % calculare matrice inversa a transformarii
    T_INV = inv(T);

    % parcurgerea fiecarui pixel din imagine
    for y = 0 : m - 1
        for x = 0 : n - 1
            % determinare x_p si y_p din spatiul imaginii initiale
            point = T_INV * [x; y];
            x_p = point(1);
            y_p = point(2);
            % trecea (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p = x_p + 1;
            y_p = y_p + 1;
            % daca x_p sau y_p se afla in afara imaginii punem un pixel negru
            if y_p > m || y_p < 1 || x_p > n || x_p < 1
                matrix(y + 1, x + 1) = 0;
                continue;
            endif
        
            % determinarea punctelor ce inconjoara punctul (xp, yp)
            [x1 y1 x2 y2] = surrounding_points(n, m, x_p, y_p);
        
            % calcularea coeficientiilor de interplare a
            coef = bilinear_coef(I, x1, y1, x2, y2);
            
            %calcularea valoarii interpolata a pixelului (x, y)
            matrix(y + 1, x + 1) = coef(1) + coef(2) * x_p + coef(3) * y_p + coef(4) * x_p * y_p;
            
        endfor
    endfor

    % convertire matrice rezultat la uint8
    matrix = uint8(matrix);
    R = matrix;

endfunction