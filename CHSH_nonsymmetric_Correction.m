
%% Exported from Jupyter Notebook
% Run each section by placing your cursor in it and pressing Ctrl+Enter

%% Markdown Cell:
% If the math does not display properly, use the [nbviewer.jupyter.org link](https://nbviewer.jupyter.org/github/denisrosset/qiss2019/blob/master/CHSH_nonsymmetric_Correction.ipynb)

%% Code Cell[1]:

run ~/Projects/replab/replab_addpaths(2,1); % replace by your own path
install_sdpt3;

%% Markdown Cell:
% # Moment based relaxation for CHSH
% 
% We use the measurement operators $A_x$ and $B_y$, that have eigenvalues $\pm 1$.
% 
% The rules are: $A_x$ and $B_y$ are self-adjoint, $B_y A_x = A_x B_y$ and $(A_x)^2 = (B_y)^2 = 1$. These will translate to linear relations between expectation values (or moments).
% 
% We build the moment matrix using the vector of monomials $\vec{v} = \left( 1, A_0, A_1, B_0, B_1 \right)$, which is
% 
% $$
% X = \begin{pmatrix}\left<1\right> & \left<A_0\right> & \left<A_1\right> & \left<B_0\right> & \left<B_1\right> \\  & \left<1\right> & \left<A_0 A_1\right> & \left<A_0 B_0\right> & \left<A_0 B_1\right> \\ &   & \left<1\right> & \left<A_1 B_0\right> & \left<A_1 B_1\right> \\  &   &   & \left<1\right> & \left<B_0 B_1\right> \\  &   &   &   &  \left<1\right> \end{pmatrix}
% $$
%   
% The objective function is 
% 
% $$
% I_\text{CHSH} = \left<A_0 B_0\right> + \left<A_0 B_1\right> + \left<A_1 B_0\right> - \left<A_1 B_1\right>
% $$
% 
% We optimize over all (real, wlog.) expectations values such that $X$ is a semidefinite positive matrix (which is often written $X\ge 0$).

%% Code Cell[2]:

% We first declare all the moments present.
y_A0 = sdpvar;
y_A1 = sdpvar;
y_B0 = sdpvar;
y_B1 = sdpvar;
y_A0B0 = sdpvar;
y_A0B1 = sdpvar;
y_A1B0 = sdpvar;
y_A1B1 = sdpvar;
y_A0A1 = sdpvar;
y_B0B1 = sdpvar;

%% Markdown Cell:
% ## Part to be completed by participants
% Below, the objective $I_CHSH$ needs to be filled with a linear combination of the optimization variables (the $y_\ldots$), and the moment matrix needs to be filled with monomials fully (not only the upper triangle).
% If the moment matrix specified is not symmetric, the optimization will proceed in an unpredictable way.

%% Code Cell[3]:

% Please complete the objective function by replacing the value 0
ICHSH = y_A0B0 + y_A0B1 + y_A1B0 - y_A1B1

%% Code Cell[4]:

% Please complete moment matrix with correct monomials
X = [1      y_A0    y_A1    y_B0    y_B1
     y_A0   1       y_A0A1  y_A0B0  y_A0B1
     y_A1   y_A0A1  1       y_A1B0  y_A1B1
     y_B0   y_A0B0  y_A1B0  1       y_B0B1
     y_B1   y_A0B1  y_A1B1  y_B0B1  1]

%% Markdown Cell:
% ## Solving the optimization problem
% 
% We now solve the optimization problem. We first check that `X >= 0` is a semidefinite positive constraint (when the underlying matrix is symmetric), as opposed to an element-by-element inequality constraint `X(i,j) >= 0`.

%% Code Cell[5]:

X >= 0 % We don't want the result "Element-wise inequality", but "Matrix inequality"

%% Markdown Cell:
% We now solve the optimization problem. Note the sign reversal as by default, YALMIP *minimizes* the objective.

%% Code Cell[6]:

optimize(X >= 0, -ICHSH)

%% Markdown Cell:
% We now look at the answer.

%% Code Cell[7]:

double(ICHSH)
