%-----------------------------------------------------------------------------------
% Analisis de error entre funcion lsode y resolucion con Euler Hacia Adelante
%-----------------------------------------------------------------------------------

1;

%%-------------------------- Codigo de lsode: ---------------------------------------

function xdot = f (x, t)

  xdot = zeros (4,1);

  xdot(1) = x(3);
  xdot(2) = x(4);
  xdot(3) = (-2*x(2)*x(3)*x(4))/(x(1)^2 + x(2)^2 +1);
  xdot(4) = (-2*x(1)*x(3)*x(4))/(x(1)^2 + x(2)^2 +1);

endfunction

t = linspace(0,100,100);

y = lsode("f",[ 0; 0; 0.01; 0.01],t);

% Vectores u y v obtenidos con funcion lsode:
uls = y(:,1);
vls = y(:,2);


%%------------------ Codigo de Euler Hacia Adelante: ---------------------------------

% Intervalo de la funcion
au = 0 ;
bu = 100 ;
av = 0 ;
bv = 100 ;

% Cantidad de subintervalos
N = 100 ;

%Defino el largo de los intervalos
hu = ( bu - au ) / N ;
hv = ( bv - av ) / N ;

% Defino vectores para los valores funcionales de u,v,p y q
uEu = zeros(1,N+1) ;
vEu = zeros(1,N+1) ;
p = zeros(1,N+1) ;  
q = zeros(1,N+1) ;

% Asigno condiciones iniciales
uEu(1) = 0 ;
vEu(1) = 0 ;
p(1) = 0.01 ;
q(1) = 0.01 ;

for i = 1 : N
  uEu(i+1) = uEu(i) + hu*p(i) ;
  vEu(i+1) = vEu(i) + hv*q(i) ;
  p(i+1) = p(i) + hu*(-2)*vEu(i)*p(i)*q(i)/((uEu(i))^2+(vEu(i))^2+1) ;
  q(i+1) = q(i) + hv*(-2)*uEu(i)*p(i)*q(i)/((uEu(i))^2+(vEu(i))^2+1) ;
end;


% ------------- Calculo de error entre ambos metodos: ----------------------------------

error=zeros(1,N);
for i= 1 : N
  error(i)=(((uls(i)-uEu(i+1))^2+(vls(i)-vEu(i+1))^2)^(0.5))/(((uls(i))^2+(vls(i))^2)^(0.5));
end;
k=1:1:100;
plot(k,error,"b")