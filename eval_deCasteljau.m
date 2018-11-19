function [Bezier_curve_points]= eval_deCasteljau(matrice,a,b,resolution)

n=size(matrice,2)-1 % degre de courbe avec n+1 points de controle
%temps=1:resolution;
temps= a : ((b-a)/resolution) : b;
cp = 0;
for t=temps
   % Calcul du point de la courbe x(t) avec l'algorithme de DeCasteljau






end                  
