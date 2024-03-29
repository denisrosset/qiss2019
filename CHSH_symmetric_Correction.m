
%% Exported from Jupyter Notebook
% Run each section by placing your cursor in it and pressing Ctrl+Enter

%% Code Cell[4]:

run ~/Projects/replab/replab_addpaths(2,1); % replace by your own path
install_sdpt3;

%% Markdown Cell:
% # Finding an upper bound on CHSH, symmetrized version
% During the lecture, we found a form of the SDP that had only one optimization variable. We'll now see how to symmetrize the problem completely.
% 
% We first declare the one and only variable, before constructing the moment matrix.

%% Code Cell[5]:

y = sdpvar; % y is actually y_A0B0, but we save space by identifying y with it
X = [ 1  0  0  0  0
      0  1  0  y  y
      0  0  1  y -y
      0  y  y  1  0
      0  y -y  0  1];
I_CHSH = 4*y; % it is <A0B0> + <A0B1> + <A1B0> - <A1B1>, and y_A1B1 = -y_A0B0.
optimize(X >= 0, -I_CHSH, sdpsettings('verbose', 0)); % sign change to maximize, and we don't show solver out
double(I_CHSH)

%% Markdown Cell:
% To help with symmetrization, we'll use an equivalent form of the constraint X, and check the result.

%% Code Cell[6]:

C = eye(5); % identity
A = [0  0  0  0  0
     0  0  0  1  1
     0  0  0  1 -1
     0  1  1  0  0
     0  1 -1  0  0];
X = C + A*y; % equivalent to the constraint above
optimize(X >= 0, -I_CHSH); % sign change to maximize
double(I_CHSH)

%% Markdown Cell:
% Now, we want to find a change of basis that brings X into a block-diagonal form. This is easier to check on the basis matrices `C` and `A`, i.e. we want to find `U` such that `U*C*U'` and `U*A*U'` are block-diagonal. Let us use RepLAB for that.
% First, remark that the moment matrix is invariant under the following signed permutations:
% 
% $\vec{v} = \left( 1, A_0, A_1, B_0, B_1 \right) \rightarrow  \left( 1, B_0, B_1, A_0, A_1 \right) $
% 
% $\vec{v} = \left( 1, A_0, A_1, B_0, B_1 \right) \rightarrow  \left( 1, -A_0, -A_1, -B_0, -B_1 \right) $
% 
% $\vec{v} = \left( 1, A_0, A_1, B_0, B_1 \right) \rightarrow  \left( 1, A_1, A_0, B_0, -B_1 \right) $
% 
% We now show how to use RepLAB to find the change of basis for the symmetry group that includes only the first symmetry.

%% Code Cell[7]:

g1 = [1 4 5 2 3]; % permutation of parties
g2 = [1 -2 -3 -4 -5]; % sign flip everywhere, note the signed permutation convention
g3 = [1 3 2 4 -5]; % additional symmetry

%% Markdown Cell:
% We build the symmetry group from those generators, which are signed permutations on five elements. For the permutation of parties only, the order (=size) of the group is 2. When adding the other symmetries, the order of the group should be 16.

%% Code Cell[8]:

nElements = 5;
G = replab.SignedPermutations(nElements).subgroup({g1 g2 g3});
G.order

%% Markdown Cell:
% If necessary, we can also expand the group elements (use `G.elements.at(2)` to get the second element for example).

%% Code Cell[9]:

G.elements

%% Markdown Cell:
% Now, the representatio we need is composed of signed permutation matrices; as we are considering a group of signed permutations, this is the group *natural representation*. Representations in RepLAB are described using the images of the generators. By calling `G.sampleUniformly`, we get random elements from the group, and by calling `rep.image(g)` we get the image of a group element.

%% Code Cell[10]:

rep = G.naturalRep

%% Code Cell[11]:

g = G.sampleUniformly
full(rep.image(g)) % we use full, as signed permutation representations return sparse matrices

%% Markdown Cell:
% Now, we decompose the representation into irreducible components. For that, we call `rep.decomposition`. In the answer I(m)xR(d), we express that the component has $m$ copies (multiplicity) of a `R`eal representation of dimension `d`. We then play with the indices of the component, and copy.
% 
% Hint: explore `rep.decomposition.component(i).copy(j)` for $(i,j) = (1,1), (1,2), (1,3), (2,1), (2,2)$.

%% Code Cell[12]:

rep.decomposition

%% Code Cell[13]:

rep.decomposition.component(1).copy(1)

%% Markdown Cell:
% We now ask for the change of basis matrix, and verify that `A` and `C` block-diagonalize.

%% Code Cell[14]:

U = full(rep.decomposition.rep.U)
U*C*U'
U*A*U'

%% Markdown Cell:
% Once we have found the change of basis matrix, we transform our moment matrix `X`, and naturally it should have a block diagonal structure following the one of `C` and `A` -- for that, it may be necessary to kill small off-block coefficients.

%% Code Cell[15]:

X = (U*C*U') + (U*A*U')*y; % equivalent to the constraint above
optimize(X >= 0, -I_CHSH); % sign change to maximize
double(I_CHSH)

%% Markdown Cell:
% As an exercice, recover an algebraic basis from `U`, guess the form of the semidefinite program when fully block-diagonal (i.e. for the full group of CHSH symmetries).
% **Remark that now the problem can be solved by hand to recover the $2\sqrt{2}$ bound, as the SDP matrix is fully diagonal, and thus corresponds to linear inequalities.**
