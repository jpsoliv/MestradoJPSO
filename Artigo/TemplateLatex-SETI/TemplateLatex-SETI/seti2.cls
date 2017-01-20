%% Class file for SETI
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{seti2}
\newif\if@seti@handcarry
\newif\if@seti@submit
\newif\if@seti@handout
\@seti@handcarryfalse
\@seti@submitfalse
\@seti@handoutfalse
\DeclareOption{handcarry}%
 {\@seti@handcarrytrue\@seti@submitfalse\@seti@handoutfalse}
\DeclareOption{submit}%
 {\@seti@submittrue\@seti@handcarryfalse\@seti@handoutfalse}
\DeclareOption{handout}%
 {\@seti@handouttrue\@seti@handcarryfalse\@seti@submitfalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}%
                \typeout{Unknown option: passing ``\CurrentOption"
                         option on to the standard LaTeX article class.}}
\ProcessOptions
\if@seti@handout
		\LoadClass[11pt]{article}
		\RequirePackage[margin=1in,includemp, letterpaper,%
										marginparsep=0.375in,
										marginparwidth=2in,
										footskip=23pt]{geometry}
		\RequirePackage{paralist}% for compact lists
		\RequirePackage[strict]{chngpage}% for changing page width
		\RequirePackage{bibentry}%  inline citations
\else
		\if@seti@submit
				\LoadClass[a4paper,12pt]{article}
				\RequirePackage{setspace}% control line spacing
		\else
				\LoadClass[a4paper,12pt]{article}
		\fi
		\RequirePackage[margin=2.5cm,top=2.5cm,left=2.5cm,right=2.5cm,bottom=2.0cm,headheight=\baselineskip]%
                {geometry}% page layout
		\RequirePackage{natbib}% superscript, sorted, compressed citation commands
\fi

\RequirePackage{fancyhdr}% simple control of headers and footers
\RequirePackage{lastpage}% to get reference for last page number
\RequirePackage{graphicx}% images
\RequirePackage{array}%    extra row height

%

\setlength{\intextsep}{0.7\baselineskip \@plus 2\p@ \@minus 1\p@}
\def\fps@figure{htbp}
\def\fps@table{htbp}
\setlength\marginparpush{1.6\parsep}

\if@seti@handout
		\newcommand{\seti@marginfont}{\normalfont\scriptsize}
\fi

\setlength\abovedisplayskip{3pt plus 1pt minus 1pt}
\setlength\belowdisplayskip{3pt plus 1pt minus 1pt}
\setlength\abovecaptionskip{3pt}
\setlength\belowcaptionskip{3pt}
\newlength{\seti@overhang}
\setlength{\seti@overhang}{\marginparwidth}
\addtolength{\seti@overhang}{\marginparsep}
\def\seti@raggedright{% resides in latex.ltx
  \let\\\@centercr\@rightskip\z@ plus 0.08\hsize%
  \rightskip\@rightskip
  \leftskip\z@skip
  \parindent\z@}

%\newcommand\seti@makecopyright{
%  \begingroup
%   \renewcommand\thefootnote{}
%   \if@seti@handcarry\footnotetext{\seti@copyright}\fi
%   \if@seti@handout\footnotetext{\scriptsize\seti@copyright}\fi
%  \endgroup
%}

