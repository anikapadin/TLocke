%%Part 1
v.*u %element by element multiply
v*u' %matrix multiply with U transposed
v'*u %matrix multiply with V transposed
u/v  %best approximation of x for vx = u
u./v %element by element divide
%A*u
A.*u %element by element multiply
A*v' %matrix multiply with V transposed
%% Part 2

A^2 %Matrix multiplication of A*A
A.^2 %Element by element squared

%% Part 3 

n = 100;
ans = 0;
for ind = 0:n
    s = ((-3)^(-ind))/(2*ind + 1);
    ans = ans + s;
end
display("sum = " + (sqrt(12)*ans))
 
%% Part 3 the right way 
n = 0:100
a = ((-3).^(-1 * n))./((2 * n) + 1);
display(sum(a)*sqrt(12))
%converges to pi