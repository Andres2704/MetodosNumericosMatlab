clc; clear all;
syms f(x);
%% Obtendo os dados
func = input('Digite a funçao:', 's');
f(x) = sym(func);
a = input('Digite o intervalo de a:');
a_linha = a;
b = input('Digite o intervalo de b:');
b_linha = b;
eps1 = input('Digite a precisao e1:');
eps2 = input('Digite a precisao e2:');
teste = 0;
k = 0;
intervalo = abs(b-a);
%% plotando a funcao
figure(1);clf;
fplot(f, [a b]);
hold on
grid on
hold off
%% Criando os dados para a tabela 
Xo = (a*double(f(b))-b*double(f(a)))/(double(f(b))-double(f(a)));
%% metodo da posicao falsa
if b-a<eps1
    intervalo = a:eps:b;
    x_barra = intervalo(randperm(length(intervalo),1));
    fprintf('A raiz aproximada é: %f', x_barra);
elseif (abs(double(f(a)))<eps2 || abs(double(f(b)))<eps2)
    intervalo = a:b;
    x_barra = intervalo(randperm(length(intervalo),1));
    fprintf('A raiz aproximada é: %f', x_barra);
else
    while intervalo>eps1
        M = double(f(a));
        j = (a*double(f(b))-b*double(f(a)))/(double(f(b))-double(f(a)));
        if abs(double(f(j)))<eps2
            x_barra = j;
            fprintf('\n [1]A raiz aproximada é: %f com %d iteracoes obtida pela imagem \n', x_barra, k);
            break
        end
        if M*double(f(j))>0 
            a=j;
        else
            b=j;
        end
        
        intervalo = abs(b-a);
        k = k+1;
        if k==1
            Iteracoes = [0;k];
            A = [a_linha;a];
            B = [b_linha;b];
            f_a = [double(f(a_linha));double(f(a))];
            f_b = [double(f(b_linha));double(f(b))];
            j = (a*double(f(b))-b*double(f(a)))/(double(f(b))-double(f(a)));
            f_X = [double(f(Xo));double(f(j))];
        else
            Iteracoes = [Iteracoes;k];
            A = [A;a];
            B = [B;b];
            Xo = [Xo;j];
            f_a = [f_a;double(f(a))];
            f_b = [f_b;double(f(b))];
            j = (a*double(f(b))-b*double(f(a)))/(double(f(b))-double(f(a)));
            f_X = [f_X; double(f(j))];
        end 
    end
    Xo = [Xo;j];
    if intervalo<eps
       j = (a*double(f(b))-b*double(f(a)))/(double(f(b))-double(f(a)));
       fprintf('\n [2]A raiz aproximada é: %f com %d iteracoes obtida pelo dominio\n', x_barra, k);
        Iteracoes = [Iteracoes;k];
        A = [A;a];
        B = [B;b];
        Xo = [Xo;j];
        f_a = [f_a;double(f(a))];
        f_b = [f_b;double(f(b))];
        f_X = [f_X; double(f(j))];
    end
    T = table(Iteracoes,A,B,Xo,f_a,f_X,f_b)
end