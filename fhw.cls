\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fhw}[Homework latex template made by FHVirus]

\LoadClass[12pt]{article}

%--------------------------------------------------

\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

% GenYo(G) fonts fit with Noto Serif/Sans CJK better and
% supports more rare CJK punctuations.
% https://github.com/ButTaiwan/genyo-font
% https://github.com/ButTaiwan/genyog-font
\setmainfont[AutoFakeSlant=.2]{GenYoMinTW-R}
\setsansfont[AutoFakeSlant=.2]{GenYoGothicTW-R}
\setmonofont[AutoFakeSlant=.2]{NotoSansMono-Regular}

% However, GenYo(G) fonts do not display my name right,
% so I still use Noto for CJK characters.
\setCJKmainfont[AutoFakeSlant=.2]{NotoSerifCJKtc-Regular}
\setCJKsansfont[AutoFakeSlant=.2]{NotoSansCJKtc-Regular}
\setCJKmonofont[AutoFakeSlant=.2]{NotoSansMonoCJKtc-Regular}

\RequirePackage[onehalfspacing]{setspace}

%--------------------------------------------------

\RequirePackage{lmodern}    % https://tex.stackexchange.com/a/621536/290605
\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{yhmath}
\RequirePackage{mathtools}
\RequirePackage{esint}      % for \oiint
\RequirePackage{physics}    % for \eval
\RequirePackage{mleftright} % for removing extra spaces around \left and \right
\mleftright

\makeatletter
\newcommand{\@renewmid}{\renewcommand{\mid}{%
		\mathclose{}%
		\mathchoice{\;}{\;}{\,}{\,}%
		\delimsize\vert%
		\mathchoice{\;}{\;}{\,}{\,}%
		\mathopen{}%
}}

% tex.stackexchange.com/a/43009
\DeclarePairedDelimiter{\@abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\@ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\@floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\@inner}{\langle}{\rangle}
\DeclarePairedDelimiter{\@norm}{\lVert}{\rVert}
\DeclarePairedDelimiterX{\@set}[1]{\{}{\}}{\@renewmid#1}

\def\abs{\@ifstar{\@abs}{\@abs*}}
\def\ceil{\@ifstar{\@ceil}{\@ceil*}}
\def\floor{\@ifstar{\@floor}{\@floor*}}
\def\inner{\@ifstar{\@inner}{\@inner*}} \def\norm{\@ifstar{\@norm}{\@norm*}}
\def\set{\@ifstar{\@set}{\@set*}}
\def\Set{\@ifstar{\@Set}{\@Set*}}
\makeatother

\mathcode`\*="8000 {\catcode`\*\active\gdef*{\cdot}}

\newcommand{\N}{\mathbb N}
\newcommand{\Z}{\mathbb Z}
\newcommand{\Q}{\mathbb Q}
\newcommand{\R}{\mathbb R}
\newcommand{\C}{\mathbb C}
\newcommand{\contra}{\rightarrow\!\leftarrow}

%--------------------------------------------------

% Mostly unused.
\RequirePackage{xcolor}
\definecolor{nord00}{HTML}{2e3440}
\definecolor{nord01}{HTML}{3b4252}
\definecolor{nord02}{HTML}{434c5e}
\definecolor{nord03}{HTML}{4c566a}
\definecolor{nord04}{HTML}{d8dee9}
\definecolor{nord05}{HTML}{e5e9f0}
\definecolor{nord06}{HTML}{eceff4}
\definecolor{nord07}{HTML}{8fbcbb}
\definecolor{nord08}{HTML}{88c0d0}
\definecolor{nord09}{HTML}{81a1c1}
\definecolor{nord10}{HTML}{5e81ac}
\definecolor{nord11}{HTML}{bf616a}
\definecolor{nord12}{HTML}{d08770}
\definecolor{nord13}{HTML}{ebcb8b}
\definecolor{nord14}{HTML}{a3be8c}
\definecolor{nord15}{HTML}{b48ead}
\definecolor{My0}{HTML}{021D5F}
\definecolor{My1}{HTML}{283C7E}
\definecolor{My2}{HTML}{4E5B9C}
\definecolor{My3}{HTML}{747ABB}
\definecolor{My4}{HTML}{9A98D9}
\definecolor{mygray}{gray}{0.9}

%--------------------------------------------------

\RequirePackage{geometry}
\geometry{
	% showframe,
	a4paper,
	ignorefoot,
	ignorehead,
	hmargin=2cm,
	vmargin=2cm,
	headsep=5mm,
	footskip=2\baselineskip,
	footnotesep=8mm,
}
\RequirePackage[parfill]{parskip} % substitute spaces for indent before paragraph.

%--------------------------------------------------

\RequirePackage{titling}
\RequirePackage{fancyhdr} % for fancy header/footer

\makeatletter
\newcommand{\DeclareVariable}[1]{
	\expandafter\DeclareRobustCommand\csname#1\endcsname[1]{
		\expandafter\gdef\csname @#1\endcsname{##1}
	}
}
\DeclareVariable{CourseID}
\DeclareVariable{CourseName}
\DeclareVariable{ID}

