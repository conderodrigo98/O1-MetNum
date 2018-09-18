% Script que crea graficos png y los guarda en Output - supName

currdir = pwd ;
plotfontsize = 22 ;

auxu = [1 0 1] ;

n = pi/12 ;

for k = 0:n:24*n

% Malla
tx = ty = linspace (-1, 1,50)' ;
[xx, yy] = meshgrid (tx, ty) ;
tz = xx.*yy ;


figdef = figure ;

hold on


mesh (tx, ty, tz) 

plot3(u,v,u.*v,'k')

axis equal, grid on

R = [ cos(k) -sin(k) 0 ; ...
      sin(k)  cos(k) 0 ; ...
      0           0          1 ] ;

aux = auxu*R ;
view(aux) ;

title(['Grafica - Angulo ' sprintf('%4i', k*180/pi) ] );
labx=xlabel('u'); laby=ylabel('v'); labz=zlabel('z') ;
set(gca, 'linewidth', 1.2, 'fontsize', plotfontsize )
set(labx, "FontSize", plotfontsize); set(laby, "FontSize", plotfontsize) ;

cd(outputdir )
print( [ supName '_grafica_angulo_' sprintf('%i', k*180/pi)] ,'-dpng') ;
cd(currdir)

  if printflag == 0  
    close(figdef) ;
  end

end

