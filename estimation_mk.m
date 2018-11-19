function [matrice_mk]= estimation_mk(matrice_pk, c)

n = size(matrice_pk, 2) -1; % le nombre de points de contrôle - 1
matrice_mk=0; 
for i = 1:n
    matrice_mk(1, i) = (1-c)*(matrice_pk(1, i+1)  - matrice_pk(1, i)/(i+1-i))      %i+1-i sont les u_{i+1} - u_i
    matrice_mk(2, i) = (1-c)*(matrice_pk(2, i+1)  - matrice_pk(2, i)/(i+1-i))     %i+1-i sont les u_{i+1} - u_i

end
%il faut rajouter la dernière tangente 
matrice_mk(1, n+1) = -(1-c)*(matrice_pk(1, n+1)  - matrice_pk(1, n)/(i+1-i))      %il faut rajouter un signe négatif pour changer le sens
matrice_mk(2, n+1) = -(1-c)*(matrice_pk(2, n+1)  - matrice_pk(2, n)/(i+1-i))     %il faut rajouter un signe négatif pour changer le sens