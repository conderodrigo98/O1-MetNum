% ------------------------------------------------------------------------------------------
% Script que resuelve ecuacion diferencial ordinaria para: Esfera
% ------------------------------------------------------------------------------------------  

clc, close all, clear all

addpath( [ pwd '/sources'] ) ;

supName = 'Esfera' ;

CreatesOutput

% Intervalo de la funcion

au = 0 ;
bu = 100 ;
av = 0 ;
bv = 100 ;

% Cantidad de subintervalos

N = 100 ;

% Defino el largo de los intervalos

hu = ( bu - au ) / N ;
hv = ( bv - av ) / N ;

% Defino vectores para los valores funcionales de u,v,p y q

u = zeros(1,N+1) ;
v = zeros(1,N+1) ;
p = zeros(1,N+1) ;  
q = zeros(1,N+1) ;

% Asigno condiciones iniciales

u(1) = cos(pi/4) ;
v(1) = sin(pi/4) ;
p(1) = 0.2 ;
q(1) = 0.1 ;

for i = 1 : N
  u(i+1) = u(i) + hu*p(i) ;
  v(i+1) = v(i) + hv*q(i) ;
  p(i+1) = p(i) + hu*(-((p(i))^2+4*p(i)*q(i)+(q(i))^2))/tan(v(i)) ;
  q(i+1) = q(i) + hv*(-((p(i))^2*(cos(v(i)))^2+2*p(i)*q(i)))/tan(v(i)) ;
end

% Grafico

% Si quiero que octave muestre los ploteos
% printflag = 1
% Si no quiero que octave muestre los ploteos
% printflag = 0

printflag = 0 ;  

OutputPlots



