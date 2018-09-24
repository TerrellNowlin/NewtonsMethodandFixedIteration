
lab2pdf=fopen('Lab2Nowlin.txt','w');

%% -------------------------Question 1-------------------------------------

%define functions and variables
functionA=@(x)((20*x + (21/x^2))/21);
functionB=@(x)(x - ((x^3-21)/(3*x^2)));
functionC=@(x)(x - ((x^4-21*x)/(x^2 - 21)));
functionD=@(x)((21/x)^(0.5));

format long;
e = 10^-10;

%calls fixed point method for all 4 functions and prints results
[itersA, answer] = fixedPoint(1, functionA, e);
fprintf('1a)n:%d, calculated approximation:%s, e: %d,  \n\n', itersA,answer,e);

[itersB, answer] = fixedPoint(1, functionB, e);
fprintf('1b)n:%d, calculated approximation:%.*f, e: %d,  \n\n', itersB,12,answer,e);

[itersC, answer] = fixedPoint(1, functionC, e);
fprintf('1c)n:%d, calculated approximation:%.*f, e: %d,  \n\n', itersC,12,answer,e);

[itersD, answer] = fixedPoint(1, functionD, e);
fprintf('1d)n:%d, calculated approximation:%.*f, e: %d,  \n\n', itersD,12,answer,e);

%% -----------------------Approximation Methods----------------------------

%INPUT:p0(float) func (function handle),  e (float)
%OUTPUT:iters (int), answer (float)
function [iters, answer] = fixedPoint(p0,equation, e)
pn=equation(p0);
iters=1;
%check e on each threshold
while (abs(pn-p0) > e) && iters<100
    iters = iters+1;
    p0=pn;
    pn = equation(p0);

end
if iters<100
answer=pn;
else
    answer='max reached';
end
end

%INPUT:p0(float) func (function handle),  e (float)
%OUTPUT:iters (int), answer (float)
function [iters, answer] = newtons_method(p0, func, e)
%initialize value
iters = 1;
pn = func(p0);
while (abs((pn-p0)/pn)> e) && iters<100
    iters = iters+1;
    p0 = pn;
    pn = func(p0);
end
if iters<100
answer=pn;
else
    answer='max reached';
end
end
