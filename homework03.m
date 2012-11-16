%% Homework #2
% Endre Laszlo, 
% lasen@digitus.itk.ppke.hu,
% PhD student, 
% OeRC, Oxford and Pazmany Peter Catholic University, Budapest

% Clear all
clear all
close all
% Change format of floats
format long g


%% Problem 1 - git it started
% https://github.com/endrelaszlo/SciComp3.git

%% Problem 2 - A little more least squares
% Prepared data:

m=50;
n=5;

t = linspace(0,1,m);
A = fliplr(vander(t));
A = A(:,1:n);
b = cos(4*t)';

%% x2
% Solution with backslash: 
% Condition number of A =
cond(A)

plot(b);
hold on;
x1 = A\b;
plot(A*x1, 'r')

%%
% Solution with Normal equtions and backslash
% Condition number of A'*A = 
cond(A'*A)

x2 = (A'*A)\(A'*b);
plot(A*x2,'gs');

%%
% Solution with QR decomposition and backslash
[Q,R]=qr(A)
% Condition numbers of R and Q respectively = 
cond(R)
cond(Q)
% But the rank of A is only = 
rank(A)

% I choose backslash instead of backsubstitution:
x3 = R\(Q'*b);
plot(A*x3,'mo');



%%
% Solution with SVD: bith U and V are orthogonal square matrices, so their
% inverse is ther transpose. Only S has to be inverted: take the inverse 
% of scalars in diagonal
[U,S,V]=svd(A,0);
x4 = V*diag(1./diag(S))*U'*b;
plot(A*x4,'c*');
legend('cos(4t)','Backslash','Normal with backslash','QR with backslash','SVD','Location','NorthWest')

%%
% The four result vectors are:
X = [x1, x2, x3, x4]
Y = A*X

% The second norms for the 4 solutions are:
error = sum((Y-[b, b, b, b]).^2)

%%
% The errors are almost the same


%% Problem 3 - Condition numbers
%

%% Problem 4 - Image processing and the \the unsharp mask"
%

%% Problem 5 - Fitting ellipses via least-squares
%
% 
% x = [3 1 0 -1 -2 0 -2 2]';
% y = [3 -2 3 2 -2 -4 0 0]';
% ellipse(x,y)