function []= Courbe_de_bezier()

resolution=21;       % nombre de points evalues sur la courbe de Bezier
a=2;b=4;	     % domaine des parametres
K=0;                 % variable d'etat
matrice_pk=0;           % ensemble des points de controle
matrice_mk=0;           % ensemble des tangentes
c = 0;                  % choix du paramètre c
N = 0;                  % borne supérieure de l'intervalle

while K~=5 % arréter
   K=menu('Que voulez-vous faire ?','NEW   (bouton souris, puis <ENTER>', 'AJOUTER UN POINT','CHANGER LA VALEUR DU PARAMETRE C','SUPPRIMER UN POINT','ARRETER')
   if K==1 % NEW

      clf                  % affichage d'une fenetre vide
      hold on              % tous les plot seront ex�cut�s sur cette meme fenetre
      axis([0 10 0 10])    % les axes sont definitivement fixes
      %axis off
      matrice_pk=0;
      matrice_mk=0;
      for i=1:1000         % on limite le nombre de points de controle � 1000
         [X,Y]=ginput(1);  % prise en compte d'un clic de souris
         if isempty(X)     % si on appuie sur <ENTER>
            break
         end 
         matrice_pk(1,i)=X;   % coordonnees x des points de controle
         matrice_pk(2,i)=Y;   % coordonnees y des points de controle
	 plot(matrice_pk(1,i),matrice_pk(2,i),'o') % affichage du point de controle i
         plot(matrice_pk(1,:),matrice_pk(2,:),'b') % affichage du polygone de controle
      end


      prompt = {'Saisir une valeur du paramètre c:')
      title = 'Input'
      dims = [1 20];
      definput = {'20','hsv'};
      answer = inputdlg(prompt,title,dims,definput);

      %estimation des tangentes
      matrice_mk = estimation_mk(matrice_pk, c);
      %Tracé des splines
      splines = calcul_splines(matrice_pk, matrice_mk);

   elseif K==2 % ajouter un point
      [X,Y]=ginput(1);
      while ~isempty(X)
         n=size(matrice_pk,2);
         matrice_pk(1,n+1)=X;
         matrice_pk(2,n+1)=Y;  
         clf                  % affichage d'une fenetre vide
         hold on              % tous les plot seront executes sur cette meme fenetre
         axis([0 10 0 10])    % les axes sont definitivement fixes
         %axis off
	 for k=1:n+1 % affichage du polygone de controle
	   plot(matrice_pk(1,k), matrice_pk(2,k),'o') % affichage du point de controle k
	 end
         plot(matrice_pk(1,:),matrice_pk(2,:),'b') % affichage du polygone de controle
         position = 0; % il faut changer tout ca, car on rajoute un point, on ne change pas un autre
         spline = calcul_spline_unitaire(matrice_pk, matrice_mk, matrice_splines, position) ;
      	 plot(Bezier_curve_points(1,:),Bezier_curve_points(2,:),'r', 'linewidth',2);
         [X,Y]=ginput(1);
      end

   elseif K==3 % changer le parametre c
      prompt = {'Saisir une nouvelle valeur du paramètre c:')
      title = 'Input'
      dims = [1 20];
      definput = {'20','hsv'};
      answer = inputdlg(prompt,title,dims,definput)
      %ré-estimation des tangentes
      matrice_mk = estimation_mk(matrice_pk, c);
   end

   elseif K==4 % supprimer un point 
      [X,Y]=ginput(1);
      while ~isempty(X)
         if size(matrice_pk,2)==1
            break
         end
         matrice_pk=supprimer_point(matrice_pk,X,Y);
         n=size(matrice_pk,2);
         clf                  % affichage d'une fenetre vide
         hold on              % tous les plot seront executes sur cette meme fenetre
         axis([0 10 0 10])    % les axes sont definitivement fixes
         %axis off
	 for k=1:n 
	   plot(matrice_pk(1,k), matrice_pk(2,k),'o') % affichage du point de controle k
         end
         plot(matrice_pk(1,:),matrice_pk(2,:),'b') % affichage du polygone de controle
         Bezier_curve_points = eval_bernstein(matrice_pk,a,b,resolution) ;
      	 plot(Bezier_curve_points(1,:),Bezier_curve_points(2,:),'r', 'linewidth',2);
         [X,Y]=ginput(1);
      end
   end
end
close
