function [b,c,d]=ellipse(x,y)
    sol = [x.^2 x.*y y.^2]\ones(size(x));
    b = sol(1);
    c = sol(2);
    d = sol(3);
end