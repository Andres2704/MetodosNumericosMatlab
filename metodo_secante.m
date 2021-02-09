clear;
clc;
%% Obtendo os dados
syms f(x);
func = input('Digite a funcao: ','s');
f(x) = sym(func);
g(x) = diff(f);
x0 = input('Digite a sua aproximaçao inicial x0: ');
x1 = input('Digite a sua aproximaçao inicial x1: ');
intervalo = abs(x1-x0);
eps1 = input('Digite a sua precisao: ');
k = 0;
%% Método da secante(Aproximação para o método de Newton-Raphson)
while intervalo>eps1
    if abs(double(f(x0)))<eps1
        fprintf('A raíz foi obtida pela imagem com %d iterações \n\n Raíz --> x = %.8f',k,x0);
        break
    elseif abs(double(f(x1)))<eps1
        fprintf('A raíz foi obtida pela imagem com %d iterações \n\n Raíz --> x = %.8f',k,x1);
        break
    end
    x2 = x1 - ((double(f(x1))/(double(f(x1))-double(f(x0))))*(x1-x0));
    intervalo = abs(x2-x1);
    x0=x1;
    x1=x2;
    k = k + 1;
end
if intervalo<eps1
   fprintf('A raíz foi obtida pelo dominio com %d iterações \n\n Raíz --> x = %.8f',k,x1); 
end
