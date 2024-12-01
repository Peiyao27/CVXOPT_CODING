%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

%Networks homework 3 

%For 1.a), found the inputs such that both the primal and the dual problems
%have optimal solutions, the optimal values are the same value.
%Primal LP
%Set the objective function
f = [5 -2 1 8 1];

%Set the inequality constraints
A = [1 2 3 4 -1; 2 3 4 5 -2; 1 -1 2 -2 1; -1 3 -2 4 1];
b = [10; 10; 10; 10];

%Set the lower and upper bounds on the decision variables
lb = [0 0 0 0 0];
ub = [];

% find the optimal solution to the LP
%[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)
[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)

%Dual LP
%Set the objective function
f1 = [10; 10; 10; 10];

%Set the inequality constraints
B = -transpose(A);
b1 = [5 -2 1 8 1];

%Set the lower and upper bounds on the decision variables
lb1 = [0 0 0 0 ];
ub1 = [];

% find the optimal solution to the LP
[y, f_val] = linprog(f1,B,b1,Aeq1,beq1,lb1,ub1)


%For 1.b), found the inputs such that the primal LP is infeasible, the dual
%LP shows unboundness.
%Primal LP
%Set the objective function
f = [5 2 1 8 1];

%Set the inequality constraints
A = [1 2 3 4 -1; 2 3 4 5 -2; 1 -1 2 -2 1; -1 3 -2 4 1];
b = [1; 1; -1; -1];

%Set the lower and upper bounds on the decision variables
lb = [0 0 0 0 0];
ub = [];

% find the optimal solution to the LP
%[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)
[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)

%Dual LP
%Set the objective function
f1 = [1; 1; -1; -1];

%Set the inequality constraints
B = -transpose(A);
b1 = [5 2 1 8 1];

%Set the lower and upper bounds on the decision variables
lb1 = [0 0 0 0 0];
ub1 = [];

% find the optimal solution to the LP
%[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)
[x, f_val] = linprog(f1,B,b1,Aeq1,beq1,lb1,ub1)


%For 1.c), found the inputs such that the primal LP is unbounded, the dual
%LP is infeasible.
%Primal LP
%Set the objective function
f = [-5 -2 -1 -8 -1];

%Set the inequality constraints
A = [-1 -2 3 4 -1; -2 -3 4 5 -2; -1 -1 2 -2 1; -1 -3 -2 4 1];
b = [10; 10; 10; 10];

%Set the lower and upper bounds on the decision variables
lb = [0 0 0 0 0];
ub = [];

% find the optimal solution to the LP
%[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)
[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)

%Dual LP
%Set the objective function
f1 = [10; 10; 10; 10];

%Set the inequality constraints
B = -transpose(A);
b1 = [-5 -2 -1 -8 -1];

%Set the lower and upper bounds on the decision variables
lb1 = [0 0 0 0 ];
ub1 = [];

% find the optimal solution to the LP
%[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)
[y, f_val] = linprog(f1,B,b1,Aeq1,beq1,lb1,ub1)


%For 2.c), we want to find the optimal solution using MATLAB

%Set the objective function
c = [3.6; 6; 1; 3.6; 0; 6; 1; 6; 0; 6; 0; 2.6; 0; 10.6; 10.6]; % cost function

%Set the equality constraints
Aeq1 = [-1 -1 -1 1 0 1 0 0 0 0 0 0 0 0 0; 
    1 0 0 -1 -1 0 0 0 1 0 0 1 0 0 0; 
    0 1 0 0 0 -1 -1 0 0 0 0 0 0 0 0;
    0 0 0 0 0 0 1 -1 0 1 0 0 0 0 0;
    0 0 1 0 1 0 0 1 -1 -1 -1 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 1 -1 -1 -1 1;
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1]; % incidence matrix
%beq =  -[20 0 10 0 -30];
beq1 = -[0; 8; 8;-10; 0; 0; -6]; % -supply

