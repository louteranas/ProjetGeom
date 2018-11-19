function [splines]= calcul_splines(matrice_pk, matrice_mk)

splines = 0
temps = 0:10
N = size(matrice_pk, 2) - 1

for i = 0:N %on traverse toutes les splines
    for t = temps %on calcul plusieurs points pour chaque spline
        splines(i, t, 1) = 0
        for n = 0:3  %calcul des coefs de bernstein
            if n == 0
                splines(i, t, 1) = splines(i, t, 1) + matrice_pk(i, 1) * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
                splines(i, t, 2) = splines(i, t, 2) + matrice_pk(i, 2) * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
            end
            elseif n == 1 
                splines(i, t, 1) = splines(i, t, 1) + [matrice_pk(i, 1) + matrice_mk(i, 1)/3] * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
                splines(i, t, 2) = splines(i, t, 2) + [matrice_pk(i, 2) + matrice_mk(i, 2)/3] * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
            end
            elseif n == 2 
                splines(i, t, 1) = splines(i, t, 1) + [matrice_pk(i+1, 1) - matrice_mk(i+1, 1)/3] * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
                splines(i, t, 2) = splines(i, t, 2) + [matrice_pk(i+1, 2) - matrice_mk(i+1, 1)/3] * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)           
            end
            elseif n == 3 
                splines(i, t, 1) = splines(i, t, 1) + matrice_pk(i+1, 1) * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
                splines(i, t, 2) = splines(i, t, 2) + matrice_pk(i+1, 2) * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
            end
        end
    end
end