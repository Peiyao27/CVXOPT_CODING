%%%Matlab optimization toolbox
%https://www.mathworks.com/help/optim/ug/problems-handled-by-optimization-toolbox-functions.html#tblminprobs



%%%%linear program   https://www.mathworks.com/help/optim/ug/linprog.html
%Careful:
%MATLAB minimizes the objective function!!!!
%MATLAB does NOT assume all variables are nonnegative (unless you specify
%that explicitly as a lower bound)

%Set the objective function
f = [-1 -1/3];

%Set the inequality constraints
A = [1 1
    1 1/4
    1 -1
    -1/4 -1
    -1 -1
    -1 1];

b = [2 1 2 1 -1 2];

%Set the equality constraints
Aeq = [1 1/4];
beq = 1/2;

%Set the lower and upper bounds on the decision variables
lb = [-1,-0.5];
ub = [1.5,1.25];

% find the optimal solution to the LP
[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%Integer Linear programming    https://www.mathworks.com/help/optim/ug/intlinprog.html


%specify linear objective function
f = [8;1];

%specify which variable(s) must be integers  (in this case, we want the second variable, "x2" to be an integer)
intcon = 2;


%specify inequality constraints (Ax<= b)
A = [-1,-2;
    -4,-1;
    2,1];
b = [14;-33;20];

%solve it
[x,f_val] = intlinprog(f,intcon,A,b)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%Quadratic program  https://www.mathworks.com/help/optim/ug/quadprog.html

options = optimoptions('quadprog','Display','iter');

% Define a problem with a quadratic objective and linear inequality constraints.
H = [1 -1; -1 2]; 
f = [-2; -6];
A = [1 1; -1 2; 2 1];
b = [2; 2; 3];

% To help write the quadprog function call, set the unnecessary inputs to [].
Aeq = [];
beq = [];
lb = [];
ub = [];
x0 = [];

%Find the optimal solution to the quadratic program (again, MATLAB is minimizing):
[x, fval] = quadprog(H,f,A,b,Aeq,beq,lb,ub,x0,options)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%Second-order cone program (SOCP) https://www.mathworks.com/help/optim/ug/coneprog.html

%specify the linear objective function
f = [-1,-2,0];

%specify the constraints
A = diag([1,1/2,0]);
b = zeros(3,1);
d = [0;0;1];
gamma = 0;
socConstraints = secondordercone(A,b,d,gamma);

%specify lower and upper bounds
lb = [-Inf,-Inf,0];
ub = [Inf,Inf,2];

%solve the SOCP:
[x,fval] = coneprog(f,socConstraints,Aineq,bineq,Aeq,beq,lb,ub)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%% General convex or Nonconvex minimization (unconstrained)   https://www.mathworks.com/help/optim/ug/fminunc.html

%Specify the (possibly nonconvex) objective function
fun = @(x)3*x(1)^2 + 2*x(1)*x(2) + x(2)^2 - 4*x(1) + 5*x(2);

%Specify the starting point of the algorithm
x0 = [1,1];

% Solve
[x,fval] = fminunc(fun,x0)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%general convex and nonconvex unconstrained minimization (with formula for the gradient supplied by you)

%Specify the gradient  (copy and paste into a separate .m file)
function [f,g] = rosenbrockwithgrad(x)
% Calculate objective f
f = 100*(x(2) - x(1)^2)^2 + (1-x(1))^2;

if nargout > 1 % gradient required
    g = [-400*(x(2)-x(1)^2)*x(1) - 2*(1-x(1));
        200*(x(2)-x(1)^2)];
end
end

%Specify options
options = optimoptions('fminunc','Algorithm','trust-region','SpecifyObjectiveGradient',true);

%specify starting point
x0 = [-1,2];
%define the function object
fun = @rosenbrockwithgrad;

% solve
[x, f_val] = fminunc(fun,x0,options)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%General convex and nonconvex constrained minimization https://www.mathworks.com/help/optim/ug/fmincon.html

%Specify the objective function
fun = @(x)100*(x(2)-x(1)^2)^2 + (1-x(1))^3;

% Specify the constraints (in this example the constraints are linear)
x0 = [-1,2];
A = [1,2];
b = 1;
x = fmincon(fun,x0,A,b)