%Set the lower and upper bounds on the decision variables
lb1 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
r = [70 30 3 70 30 30 2 20 30 20 20 5 20 20 20]; % capacity

% find the optimal solution to the LP
%[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)
[x, f_val] = linprog(c,A,b1,Aeq1,beq1,lb1,r)


%For 3.b), we want to find the optimal solution using MATLAB

%Set the objective function
%c = [3.6; 6; 1; 3.6; 0; 6; 1; 6; 0; 6; 0; 2.6; 0; 10.6; 10.6; -1; -1; -1; -1];
c = [3.6; 6; 1; 3.6; 0; 6; 1; 6; 0; 6; 0; 2.6; 0; 10.6; 10.6]; % cost function

%Set the inequality constraints
Aeq1 = [-1 -1 -1 1 0 1 0 0 0 0 0 0 0 0 0; 
    0 0 0 0 0 0 1 -1 0 1 0 0 0 0 0;
    0 0 1 0 1 0 0 1 -1 -1 -1 0 1 0 0;
    0 0 0 0 0 0 0 0 0 0 1 -1 -1 -1 1;
    0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1];
beq1 = -[0; -10; 0; 0; -6];
%Set the equality constraints
A = [1 0 0 -1 -1 0 0 0 1 0 0 1 0 0 0; 
    0 1 0 0 0 -1 -1 0 0 0 0 0 0 0 0;];
%b1 = [0; 20; 20; -10; 0; 0; -6];
b1 = [20; 20; ];
% beq = -[1 0 0 0 0 0 -1]; % different -supply

%Set the lower and upper bounds on the decision variables
lb1 = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
r = [70 30 3 70 30 30 2 20 30 20 20 5 20 20 20];

% find the optimal solution to the LP
%[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)
[x, f_val] = linprog(c,A,b1,Aeq1,beq1,lb1,r)


%For 4.b)
%Set the objective function
f = [0, 0, 0, 0, 0, 0, 0, 0, -1]; % cost

%Set the equality constraints
Aeq = [-1 1 0 0 0; -1 0 1 0 0; 0 -1 1 0 0 ; 0 -1 0 0 1; 0 1 -1 0 0; 0 0 -1 1 0; 0 0 1 -1 0; 0 0 0 -1 1; 1 0 0 0 -1]';
beq = -[0 0 0 0 0]; % different -supply

%Set the lower and upper bounds on the decision variables
%lb = [0 0 0 0 0 0 0 0 0];
lb = [];
ub = [1 1 1 1 1 1 1 1 100];

% find the optimal solution to the LP
[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)


%For 5)
%Set the objective function
f = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1]; % cost

%Set the equality constraints
Aeq = [-1 1 0 0 0 0 0 0 0 0; -1 0 1 0 0 0 0 0 0 0; -1 0 0 1 0 0 0 0 0 0; -1 0 0 0 1 0 0 0 0 0; 0 1 0 0 0 0 1 0 0 0; 0 0 -1 0 0 0 1 0 0 0; 0 0 0 -1 0 0 1 0 0 0; 0 0 0 -1 0 0 0 1 0 0;
    0 0 0 0 -1 1 0 0 0 0; 0 0 0 0 -1 0 0 0 1 0; 0 0 0 0 0 -1 0 0 0 1; 0 0 0 0 0 0 -1 0 0 1; 0 0 0 0 0 0 0 -1 0 1; 0 0 0 0 0 0 0 0 -1 1; 1 0 0 0 0 0 0 0 0 -1;]';
beq = -[0 0 0 0 0 0 0 0 0 0]; % different -supply

%Set the lower and upper bounds on the decision variables
%lb = [0 0 0 0 0 0 0 0 0];
lb = [];
ub = [1 1 1 1 1 1 1 1 1 1 1 1 1 1 200];

% find the optimal solution to the LP
[x, f_val] = linprog(f,A,b,Aeq,beq,lb,ub)