\setlength{\headwidth}{\paperwidth-\Gm@lmargin-\Gm@rmargin}
\pagestyle{fancy}
\fancyhf{}
\lhead{\@CourseName\;|\;\@title}
\rhead{\@ID\;\@author}
\cfoot{\thepage}
\makeatother

%--------------------------------------------------

% For printing, I prefer to use black & white scheme
% and a header that doesn't fill to the edge of the page

\colorlet{HeaderTopColor}{My0}%
\newcommand{\NoPrint}{
  \usemintedstyle{nord}
  \colorlet{CodeTextColor}{nord06}
  \colorlet{CodeBGColor}{nord01}
  \setminted{bgcolor=CodeBGColor}
  \colorlet{HeaderBottomColor}{My0!30!My4}%
  \providecommand{\HeaderTopMargin}{0cm}
  \providecommand{\HeaderSideMargin}{0cm}
}
\providecommand{\YesPrint}{
  \usemintedstyle{bw}
  \colorlet{CodeTextColor}{black}
  \colorlet{CodeBGColor}{mygray}
  \setminted{bgcolor=CodeBGColor}
  \colorlet{HeaderBottomColor}{My0}%
  \providecommand{\HeaderTopMargin}{1cm}
  \providecommand{\HeaderSideMargin}{1.5cm}
}

%--------------------------------------------------

\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\usetikzlibrary{calc}

\makeatletter
\newcommand{\HeaderFillSize}{5cm}
\def\@maketitle{%
	\newpage%
	\begingroup%
	\begin{tikzpicture}[ remember picture, overlay ]%
		\fill[%
			shading = axis,rectangle, top color=HeaderTopColor, bottom color=HeaderBottomColor,%
			] ($(current page.north west) + (+\HeaderSideMargin, -\HeaderTopMargin)$) rectangle ($(current page.north east) + (-\HeaderSideMargin, -\HeaderFillSize)$);%
		\coordinate (BottomLeft) at ($(current page text area.north west) + (0, -3cm)$);
		\node[%
			anchor=north west,%
			font=\LARGE\rmfamily\bfseries,%
			text=white,%
			] (title) at ([yshift=1cm+\baselineskip]BottomLeft) {\@CourseName\;|\;\@title};%
		\node[%
			anchor=north west,%
			font=\rmfamily\scshape,%
			text=white,%
			] (courseID) at ([yshift=\baselineskip]title.north west) {\@CourseID};
		\node[%
			anchor=north east,%
			font=\rmfamily\large,%
			minimum height=\baselineskip,%
			text=white,%
			] (author) at ([xshift=\textwidth,yshift=\HeaderFillSize+\topmargin]BottomLeft) {\@ID\;\@author};%
		\node[%
			anchor=north east,%
			font=\rmfamily\large,%
			minimum height=\baselineskip,%
			text=white,%
			] (date) at ([yshift=-1.5\baselineskip]author.north east) {\number\year/\number\month/\number\day};%
	\end{tikzpicture}%
	\vspace{3cm}%
	\endgroup%
}
\makeatother

%--------------------------------------------------

\RequirePackage{xurl} % make url break almost everywhere
\RequirePackage{hyperref}

\hypersetup{
	urlbordercolor=black,
	linkbordercolor=black,
  pdfborderstyle={/S/U/W 0.5}
}

%--------------------------------------------------

\RequirePackage{amsthm}
\RequirePackage[capitalize,nameinlink,noabbrev]{cleveref}

% Each type of theorem (Theorem, Lemma, Observation...) has independent numbering
% and ignores sections, if you want them to use the same counter,
% please take a look at aliascnt package.