\if@seti@handout
		\renewcommand{\thanks}[2][0pt]%
   {\footnotemark%
     \renewcommand\thefootnote{\@fnsymbol\c@footnote}
     \marginpar{\seti@marginfont
                \vspace*{#1}
                \textsuperscript{\thefootnote}%
                \hspace{1pt}%
                \seti@raggedright #2}%
		}
\fi

\newcounter{seti@cthanks}
\newcounter{seti@cfootnote}
\newcommand{\thanksibid}[1]{%
		\begingroup
				\setcounter{seti@cfootnote}{\value{footnote}}% store original
				\setcounter{seti@cthanks}{#1}%
				\renewcommand\thefootnote{\fnsymbol{seti@cthanks}}%
				\footnotemark%
				\setcounter{footnote}{\value{seti@cfootnote}}% reset to original
		\endgroup
		}

\if@seti@handout
		 \renewcommand\maketitle{\par
					\renewcommand{\and}{\vskip 4pt}
					\begingroup
							\parindent 0pt
							\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
							\def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
							\long\def\@makefntext##1{\parindent 1em\noindent
											\hb@xt@1.8em{%
													\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
							\newpage
							\global\@topnum\z@   % Prevents figures from going at top of page.
							\@maketitle
							\thispagestyle{plain}\@thanks
					\endgroup
					\setcounter{footnote}{0}%
					%\seti@makecopyright
					\global\let\thanks\relax
					\global\let\maketitle\relax
					\global\let\@maketitle\relax
					\global\let\@thanks\@empty
					\global\let\@author\@empty
					\global\let\@date\@empty
					\global\let\@title\@empty
					\global\let\title\relax
					\global\let\author\relax
					\global\let\date\relax
					\global\let\and\relax
			}
\else
			\renewcommand\maketitle{\par
					\begingroup
							\renewcommand\thefootnote{\@fnsymbol\c@footnote}%
							\def\@makefnmark{\rlap{\@texterscript{\normalfont\@thefnmark}}}%
							\long\def\@makefntext##1{\parindent 1em\noindent
											\hb@xt@1.8em{%
													\hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
							\newpage
							\global\@topnum\z@   % Prevents figures from going at top of page.
							\@maketitle
							\@thanks
					\endgroup
					\setcounter{footnote}{0}%
					\renewcommand\thefootnote{\@alph\c@footnote}% change to alpha style footnote
					%\seti@makecopyright
					\global\let\thanks\relax
					\global\let\thanksibid\relax
					\global\let\maketitle\relax
					\global\let\@maketitle\relax
					\global\let\@thanks\@empty
					\global\let\@author\@empty
					\global\let\@date\@empty
					\global\let\@title\@empty
					\global\let\title\relax
					\global\let\author\relax
					\global\let\date\relax
					\global\let\and\relax
		 }
\fi


\if@seti@handout
		\def\@maketitle{%
				\newpage
				\null
				{\LARGE\bfseries\slshape\raggedright \@title \par}%
				\vskip 10pt%
				{\large\slshape \@author \par}
				\vskip 6pt%
				{\normalsize\slshape seti Paper \seti@papernumber\par}%
				\vskip 12pt \@plus 3pt \@minus 1pt
	 }
\else
		 \def\@maketitle{%
			\newpage
			\null
			\begin{center}%
			\if@seti@handcarry
					\vspace{-0.25in}
					{\hfill\seti@papernumber\par}
					{\sffamily\scriptsize\seti@conference}
					\vskip1em
			\else
					\vskip\baselineskip
					\vskip1em
			\fi
			\let \footnote \thanks
				{\LARGE\bfseries \@title \par}%
				\vskip 1.5em%
				{\large
					\lineskip .5em%
					\begin{tabular}[t]{c}%
						\@author
					\end{tabular}\par}%
			\end{center}%
			\par
			\vskip 1.5ex}
\fi

\setlength\hfuzz{2pt}
\fancyhf{}% clear defaults
\renewcommand{\headrulewidth}{0pt}% turn off default headrule

\if@seti@handout
		\fancypagestyle{plain}{%
		 \fancyhf{}% clear defaults
		 \renewcommand{\headrulewidth}{0pt}% turn off default headrule
		 \lhead{\sffamily\scriptsize\seti@conference}
		 \cfoot{\sffamily\scriptsize\seti@printing}
		}
\fi

\cfoot{
		\if@seti@handout
				\scriptsize\scshape
		\else
				\footnotesize\normalfont
				%\tiny\normalfont
		\fi		
		%\thepage\ of \pageref{LastPage}\\
		%\rule[.2\baselineskip]{0.5in}{0.2pt}\\
		\if@seti@submit
					\seti@submitinfo
		\else
				 \if@seti@handout
							\ifx\seti@papernumber\@empty
									\relax
							\else
									seti Paper \seti@papernumber
							\fi
				 \else
							 %SETI - ``Semin\'{a}rio Embraer de Tecnologia e Inova\c{c}\~{a}o''
							 \scriptsize{EMBRAER Proprietary Information - Use or disclosure of this information is subject to the restriction on the title page.}
							 %\ifx\seti@papernumber\@empty
							 %			\relax
							 %\else
							 %			\if@seti@handcarry Paper \seti@papernumber\fi
							 %\fi
				 \fi
		\fi
}
\pagestyle{fancy}
%\pagenumbering{gobble}
\setkeys{Gin}{width=\linewidth,totalheight=\textheight,keepaspectratio}
\setlength{\extrarowheight}{2pt}

\if@seti@handout
		 \renewenvironment{abstract}%
				 {\footnotesize\quotation\sffamily\slshape}%
				 {\normalfont\endquotation\normalsize}
\else
		 \renewenvironment{abstract}%
				 {\small\quotation\bfseries}%
				 {\normalfont\endquotation\normalsize}
\fi

\long\def\@makecaption#1#2{%
			\vskip\abovecaptionskip
			\sbox\@tempboxa{\scriptsize\bfseries #1.~~#2}%
			\ifdim \wd\@tempboxa >\hsize
				\scriptsize\bfseries #1.~~#2\par
			\else
				\global \@minipagefalse
				\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
			\fi
			\vskip\belowcaptionskip}
\setlength\belowcaptionskip{5pt plus 1pt minus 1pt}

\if@seti@handout
		\setcounter{secnumdepth}{1}
\else
		 \renewcommand\thesection      {\@Roman\c@section}
		 \renewcommand\thesubsection   {\thesection.\@Alph\c@subsection}
		 \renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
		 \renewcommand\theparagraph    {\thesubsubsection.\@alph\c@paragraph}
		 \renewcommand\thesubparagraph {\theparagraph.\@roman\c@subparagraph}
		 \setcounter{secnumdepth}{3}% no counters \paragraph and below
\fi

\if@seti@handout\relax\else
		\def\@seccntformat#1{\csname the#1\endcsname.\quad}
\fi

\if@seti@handout
		 \renewcommand\section{\@startsection {section}{1}{\z@}%
																					{-2.2ex \@plus -0.5ex \@minus -0.1ex}%
																					{1.1ex \@plus.1ex}%
																					{\normalfont\normalsize%
																					 \Large\bfseries\slshape}}
		 \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
																						{-1.625ex\@plus -0.5ex \@minus -0.1ex}%
																						{0.75ex \@plus 0.1ex}%
																						{\normalfont\normalsize\large\slshape}}
		 \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
																							 {-1.5ex\@plus -0.4ex \@minus -0.1ex}%
																							 {0.65ex \@plus 0.1ex}%
																							 {\normalfont\normalsize\slshape}}
		 \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
																					 {2.25ex \@plus1ex \@minus.2ex}%
																					 {-1em}%
																					 {\normalfont\normalsize\slshape}}
		 \renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
																							{2.25ex \@plus1ex \@minus .2ex}%
																							{-1em}%
																							{\normalfont\normalfont}}
\else
		 \renewcommand\section{\@startsection {section}{1}{\z@}%
																					{3.5ex \@plus -1ex \@minus -.2ex}%
																					{2.3ex \@plus.2ex}%
																					{\center\normalfont\large\bfseries}}
		 \renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
																						{-3.25ex\@plus -1ex \@minus -.2ex}%
																						{1.5ex \@plus .2ex}%
																						{\normalfont\normalsize\bfseries}}
		 \renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
																							 {-3.25ex\@plus -1ex \@minus -.2ex}%
																							 {1.5ex \@plus .2ex}%
																							 {\normalfont\normalsize\itshape}}
		 \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
																					 {2.25ex \@plus1ex \@minus.2ex}%
																					 {-1em}%
																					 {\normalfont\normalsize\scshape}}
		 \renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
																							{2.25ex \@plus1ex \@minus .2ex}%
																							{-1em}%
																							{\normalfont\normalfont}}
