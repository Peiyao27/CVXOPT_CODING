%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

%Networks Lecture exercise 1b

%%%%linear program   https://www.mathworks.com/help/optim/ug/linprog.html
%Careful:
%MATLAB minimizes the objective function!!!!
%MATLAB does NOT assume all variables are nonnegative (unless you specify
%that explicitly as a lower bound)

%Set the objective function
f = [5 2 1 8 1];

%Set the inequality constraints
A = [];

b = [];

%Set the equality constraints
Aeq = [-1 0 0 1 0; 1 -1 0 0 0; 0 0 1 -1 0; 0 1 -1 0 -1; 0 0 0 0 1];
%beq =  -[20 0 10 0 -30];
beq =  -[2 0 1 0 -3];

%Set the lower and upper bounds on the decision variables
lb = [0 0 0 0 0];
ub = [10 3 3 2 5];

% find the optimal solution to the LP
%[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)
[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)




%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

%Networks Lecture exercise 3

%%%%linear program   https://www.mathworks.com/help/optim/ug/linprog.html
%Careful:
%MATLAB minimizes the objective function!!!!
%MATLAB does NOT assume all variables are nonnegative (unless you specify
%that explicitly as a lower bound)

%Set the objective function
f = [5, 8, 3, 3, 2, 7.5, 20, 1, 2, 6, 9, 1];

%Set the inequality constraints
A = [];

b = [];

%Set the equality constraints
Aeq = [-1 1 0 0 0 0 0; 0 -1 1 0 0 0 0; 0 0 -1 1 0 0 0; 0 0 1 -1 0 0 0; 0 -1 0 1 0 0 0; 0 0 0 -1 1 0 0; 1 0 0 0 -1 0 0; 0 0 0 0 -1 1 0; 0 0 0 1 0 -1 0; 0 0 0 -1 0 0 1; 0 0 0 0 0 1 -1; 0 0 0 0 0 -1 1]'
beq = -[1 0 0 0 0 0 -1]

%Set the lower and upper bounds on the decision variables
lb = [0 0 0 0 0 0 0 0 0 0 0 0];
ub = [];


% find the optimal solution to the LP
[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)