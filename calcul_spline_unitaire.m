function [spline]= calcul_spline_unitaire(matrice_pk, matrice_mk, matrice_splines, position)

spline = 0
temps = 0:10

for t = temps %on calcul plusieurs points pour chaque spline
    spline = 0
    for n = 0:3  %calcul des coefs de bernstein
        if n == 0
            spline(t, 1) = spline(t, 1) + matrice_pk(i, 1) * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
            spline(t, 2) = spline(t, 2) + matrice_pk(i, 2) * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
        end
        elseif n == 1 
            spline(t, 1) = spline(t, 1) + [matrice_pk(i, 1) + matrice_mk(i, 1)/3] * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
            spline(t, 2) = spline(t, 2) + [matrice_pk(i, 2) + matrice_mk(i, 2)/3] * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
        end
        elseif n == 2 
            spline(t, 1) = spline(t, 1) + [matrice_pk(i+1, 1) - matrice_mk(i+1, 1)/3] * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
            spline(t, 2) = spline(t, 2) + [matrice_pk(i+1, 2) - matrice_mk(i+1, 1)/3] * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)           
        end
        elseif n == 3 
            spline(t, 1) = spline(t, 1) + matrice_pk(i+1, 1) * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
            spline(t, 2) = spline(t, 2) + matrice_pk(i+1, 2) * ((factorial(n)/(factorial(i)*factorial(n-i))) (t/10)^i  * (1-(t/10))^(n-i)
        end
    end
    matrice_splines(position, t, 1) = spline(t, 1)
    matrice_splines(position, t, 2) = spline(t, 2)
end