\newcommand*{\NewTheorem}[1]{
	\expandafter\providecommand\csname#1autorefname\endcsname{\MakeUppercase#1}
	\crefname{#1}{ {\MakeUppercase#1} }{{\MakeUppercase#1}s}
	\newtheorem{#1}{\MakeUppercase#1}
	\newtheorem*{#1*}{\MakeUppercase#1}
}

\newtheoremstyle{myStyle}{}{}{\hangindent=1.5em}{\parindent}{\bfseries}{}{.8em}{%
	\thmname{#1}%
	\thmnumber{ #2.}%
	\thmnote{ \bfseries{(#3)}}%
}

\theoremstyle{myStyle}
\NewTheorem{corollary}
\NewTheorem{lemma}
\NewTheorem{observation}
\NewTheorem{theorem}
\NewTheorem{claim}

%--------------------------------------------------

% newfloat for captioning.
% ref: https://tex.stackexchange.com/a/254177/290605
\RequirePackage[newfloat]{minted}
\RequirePackage{caption}
\RequirePackage{algorithm}
\RequirePackage[noend]{algpseudocode}
\RequirePackage{algorithmicx}
\RequirePackage{mdframed}

\makeatletter
\algrenewcommand\ALG@beginalgorithmic{\fontfamily{lmr}\selectfont\relax}
\makeatother

\mdfdefinestyle{CodeBlock}{
	innerleftmargin=28pt,
	innerbottommargin=0pt,
	hidealllines=true,
}

% Line number font style
\renewcommand{\theFancyVerbLine}{
	\textcolor{nord01}{\footnotesize\arabic{FancyVerbLine}}
}

\newenvironment{codeblock}{\captionsetup{type=listing}}{}
\SetupFloatingEnvironment{listing}{name=Code}
\crefname{listing}{Code}{Codes}

% https://tex.stackexchange.com/a/380279/290605
% https://tex.stackexchange.com/a/42398/290605
% https://github.com/gpoore/minted/issues/72
% the \color inside \mdframed is for a weird bug
% that the text color doesn't do as we wish

\setminted{
  tabsize=2,
  obeytabs,
  mathescape,
  fontsize=\footnotesize,
  numbersep=0pt,
  breaklines,
  breakafter={,},
}

% \Code[additional minted formatting]{lang}{file}{caption}{label}
\newcommand{\CodeFile}[5][]{
	\begin{codeblock}
		\begin{spacing}{1}
			\begin{mdframed}[style=CodeBlock]
				\parskip=0pt
        \color{CodeTextColor}
				\inputminted[
        linenos, #1
				]{#2}{#3}
			\end{mdframed}
			\caption{#4}
			\label{code:#5}
		\end{spacing}
	\end{codeblock}
}

\newenvironment{Code}[2][]
{\VerbatimEnvironment%
  \begin{codeblock}
    \begin{spacing}{1}
      \parskip=0pt
      \color{CodeTextColor}
      \begin{minted}[#1]{#2}%
}%
{%
				\end{minted}
		\end{spacing}
	\end{codeblock}
}

% https://github.com/gpoore/minted/issues/84#issuecomment-133397860
% fix mintinline text color
\makeatletter
\renewrobustcmd{\mintinline}[2][]{%
  \begingroup
  \color{CodeTextColor}%  <<---- Fix color
  \setboolean{minted@isinline}{true}%
  \minted@configlang{#2}%
  \setkeys{minted@opt@cmd}{#1}%
  \minted@fvset
  \begingroup
  \let\do\@makeother\dospecials
  \catcode`\{=1
  \catcode`\}=2
  \catcode`\^^I=\active
  \@ifnextchar\bgroup
    {\minted@inline@iii}%
    {\catcode`\{=12\catcode`\}=12
      \minted@inline@i}}
\makeatother

% https://github.com/gpoore/minted/issues/31#issuecomment-373579402
% fix mintinline breakline
\setlength{\rightskip}{0pt plus 1 fil}

%--------------------------------------------------

\RequirePackage{graphicx}

% \Image[size in \textwidth s]{file}{caption}{label}
\newcommand{\Image}[4][0.8]{
	\begin{figure}[htpb]
		\centering
		\includegraphics[width=#1\textwidth]{#2}
		\caption{#3}
		\label{img:#4}
	\end{figure}
}

%--------------------------------------------------

% From https://github.com/gijs-pennings/latex-homework
% I don't really know how it works
% but it works

\makeatletter \newcounter{problem}
\providecommand{\problemname}{Problem}

\let\problemmark\@gobble
\let\toclevel@problem\toclevel@section % for PDF bookmarks

% disables numbering for problems, for both actual headers and in TOC
\def\l@problem#1#2{\begingroup\let\numberline\@gobble\l@section{#1}{#2}\endgroup} % tex.stackexchange.com/a/62117
\def\@nonumsproblem{}
\def\@seccntformat#1{% www.texfaq.org/FAQ-seccntfmt
	\ifcsname @nonums#1\endcsname\else
		\csname the#1\endcsname\quad% default behavior for other section types, from ltsect.dtx
	\fi
}

% Modified to use subsection style instead of section.
\newcommand{\@problemsection}{
\@startsection{problem}{2}{-.5ex}%\z@}
	{-3.25ex\@plus -1ex \@minus -.2ex}
	{1.5ex \@plus .2ex}
	{\normalfont\large\bfseries}
}

\newcommand*{\@problem}[1][\@nil]{% tex.stackexchange.com/a/217763
	\def\@arg{#1}
	\begingroup\edef\x{\endgroup% expands problem counter for \nameref: tex.stackexchange.com/a/569405
		\noexpand\@problemsection{
			\problemname{} % note: space
			\ifx\@arg\@nnil\the\numexpr\value{problem}+1\else#1\fi%
		}
	}\x
}
\newcommand{\problem}{\@ifstar{
		\@problem
	}{
		\ifnum\theproblem>0\newpage\fi
		\@problem
}}
\makeatother

%--------------------------------------------------

\RequirePackage{enumerate}                           % for numbering like (a)
\renewcommand\labelitemi{\raisebox{.2ex}{$\bullet$}} % fix tiny bullet
\RequirePackage{ulem}                                % for \sout{} and more
\RequirePackage{tabularx}                            % for better tabular
\RequirePackage{siunitx}                             % units for phys. homework
\RequirePackage{ytableau}                            % for pretty tableau diagram
\RequirePackage{halloweenmath}                       % for cuteness & fun

%--------------------------------------------------
