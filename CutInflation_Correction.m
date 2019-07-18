
%% Exported from Jupyter Notebook
% Run each section by placing your cursor in it and pressing Ctrl+Enter

%% Code Cell[1]:

run ~/Projects/replab/replab_addpaths(2,1);
install_sdpt3;

%% Markdown Cell:
% # Implementing the cut inflation test
% 
% We are using the enumeration of variables
% $$\vec{P}^\text{test}_\text{ABC} = \big( P(abc) \big) = \big(P(000), P(001), P(010), P(011), P(100), P(101), P(110), P(111)\big)$$, for the triangle with connections (shown here flattened, there is a single `beta` variable):
% 
% ```
% beta -> A <- gamma -> B <- alpha -> C <- beta (looping)
% ```
% 
% For example, we test the distributions:
% $$ \vec{P}^\text{equal} = \big( 1/2, 0, 0, 0, 0, 0, 0, 1/2 \big). $$
% $$ \vec{P}^\text{notequal} = \big( 0, 1/6, 1/6, 1/6, 1/6, 1/6, 1/6, 0 \big). $$
% and a new distribution inspired by the $W$ state:
% $$ \vec{P}^\text{W} = \big( 0, 1/3, 1/3, 0, 1/3, 0, 0, 0 \big). $$
% 
% We will test those distributions using the cut inflation 
% $$\vec{P}^\text{inf}_\text{A1B1C1} = \big( P(a_1 b_1 c_1) \big) = \big(P(000), P(001), P(010), P(011), P(100), P(101), P(110), P(111)\big)$$,
% 
% which is connected in this way:
% 
% ```
% beta1 -> A1 <- gamma1 -> B1 <- alpha1 -> C1 <- beta2
% ```.
% 
% We now defined the distribution being tested, the inflation distribution $\vec{P}^\text{test}$ with its first constraint, namely nonnegativity.

%% Code Cell[2]:

P_abc = [1 0 0 0 0 0 0 1]'/2; % we omit the "test" superscript, if the distribution is on a,b,c it is the test one
P_a1b1c1 = sdpvar(8, 1); % we omit the "inf" superscript, if the distribution is on a1,b1,c1 it is the inflation one
Constraint_Pos = [P_a1b1c1 >= 0];

%% Markdown Cell:
% Now the hard part. We need to add the constraints that match marginal distributions of $\vec{P}^\text{test}$ with parts of $\vec{P}^\text{inf}$. For example, we match $\vec{P}^\text{inf}_\text{A1C1}$

%% Code Cell[3]:

P_a = [1 1 1 1 0 0 0 0
       0 0 0 0 1 1 1 1] * P_abc;
P_c = [1 0 1 0 1 0 1 0
       0 1 0 1 0 1 0 1] * P_abc;
P_a1c1 = [1 0 1 0 0 0 0 0
          0 1 0 1 0 0 0 0
          0 0 0 0 1 0 1 0
          0 0 0 0 0 1 0 1] * P_a1b1c1;
Constraint_A1C1 = [P_a1c1 == [P_a(1)*P_c(1); P_a(1)*P_c(2); P_a(2)*P_c(1); P_a(2)*P_c(2)]];

%% Markdown Cell:
% Now, write the constraints for $\vec{P}^\text{test}_\text{AB} = \vec{P}^\text{inf}_\text{A1B1}$ and $\vec{P}^\text{test}_\text{BC} = \vec{P}^\text{inf}_\text{B1C1}$.

%% Code Cell[4]:

P_ab = [1 1 0 0 0 0 0 0
        0 0 1 1 0 0 0 0
        0 0 0 0 1 1 0 0
        0 0 0 0 0 0 1 1] * P_abc;
P_a1b1 = [1 1 0 0 0 0 0 0
          0 0 1 1 0 0 0 0
          0 0 0 0 1 1 0 0
          0 0 0 0 0 0 1 1] * P_a1b1c1;
Constraint_A1B1 = [P_ab == P_a1b1];
P_bc = [1 0 0 0 1 0 0 0
        0 1 0 0 0 1 0 0
        0 0 1 0 0 0 1 0
        0 0 0 1 0 0 0 1] * P_abc;
P_b1c1 = [1 0 0 0 1 0 0 0
          0 1 0 0 0 1 0 0
          0 0 1 0 0 0 1 0
          0 0 0 1 0 0 0 1] * P_a1b1c1;
Constraint_B1C1 = [P_bc == P_b1c1];

%% Markdown Cell:
% We now solve the feasibility problem. Note that we fix the objective to `0`.

%% Code Cell[5]:

CONS = [Constraint_Pos
        Constraint_A1C1
        Constraint_A1B1
        Constraint_B1C1];
optimize(CONS, 0)

