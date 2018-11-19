function [splines]= calcul_splines(matrice_pk, matrice_mk)

temps = 1:10;
N = size(matrice_pk, 2) - 1;
splines = 0

for i = 1:N %on traverse toutes les splines
        for n = 0:3  %calcul des coefs de bernstein
            if n == 0
                splines(i, 1) = matrice_pk(1, i);
                splines(i, 2) = matrice_pk(2, i);
            
            elseif n == 1 
                splines(i, 1) = [matrice_pk(1, i) + matrice_mk(1, i)/3];
                splines(i, 2) = [matrice_pk(2, i) + matrice_mk(2, i)/3];
            
            elseif n == 2 
                splines(i, 1) = [matrice_pk(1, i+1) - matrice_mk(1, i+1)/3];
                splines(i, 2) = [matrice_pk(2, i+1) - matrice_mk(2, i+1)/3];           
            
            elseif n == 3 
                splines(i, 1) = matrice_pk(1, i+1);
                splines(i, 2) = matrice_pk(2, i+1);
            end
        end
    end
end