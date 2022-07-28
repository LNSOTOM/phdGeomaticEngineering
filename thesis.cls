\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2020/11/10 UTAS Honours Thesis]

\LoadClass[a4paper, 12pt]{report}

% Other packages
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage[marginpar=25mm, left=45mm, right=20mm]{geometry}
\RequirePackage{graphicx}
\RequirePackage[longnamesfirst]{natbib}
\RequirePackage{fancyhdr}
\RequirePackage{datetime}
\RequirePackage{booktabs}
\RequirePackage{tabularx}
\RequirePackage{amsmath}
\RequirePackage{setspace}
\RequirePackage{cellspace}
\RequirePackage{enumerate}
\RequirePackage{parskip}
\RequirePackage{framed}
\RequirePackage{environ}
\RequirePackage{contour}
\RequirePackage[normalem]{ulem}
\RequirePackage{kotex}
\RequirePackage{listings}
\RequirePackage{epstopdf}
\RequirePackage{rotating}
\RequirePackage[hidelinks=true]{hyperref}



% Equations
\counterwithout{equation}{chapter}

% Headers and Footers
\renewcommand{\chaptermark}[1]{\markboth{#1}{#1}}
\fancypagestyle{header-footer}{%
	\fancyhf{}
	\fancyhead[R]{\leftmark}
	\fancyfoot[C]{\thepage}
	\renewcommand{\headrulewidth}{0.4pt}
	\renewcommand{\footrulewidth}{0.4pt}
	\ifdrafting
		\fancyfoot[R, L]{DRAFT COPY}
	\fi
}

\renewcommand{\footnotetext}[2]{%
  \fancypagestyle{footnotes}{
  	\fancyfoot{}
    \fancyfoot[LO,RE]{\parbox{\textwidth}{\footnotemark[#1]\footnotesize #2}}
  }
  \thispagestyle{footnotes}
}

% Redefine the plain page style
\fancypagestyle{plain}{%
	\fancyhf{}
	\fancyfoot[C]{\thepage}
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0.4pt}
	\ifdrafting
		\fancyfoot[R, L]{DRAFT COPY}
	\fi
}

% Drafting
\newif\ifdrafting
\newcommand{\drafting}{%
	\draftingtrue
	\ifdrafting
		\fancyfoot[R, L]{DRAFT COPY}
		\geometry{left=32.5mm, right=32.5mm}
	\fi
}

\newcommand{\info}[1]{\ifdrafting\textit{\color{magenta}#1}\fi}
\newcommand{\temp}[1]{\ifdrafting\textit{\color{blue}#1}\fi}
\newcommand{\crit}[1]{\ifdrafting\textit{\color{red}#1}\fi}
\newcommand{\note}[1]{\ifdrafting\textit{\color{orange}#1}\fi}

% Editing
\newif\ifhighlight
\newcommand{\highlight}{%
	\highlighttrue
}
\newenvironment{good}[0]{
\ifdrafting\ifhighlight\colorlet{shadecolor}{OliveGreen!50}\begin{shaded}\fi\fi
}{\ifdrafting\ifhighlight\end{shaded}\fi\fi}

\newenvironment{okay}[0]{
\ifdrafting\ifhighlight\colorlet{shadecolor}{Goldenrod!50}\begin{shaded}\fi\fi
}{\ifdrafting\ifhighlight\end{shaded}\fi\fi}

\newenvironment{bad}[0]{
\ifdrafting\ifhighlight\colorlet{shadecolor}{orange!50}\begin{shaded}\fi\fi
}{\ifdrafting\ifhighlight\end{shaded}\fi\fi}

\newenvironment{verybad}[0]{
\ifdrafting\ifhighlight\colorlet{shadecolor}{red!50}\begin{shaded}\fi\fi
}{\ifdrafting\ifhighlight\end{shaded}\fi\fi}

% Line height
\renewcommand{\baselinestretch}{1.5}
\setlength{\parskip}{12pt}

% Color printing
\newif\ifcolorprint
\newcommand{\colorprint}{%
	\colorprinttrue
}

% Underlining
\renewcommand{\ULdepth}{1.8pt}
\contourlength{0.8pt}

\renewcommand{\underline}[1]{%
  \uline{\phantom{#1}}%
  \llap{\contour{white}{#1}}%
}

% Table of Contents
\setcounter{tocdepth}{1}

% Tables
\setlength\cellspacetoplimit{0.8ex}

% Cover page
\renewcommand{\title}[1]{\def\@thetitle{#1}}
\renewcommand{\author}[1]{\def\@theauthor{#1}}
\newcommand{\degree}[1]{\def\@thedegree{#1}}
\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\begin{center}
		\textbf{{\Large\@thetitle}\\
		by\\
		\@theauthor}
		\vfill
		\@thedegree\\
		\vfill
		\ifcolorprint
			\includegraphics[width=0.3\textwidth]{assets/uniTas.jpg}
		\else
			\includegraphics[width=0.3\textwidth]{assets/utas-logo-color.png}
		\fi
		\vfill
		\textbf{University of Tasmania}\\
		\textbf{\monthname, \the\year}
	\end{center}
	\newpage
	\ifdrafting\else\statementoforiginality\fi
}

% Disclaimer page
\newcommand{\statementoforiginality}{
	\noindent
	This thesis contains no material which has been accepted for the award of any other degree or diploma in any tertiary institution, and to my knowledge and belief, this thesis contains no material previously published or written by another person except where due reference is made in the text of the thesis.
	
	\vspace{2em}
	% \hfill\includegraphics[width=0.2\textwidth]{assets/signature}
	\newpage
}

% Contents Page
\newcommand{\contentspage}{%
	\tableofcontents
	\thispagestyle{empty}
	\clearpage
}

% Appendices
\newcommand{\appendixnumberline}[1]{Appendix\space}
\fancypagestyle{appendix}{%
	\fancyhead[R]{APPENDICES}
}
\let\oldappendix\appendix
\makeatletter
\renewcommand{\appendix}{%
	\chapter*{Appendices}
	\pagestyle{appendix}
	\addcontentsline{toc}{chapter}{Appendices}
	\renewcommand{\thesection}{\Alph{section}}%
	\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}%
	\oldappendix
}
\makeatother

% Code Files
\definecolor{deepblue}{rgb}{0,0,0.5}
\definecolor{deepred}{rgb}{0.6,0,0}
\definecolor{deepgreen}{rgb}{0,0.5,0}
\lstset{
	language=Python,
	basicstyle=\ttfamily,
	otherkeywords={self},             			% Add keywords here
	keywordstyle=\ttfamily\color{deepblue},
	emph={MyClass,__init__,None,True,False},    % Custom highlighting
	emphstyle=\ttfamily\color{deepred},    		% Custom highlighting style
	stringstyle=\color{deepgreen},
	commentstyle={\scshape\color{darkgray}},
	showstringspaces=false,           			
	breaklines=true,
	lineskip=.1cm
}
\newcommand{\codefile}[1]{{\footnotesize\lstinputlisting{#1}}}

% Bibliography
\renewcommand\bibname{References}
\bibliographystyle{kluwer}
\fancypagestyle{bibliography}{%
	\fancyhead[R]{BIBLIOGRAPHY}
}
\let\oldbibliography\bibliography
\makeatletter
\renewcommand{\bibliography}[1] {%
	\begingroup
	    \fontsize{10pt}{10pt}\selectfont
	    \thispagestyle{appendix}
	    \pagestyle{bibliography}
	    \addcontentsline{toc}{chapter}{References}
     
		\oldbibliography{#1}
	\endgroup
}
\makeatother
