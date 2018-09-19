%------------------------------------------------------------------------------------------
% Analisis de error entre funcion lsode y resolucion con Metodo del Punto Medio
%------------------------------------------------------------------------------------------

1;

%---------------------------- Codigo de lsode: --------------------------------------------

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


%--------------------- Codigo de método Punto Medio: ---------------------------------------

N = 100;
h = 100/N;
uPM = zeros(1,N+1);
vPM = zeros(1,N+1);
p = zeros(1,N+1);
q = zeros(1,N+1);
uPM(1) = 0;
vPM(1) = 0;
p(1) = 0.01;
q(1) = 0.01;
% definicion paso 1:
uPM(2) = uPM(1) + h*p(1);
vPM(2) = vPM(1) + h*q(1);
p(2) = p(1) + h*(-2)*vPM(1)*p(1)*q(1)/((uPM(1))^2+(vPM(1))^2+1);
q(2) = q(1) + h*(-2)*uPM(1)*p(1)*q(1)/((uPM(1))^2+(vPM(1))^2+1);
for i = 2 : N
	uPM(i+1) = uPM(i-1) + 2*h*p(i);
    vPM(i+1) = vPM(i-1) + 2*h*q(i);
    p(i+1) = p(i-1) + 2*h*(-2)*vPM(i)*p(i)*q(i)/((uPM(i))^2+(vPM(i))^2+1);
    q(i+1) = q(i-1) + 2*h*(-2)*uPM(i)*p(i)*q(i)/((uPM(i))^2+(vPM(i))^2+1);
end


%---------------- Calculo de error entre ambos metodos: -------------------------------------

error=zeros(1,N);
for i= 1 : N
  error(i)=(((uls(i)-uPM(i+1))^2+(vls(i)-vPM(i+1))^2)^(0.5))/(((uls(i))^2+(vls(i))^2)^(0.5));
end;
k=1:1:100;
plot(k,error,"b")