clear;
clc;
%% Obtendo os dados
syms f(x);
func = input('Digite a funcao: ','s');
f(x) = sym(func);
g(x) = diff(f);
xn = input('Digite a sua aproximaçao inicial: ');
intervalo = 1;
eps1 = input('Digite a sua precisao1 : ');
eps2 = input('Digite a sua precisao2: ');
k = 0;
%% Método de Newton-Raphson
if abs(double(f(xn)))<eps1
   fprintf('A raiz foi obtida pela imagem com %d iteraçoes \n\n RAÍZ  --->  x=%f \n\n',k,xn);
else
    while abs(intervalo)>eps2
        %n = k-1
        xk = xn - (double(f(xn))/double(g(xn)));
        if abs(double(f(xk)))<eps1
            fprintf('A raiz foi obtida pela imagem com %d iteraçoes \n\n RAÍZ  --->  x=%f \n\n',k,xk);
            break
        end
        intervalo = abs(xk-xn);
        xn=xk;
        k=k+1;
    end
end
if intervalo<eps2
    xk = xn - (double(f(xn))/double(g(xn)));
    fprintf('A raiz foi obtida pelo dominio com %d iteraçoes \n\n RAÍZ  --->  x=%f \n\n',k,xk);       
end

