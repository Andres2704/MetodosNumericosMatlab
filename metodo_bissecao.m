clc; clear all;
syms f(x);
%% Obtendo os dados
func = input('Digite a funçao:', 's');
f(x) = sym(func);
a = input('Digite o intervalo a de [a b]:');
b = input('Digite o intervalo b de [a b]:');
eps = input('Digite a precisao:');
teste = 0;
k = 1;
%% plotando a funcao
figure(1);clf;x
fplot(f, [a b]);
hold on
grid on
hold off
%% Método da bissecçao
if b-a<eps
    intervalo = a:eps:b;
    x_barra = intervalo(randperm(length(intervalo),1));
    fprintf('A raiz aproximada é: %f', x_barra);
else
    while(teste==0)
      M = double(f(a));
      j = (a+b)/2;
      if M*double(f(j))>0
        a=j;
        if (b-a)<eps
            intervalo = a:eps:b;
            x_barra = intervalo(randperm(length(intervalo),1));
            fprintf('A raiz aproximada é: %f obtsida com %d iteracoes', x_barra,k);
            teste=1;
        end
        k=k+1;
        continue
      end
      b=j;
      if (b-a)<eps
        intervalo = a:b;
        x_barra = intervalo(randperm(length(intervalo),1));
        fprintf('A raiz aproximada é: %f obtida com %d iteracoes', x_barra,k);
        teste=1;
      end
      k=k+1;
    end

end








