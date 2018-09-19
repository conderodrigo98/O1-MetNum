%------------------------------------------------------------------------------------------
% Analisis de error entre resolucion con Euler Hacia Adelante y metodo del Punto Medio
%------------------------------------------------------------------------------------------



%------------------------- Codigo de Punto Medio: -----------------------------------------

N = 100;
h = 100/N;
uPM = zeros(1,N+1);
vPM = zeros(1,N+1);
pPM = zeros(1,N+1);
qPM = zeros(1,N+1);
uPM(1) = 0;
vPM(1) = 0;
pPM(1) = 0.01;
qPM(1) = 0.01;
% definicion paso 1:
uPM(2) = uPM(1) + h*pPM(1);
vPM(2) = vPM(1) + h*qPM(1);
pPM(2) = pPM(1) + h*(-2)*vPM(1)*pPM(1)*qPM(1)/((uPM(1))^2+(vPM(1))^2+1);
qPM(2) = qPM(1) + h*(-2)*uPM(1)*pPM(1)*qPM(1)/((uPM(1))^2+(vPM(1))^2+1);
for i = 2 : N
	uPM(i+1) = uPM(i-1) + 2*h*pPM(i);
  vPM(i+1) = vPM(i-1) + 2*h*qPM(i);
  pPM(i+1) = pPM(i-1) + 2*h*(-2)*vPM(i)*pPM(i)*qPM(i)/((uPM(i))^2+(vPM(i))^2+1);
  qPM(i+1) = qPM(i-1) + 2*h*(-2)*uPM(i)*pPM(i)*qPM(i)/((uPM(i))^2+(vPM(i))^2+1);
end
 
%-------------------- Codigo de Euler Hacia Adelante: ---------------------------------------

% Intervalo de la funcion
au = 0 ;
bu = 100 ;
av = 0 ;
bv = 100 ;

% Defino el largo de los intervalos
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


% ------------ Calculo de error entre ambos metodos: -------------------------------------------

error=zeros(1,N);
for i= 1 : N
  error(i)=(((uPM(i+1)-uEu(i+1))^2+(vPM(i+1)-vEu(i+1))^2)^(0.5))/(((uPM(i+1))^2+(vPM(i+1))^2)^(0.5));
end;
t = 1:1:100;
plot(t,error,"b")