clc; close all; clear;
%% Obtenção do dados do usuário
b = input('Digite o vetor b de Ax=b b=[a;b;c;...n]: ');
A = input('Digite a matriz A de Ax=b A=[a b c;d...;...]:');
x = zeros(length(b),1);

%% Eliminação
n = length(A);
for k=1:(n-1)
    pivo = A(k,k);
    for i=k+1:n
        m = A(i,k)/pivo;
        A(i,k) = 0;
        for j = k+1:n
            A(i,j)=A(i,j)-m*A(k,j);
        end
        b(i) = b(i) - m*b(k);
    end
end

%% Resolução
x(n)=b(n)/A(n,n);
for k=n-1:-1:1
      s=0;
      for j=k+1:n
        s = s + A(k,j)*x(j);
        x(k) = (b(k)-s)/A(k,k);
      end
end 
display([A b])
display(x)
    