\fi

\if@seti@handout\relax\else
		 \renewcommand{\@biblabel}[1]{$^{#1}$}
		 \renewenvironment{thebibliography}[1]%
					 {\section*{\refname\@mkboth{\MakeUppercase\refname}%
																			 {\MakeUppercase\refname}}%
						\list{\@biblabel{\@arabic\c@enumiv}}%
								 {\setlength{\leftmargin}{0pt}%
									\settowidth{\labelwidth}{\@biblabel{#1}}%
									\setlength{\itemindent}{\parindent}%
									\advance\itemindent by \labelwidth%
									\setlength{\labelsep}{0.0em}%
									\setlength{\itemsep}{-\smallskipamount}%
									\@openbib@code%
									\usecounter{enumiv}%
									\let\p@enumiv\@empty%
									\renewcommand\theenumiv{\@arabic\c@enumiv}%
									\footnotesize%
									}
						\sloppy\clubpenalty4000\widowpenalty4000%
						\sfcode`\.\@m}
						{\def\@noitemerr
							{\@latex@warning{Empty `thebibliography' environment}}%
						\endlist}
\fi

\if@seti@handout
		 \newcommand{\seti@captionfont}{\scriptsize\sffamily}
		 \newcommand{\seti@captionfill}{\seti@raggedright}
		 \long\def\@makecaption#1#2{%
					 \vskip\abovecaptionskip
					 \sbox\@tempboxa{\seti@captionfont\seti@captionfill #1: #2}%
					 \ifdim \wd\@tempboxa >\hsize
								{\seti@captionfont\seti@captionfill #1: #2\par}
					 \else
								\global \@minipagefalse
								\hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
					 \fi
						\vskip\belowcaptionskip}
\fi

\if@seti@handout
		 \renewenvironment{figure*}[1][htbp]
										{\@float{figure}[#1]
											\begin{adjustwidth}{}{-\seti@overhang}%
											 \begin{minipage}{\linewidth}}
										{  \end{minipage}%
											\end{adjustwidth}%
										 \end@float}
		 \renewenvironment{table*}[1][htbp]
										{\@float{table}[#1]
											\begin{adjustwidth}{}{-\seti@overhang}%
											 \begin{minipage}{\linewidth}}
										{  \end{minipage}%
											\end{adjustwidth}%
										 \end@float}
\fi

\if@seti@handout
			\providecommand\newthought[1]{\vspace{2\parsep}{\noindent\scshape #1}}
\fi

\if@seti@handout
		 \newenvironment{fullwidth}% uses [chngpage.sty]
					{\begin{adjustwidth}{}{-\seti@overhang}}%
					{\end{adjustwidth}}
\fi

\if@seti@handout
		 \newcommand{\sidenote}[2][0pt]%
			 {\footnotemark%
				\marginpar{\seti@marginfont
									 \vspace*{#1}
									 \textsuperscript{\thefootnote}%
									 \hspace{1pt}%
									 \seti@raggedright #2}%
			 }
\fi

\if@seti@handout
			\let\footnote\sidenote
\fi

\if@seti@handout
			 \newcommand{\marginfigure}[2][0pt]%
						{\marginpar{\def\@captype{figure}
												\seti@marginfont
												\vspace*{#1}
												\seti@raggedright #2}%
						}
\fi

\if@seti@handout
	 \newcommand{\margintable}[2][0pt]%
		{\marginpar{\def\@captype{table}
								\seti@marginfont
								\vspace*{#1}
								\seti@raggedright #2}%
		}
\fi
\AtBeginDocument{%
 \if@seti@handout
  \seti@raggedright%
  \setlength\parindent{1em}%
  \@ifundefined{wrapoverhang}{}% else wrapfig package loaded
    {\setlength{\wrapoverhang}{\seti@overhang}}
  \@ifundefined{captionnamefont}{}% else ccaption package loaded
    {\captionnamefont{\seti@captionfont}
     \captiontitlefont{\seti@captionfont}
     \captionstyle{\seti@raggedright}
    }
 \fi
 \if@seti@submit\onehalfspacing\fi
 \@ifundefined{TPT@hsize}{}{%
  \def\tablenotes{%
    \TPT@hsize
    \list{}%
         {\footnotesize\topsep4pt \partopsep\z@skip
          \itemsep2pt \parsep\z@ \itemindent\z@ \leftmargin1.5em
          \def\makelabel##1{\tnote{##1}\hfil}\labelwidth0.5em\labelsep1pt%
          \relax}}
 }%
 \@ifundefined{nomgroup}{}{%
  \RequirePackage{ifthen}% for typesetting groups within nomenclature
  \setlength{\nomitemsep}{-\parsep}
  \renewcommand{\nomgroup}[1]{%
   \medskip%
   \ifthenelse{\equal{#1}{A}}%
    {\relax}%
    {\ifthenelse{\equal{#1}{G}}%
      {\item []\hspace*{-\leftmargin}%
       \emph{Symbols}\hfill\smallskip}%
      {\ifthenelse{\equal{#1}{B}}%
        {\item []\hspace*{-\leftmargin}%
         \emph{Subscripts}\hfill\smallskip}%
        {\ifthenelse{\equal{#1}{C}}%
          {\item []\hspace*{-\leftmargin}%
           \emph{Conventions}\hfill\smallskip}%
          {\ifthenelse{\equal{#1}{T}}%
            {\item []\hspace*{-\leftmargin}%
             \emph{Superscripts}\hfill\smallskip}{}%
          }%
        }%
      }%
    }%
  }% \nomgroup
 }% @ifundefined
}% \AtBeginDocument
\endinput
%%
%% End of file `seti-tc.cls'.
