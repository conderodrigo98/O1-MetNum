% Script que crea graficos png y los guarda en Output - supName

currdir = pwd ;
plotfontsize = 22 ;

auxu = [1 0 1] ;

n = pi/12 ;

for k = 0:n:24*n

[tx,ty,tz]=sphere(20) ;

figdef = figure ;

hold on


mesh (tx, ty, tz) 

plot3(cos(u).*cos(v),sin(u).*cos(v),sin(v),'k')

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

