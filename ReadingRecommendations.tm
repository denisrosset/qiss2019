<TeXmacs|1.99.9>

<style|generic>

<\body>
  <doc-data|<doc-title|Reading recommendations>|<doc-author|<author-data|<author-name|Denis
  Rosset>>>|<doc-date|July 18, 2019>>

  <section*|First session: \Pdevice-independence\Q>

  For the study of causal relations, see the work of Judea
  Pearl<nbsp><cite|Pearl2018>.

  A good review of the \Pquantum information\Q viewpoint:
  nonlocality<nbsp><cite|Brunner2014>. For a more mathematical description of
  the objects involved, see the thesis of Stefano
  Pironio<nbsp><cite|Pironio2004> (a paper exploring this in depth, with me
  as coauthor, is coming soon under the title \PAlgebraic and geometric
  properties of local transformations\Q).

  The main paper about inflation is<nbsp><cite|Wolfe2016>; the paper is
  pretty long and systematic. Start with Examples 1 and 2, which correspond
  to the example in the lecture and problem session respectively (they are on
  page 9 for the version 4 on the arXiv). Those examples are not \Probust\Q,
  in the sense that they detect incompatibility only for distributions that
  have the same pattern of \Pzero\Q coefficients.

  In the lab session GitHub repository, the \PCutInflation\Q project
  implements a way to test compatibility in a robust fashion using linear
  programming; while the approach is numerical there, no additional
  theoretical notions are needed. The inflation paper<nbsp><cite|Wolfe2016>
  however goes in much more detail about deriving inequalities,
  etc<text-dots>\ 

  We discussed briefly on the difference between classical and quantum
  resources, and the impact on the inflation technique (quantum resources, or
  resources beyond quantum cannot be copied). For the case of inflations
  <em|compatible> with quantum (or beyond quantum) resources, see the very
  readable paper<nbsp><cite|Gisin2019>.

  The generality of the inflation technique was proved
  in<nbsp><cite|Navascues2017>. Several papers about the precise
  generalization of the inflation technique to quantum resources are coming
  soon (with Elie Wolfe, Miguel Navascues and myself as coauthors). Some of
  those papers will combine the NPA/ \Psum-of-squares\Q/\Pmoment-based
  relaxations\Q technique with inflation

  A lot of scenarios remain unexplored, and can be studied without using
  involved tools.

  <section*|Sum-of-squares/moment-based relaxations/NPA>

  For the second session, the main papers are<nbsp><cite|Navascues2008a>
  and<nbsp><cite|Doherty2008>, along with the short
  letter<nbsp><cite|Navascues2007>. I encourage the readers to skip the
  convergence proofs which are quite technical \U they are not necessary for
  the validity of the technique (and the computation for a degree
  <math|d\<rightarrow\>\<infty\>> is anyway not possible).

  There is an example of the computation of the CHSH bound in the GitHub
  repository \PCHSH_nonsymmetric\Q which should be pretty straightforward
  (given notions of Matlab/YALMIP). YALMIP<cite|Lofberg2004> has pretty good
  tutorials online.

  For larger problems, writing the moment matrices by hand becomes tedious.
  While there exists several toolboxes (SOSTOOLS, GloptiPoly, SparsePOP) for
  the commutative case (i.e. the Lasserre/Parrilo hierarchy), there are fewer
  tools for the noncommutative case which interests us.

  NCSOSTOOLS is targeted at a slightly different audience. Right now, I
  recommend NCPOL2SDPA which is quite accessible. I'm writing a library
  called SymDPoly, see the accompanying paper<nbsp><cite|Rosset2018> which
  gives hints at how to implement those hierarchies, including their
  symmetrization.

  (All the software package names can be Googled).

  <section*|Representation theory>

  A good introduction is given in the first two chapters of the book by
  Jean-Pierre Serre<nbsp><cite|Serre1977> (the character theory part can be
  skipped at first reading). \ Complement it with the paper by
  Gatermann&Parrilo<nbsp><cite|Gatermann2004> (skip however Section 5 and
  after, as they do apply only to the commutative case).

  RepLAB should enable the reader to play with examples. Its documentation
  should expand in the next months.

  For the interested reader, the technique used by RepLAB is described in the
  Supplemental Material of<nbsp><cite|Tavakoli2018a>, and is inspired
  by<nbsp><cite|Murota2010|Maehara2010>.

  <\bibliography|bib|tm-plain|../../Documents/Bibliography/ZotOutput>
    <\bib-list|16>
      <bibitem*|1><label|bib-Brunner2014>Nicolas Brunner, Daniel Cavalcanti,
      Stefano Pironio, Valerio Scarani<localize|, and >Stephanie Wehner.
      <newblock>Bell nonlocality. <newblock><with|font-shape|italic|Rev. Mod.
      Phys.>, 86(2):419\U478, apr 2014.<newblock>

      <bibitem*|2><label|bib-Doherty2008>A.C.<nbsp>Doherty, Yeong-Cherng
      Liang, B.<nbsp>Toner<localize|, and >S.<nbsp>Wehner. <newblock>The
      Quantum Moment Problem and Bounds on Entangled Multi-Prover Games.
      <newblock><localize|In ><with|font-shape|italic|23rd Annual IEEE
      Conference on Computational Complexity, 2008. CCC '08>, <localize|pages
      >199\U210. Jun 2008.<newblock>

      <bibitem*|3><label|bib-Gatermann2004>Karin Gatermann<localize| and
      >Pablo<nbsp>A.<nbsp>Parrilo. <newblock>Symmetry groups, semidefinite
      programs, and sums of squares. <newblock><with|font-shape|italic|Journal
      of Pure and Applied Algebra>, 192(1<textendash|>3):95\U128, sep
      2004.<newblock>

      <bibitem*|4><label|bib-Gisin2019>Nicolas Gisin, Jean-Daniel Bancal, Yu
      Cai, Armin Tavakoli, Emmanuel<nbsp>Zambrini Cruzeiro, Sandu
      Popescu<localize|, and >Nicolas Brunner. <newblock>Constraints on
      nonlocality in networks from no-signaling and independence.
      <newblock><with|font-shape|italic|ArXiv190606495 Quant-Ph>, jun
      2019.<newblock>

      <bibitem*|5><label|bib-Lofberg2004>J.<nbsp>Lofberg. <newblock>YALMIP :
      a toolbox for modeling and optimization in MATLAB.
      <newblock><localize|In ><with|font-shape|italic|2004 IEEE International
      Conference on Robotics and Automation (IEEE Cat. No.04CH37508)>,
      <localize|pages >284\U289. Sep 2004.<newblock>

      <bibitem*|6><label|bib-Maehara2010>Takanori Maehara<localize| and
      >Kazuo Murota. <newblock>A numerical algorithm for block-diagonal
      decomposition of matrix *-algebras with general irreducible components.
      <newblock><with|font-shape|italic|Japan J. Indust. Appl. Math.>,
      27(2):263\U293, sep 2010.<newblock>

      <bibitem*|7><label|bib-Murota2010>Kazuo Murota, Yoshihiro Kanno,
      Masakazu Kojima<localize|, and >Sadayoshi Kojima. <newblock>A numerical
      algorithm for block-diagonal decomposition of matrix $${*}$$-algebras
      with application to semidefinite programming.
      <newblock><with|font-shape|italic|Japan J. Indust. Appl. Math.>,
      27(1):125\U160, jun 2010.<newblock>

      <bibitem*|8><label|bib-Navascues2007>Miguel Navascués, Stefano
      Pironio<localize|, and >Antonio Acín. <newblock>Bounding the Set of
      Quantum Correlations. <newblock><with|font-shape|italic|Phys. Rev.
      Lett.>, 98(1):10401, jan 2007.<newblock>

      <bibitem*|9><label|bib-Navascues2008a>Miguel Navascués, Stefano
      Pironio<localize|, and >Antonio Acín. <newblock>A convergent hierarchy
      of semidefinite programs characterizing the set of quantum
      correlations. <newblock><with|font-shape|italic|New J. Phys.>,
      10(7):73013, jul 2008.<newblock>

      <bibitem*|10><label|bib-Navascues2017>Miguel Navascues<localize| and
      >Elie Wolfe. <newblock>The inflation technique solves completely the
      classical inference problem. <newblock><with|font-shape|italic|ArXiv170706476
      Quant-Ph Stat>, jul 2017.<newblock>

      <bibitem*|11><label|bib-Pearl2018>Judea Pearl<localize| and >Dana
      Mackenzie. <newblock><with|font-shape|italic|The Book of Why: The New
      Science of Cause and Effect>. <newblock>Basic Books, New York, 1
      edition<localize| edition>, may 2018.<newblock>

      <bibitem*|12><label|bib-Pironio2004>Stefano Pironio<localize| and
      >Serge Massar. <newblock><with|font-shape|italic|Aspects of Quantum
      Non-Locality>. <newblock><localize|PhD thesis>, Université Libre de
      Bruxelles, 2004.<newblock>

      <bibitem*|13><label|bib-Rosset2018>Denis Rosset. <newblock>SymDPoly:
      symmetry-adapted moment relaxations for noncommutative polynomial
      optimization. <newblock><with|font-shape|italic|ArXiv180809598
      Quant-Ph>, aug 2018.<newblock>

      <bibitem*|14><label|bib-Serre1977>Jean-Pierre Serre.
      <newblock><with|font-shape|italic|Linear Representations of Finite
      Groups>. <newblock>Graduate Texts in Mathematics. Springer,
      1977.<newblock>

      <bibitem*|15><label|bib-Tavakoli2018a>Armin Tavakoli, Denis
      Rosset<localize|, and >Marc-Olivier Renou. <newblock>Enabling
      computation of correlation bounds for finite-dimensional quantum
      systems via symmetrisation. <newblock>Aug 2018.<newblock>

      <bibitem*|16><label|bib-Wolfe2016>Elie Wolfe,
      Robert<nbsp>W.<nbsp>Spekkens<localize|, and >Tobias Fritz.
      <newblock>The Inflation Technique for Causal Inference with Latent
      Variables. <newblock><with|font-shape|italic|ArXiv160900672 Quant-Ph
      Stat>, sep 2016.<newblock>
    </bib-list>
  </bibliography>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-2|<tuple|?|1|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-3|<tuple|?|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|auto-4|<tuple|?|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Brunner2014|<tuple|1|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Doherty2008|<tuple|2|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Gatermann2004|<tuple|3|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Gisin2019|<tuple|4|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Lofberg2004|<tuple|5|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Maehara2010|<tuple|6|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Murota2010|<tuple|7|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Navascues2007|<tuple|8|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Navascues2008a|<tuple|9|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Navascues2017|<tuple|10|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Pearl2018|<tuple|11|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Pironio2004|<tuple|12|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Rosset2018|<tuple|13|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Serre1977|<tuple|14|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Tavakoli2018a|<tuple|15|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
    <associate|bib-Wolfe2016|<tuple|16|2|../../.TeXmacs/texts/scratch/no_name_21.tm>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|bib>
      Pearl2018

      Brunner2014

      Pironio2004

      Wolfe2016

      Wolfe2016

      Gisin2019

      Navascues2017

      Navascues2008a

      Doherty2008

      Navascues2007

      Lofberg2004

      Rosset2018

      Serre1977

      Gatermann2004

      Tavakoli2018a

      Murota2010

      Maehara2010
    </associate>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|First
      session: \Pdevice-independence\Q> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Sum-of-squares/moment-based
      relaxations/NPA> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Representation
      theory> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Bibliography>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>