\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fhw}[Homework latex template made by FHVirus]

\LoadClass[12pt]{article}

%--------------------------------------------------

\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\XeTeXlinebreaklocale "zh"
\XeTeXlinebreakskip = 0pt plus 1pt

\setmainfont{GenYoMinTW-R}
\setsansfont{GenYoGothicTW-R}
\setmonofont{NotoSansMono-Regular}

\setCJKmainfont{NotoSerifCJKtc-Regular}
\setCJKsansfont{NotoSansCJKtc-Regular}
\setCJKmonofont{NotoSansMonoCJKtc-Regular}

\RequirePackage[onehalfspacing]{setspace}

%--------------------------------------------------

\RequirePackage{amssymb}
\RequirePackage{amsmath}
\RequirePackage{yhmath}
\RequirePackage{mathtools}
\RequirePackage{esint} % for \oiint
\RequirePackage{mleftright}
\mleftright

\makeatletter
\newcommand{\@renewmid}{\renewcommand{\mid}{%
		\mathclose{}%
		\mathchoice{\;}{\;}{\,}{\,}%
		\delimsize\vert%\allowbreak
		\mathchoice{\;}{\;}{\,}{\,}%
		\mathopen{}%
}}
% tex.stackexchange.com/a/43009
\DeclarePairedDelimiter{\@abs}{\lvert}{\rvert}
\DeclarePairedDelimiter{\@ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\@floor}{\lfloor}{\rfloor}
\DeclarePairedDelimiter{\@angle}{\langle}{\rangle}
\DeclarePairedDelimiter{\@norm}{\lVert}{\rVert}
\DeclarePairedDelimiterX{\@set}[1]{\{}{\}}{\@renewmid#1}
\DeclarePairedDelimiterX{\@Set}[1]{\{}{\}}{\@renewmid\nonscript\,#1\nonscript\,} % \nonscript suppresses \, in (script)script style

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
\RequirePackage[parfill]{parskip}
% \RequirePackage{microtype}

%--------------------------------------------------

\RequirePackage{titlesec}               % 設定 section 等的字體
\RequirePackage{titling}                % 加強 title 功能
\RequirePackage{fancyhdr}               % 頁首頁尾
\makeatletter %\@title only usable after this
\setlength{\headwidth}{\paperwidth-\Gm@lmargin-\Gm@rmargin}
\pagestyle{fancy}
\fancyhf{}
\lhead{\@CourseName\;|\;\@title}
\rhead{\@ID\;\@author}
\cfoot{\thepage}
\makeatother

%--------------------------------------------------

\RequirePackage{tikz}
\RequirePackage{tikzpagenodes}
\usetikzlibrary{calc}

\makeatletter
\newcommand{\DeclareVariable}[1]{
	\expandafter\DeclareRobustCommand\csname#1\endcsname[1]{
		\expandafter\gdef\csname @#1\endcsname{##1}
	}
}
\DeclareVariable{CourseID}
\DeclareVariable{CourseName}
\DeclareVariable{ID}

\newcommand{\HeaderFillSize}{5cm}
\def\@maketitle{%
	\newpage%
	\begingroup%
	\begin{tikzpicture}[ remember picture, overlay ]%
		\fill[%
			shading = axis,rectangle, top color=My0, bottom color=My0!30!My4,%
			] (current page.north west) rectangle ($(current page.north east) + (0, -\HeaderFillSize)$);%
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

\RequirePackage{xurl}
\RequirePackage{hyperref}
\RequirePackage[capitalize,nameinlink,noabbrev]{cleveref}

\hypersetup{
	urlbordercolor=black,
	linkbordercolor=black,
  pdfborderstyle={/S/U/W 0.5}
}

%--------------------------------------------------

\RequirePackage{amsthm}

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

%--------------------------------------------------

\RequirePackage[newfloat]{minted}
\RequirePackage{caption}
\RequirePackage{algorithm}              % for psuedo code
\RequirePackage{algpseudocode}
\RequirePackage{mdframed}

\mdfdefinestyle{CodeBlock}{
	innerleftmargin=28pt,
	innerbottommargin=0pt,
	hidealllines=true,
}

\usemintedstyle{nord}

\renewcommand{\theFancyVerbLine}{
	\textcolor{nord01}{\footnotesize\arabic{FancyVerbLine}}
}

\newenvironment{code}{\captionsetup{type=listing}}{}
\SetupFloatingEnvironment{listing}{name=Code}
\crefname{listing}{Code}{Codes}

\newcommand{\Code}[5][]{
	\begin{code}
		\begin{spacing}{1}
			\begin{mdframed}[style=CodeBlock]
				\parskip=0pt
				\inputminted[
				bgcolor=nord01,
				% frame=leftline,
				tabsize=2,
				obeytabs,
				linenos,
				mathescape,
				fontsize=\footnotesize,
				numbersep=0pt,
				#1
				]{#2}{#3}
			\end{mdframed}
			\caption{#4}
			\label{code:#5}
		\end{spacing}
	\end{code}
}

%--------------------------------------------------

\RequirePackage{graphicx}

\newcommand{\Image}[3]{
	\begin{figure}[htpb]
		\centering
		\includegraphics[width=0.8\textwidth]{#1}
		\caption{#2}
		\label{img:#3}
	\end{figure}
}

%--------------------------------------------------

\makeatletter
\newcounter{problem}
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

\RequirePackage{enumerate}
\renewcommand\labelitemi{\raisebox{.2ex}{$\bullet$}}
\RequirePackage{ulem}
\RequirePackage{enumerate}
\RequirePackage{tabularx}
\RequirePackage{siunitx}
\RequirePackage{ytableau}
\RequirePackage{halloweenmath}

%--------------------------------------------------
