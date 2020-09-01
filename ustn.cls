%%
%% This is file `ustn.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% listok.dtx  (with options: `common,ustn')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2018 by Ilya
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either
%% version 1.3 of this license or (at your option) any later
%% version.  The latest version of this license is in:
%% 
%%    http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3 or later is part of all distributions of
%% LaTeX version 2005/12/01 or later.
%% 
\NeedsTeXFormat{LaTeX2e}[2005/12/01]
\ProvidesClass{ustn}
    [2019/01/09 v2.1  Наши крутые шаблоны для листков]
\RequirePackage{kvoptions}
\newcommand{\@paperfile}{}
\DeclareOption{a4paper}{\renewcommand{\@paperfile}{a4.clo}}
\DeclareOption{a5paper}{\renewcommand{\@paperfile}{a5.clo}}
\DeclareStringOption[\DTMToday]{date}
\DeclareStringOption[1]{num}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\ProcessKeyvalOptions*
\LoadClass{article}
\input{\@paperfile}
\RequirePackage{iftex}
\ifLuaTeX
    \input{lua.clo}
\else
    \input{pdf.clo}
\fi
\RequirePackage[russian]{babel}
\RequirePackage[inline]{enumitem}
\RequirePackage{textcomp, multicol}
\RequirePackage{mathtext}
\RequirePackage{indentfirst}
\RequirePackage{amsmath, amssymb, amsfonts, amsthm}
\RequirePackage{mathtools, mathabx}
\RequirePackage{epstopdf}
\RequirePackage{graphicx}
\RequirePackage{forloop}
\RequirePackage{datetime2}
\RequirePackage{microtype}
\relax
\tolerance 4000
\newcommand{\listok@name}{Фамилия, Имя}
\renewcommand{\maketitle}{%
    \begin{center}%
    {\Large \textit{\textbf{\underline{%
Устное собеседование
    }}}}
    \end{center}
}
\DTMsetup{datesep=.}
\DTMsetstyle{ddmmyyyy}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\renewcommand{\@oddhead}{
    \vbox{\hbox to\textwidth{\listok@name\hfil \strut
    \listok@date
    }\hrule}
}
\renewcommand{\@oddfoot}{}
\renewcommand{\emptyset}{\varnothing}
\renewcommand{\le}{\leqslant}
\renewcommand{\ge}{\geqslant}
\renewcommand{\epsilon}{\varepsilon}
\renewcommand{\phi}{\varphi}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Cx}{\mathbb{C}}
\renewcommand{\Re}[1]{\operatorname{Re}{#1}}
\renewcommand{\Im}[1]{\operatorname{Im}{#1}}
\newcommand{\Zm}[1]{\mathbb{Z}_{#1}}
\renewcommand{\Prob}[1]{\mathbb{P}\left [ #1 \right ]}
\newcommand{\ProbV}[2]{\mathbb{P}_{#1}\left [ #2 \right ]}
\DeclareMathOperator{\Expect}{\mathbb{E}}
\newcommand{\wdt}{\widetilde}
\newcommand{\pt}[1]{$\text{#1}^\circ$}
\newcommand{\point}{${}^\circ$}
\newcommand{\hard}{${}^\ast$}
\let\existssym\exists
\renewcommand*{\exists}[1]{\existssym #1~\;~}
\newcommand*{\existsone}[1]{\existssym! #1~\;~}
\let\forallsym\forall
\renewcommand*{\forall}[1]{\forallsym #1~\;~}
\newcommand{\closure}[2][3]{%
{}\mkern#1mu\overline{\mkern-#1mu#2}}
\renewenvironment{abstract}{\quotation\itshape\centering}{\endquotation}
\newtheorem{theorem}{Теорема}
\newtheorem*{theorem*}{Теорема}
\newtheorem{lemma}{Лемма}
\newtheorem*{lemma*}{Лемма}
\newtheorem{proposition}{Утверждение}
\newtheorem*{proposition*}{Утверждение}
\newtheorem{corollary}{Следствие}
\newtheorem*{corollary*}{Следствие}
\newtheoremstyle{mynote}{0pt}{0pt}{\normalfont}{}{\itshape}{}{ }{%
    \thmname{#1}\thmnumber{ #2}\textit{ к задаче \theproblem{}:}
}
\theoremstyle{mynote}
\newtheorem*{note}{Указание}
\newtheoremstyle{problem}{0pt}{0pt}{\normalfont}{}{\bfseries}{.}{ }{\thmname{#1}\thmnumber{ #2}\textit{#3}}
\theoremstyle{problem}
\newtheorem{example}{Пример}
\newtheorem*{example*}{Пример}
\newtheorem{problem}{Задача}
\newtheorem*{problem*}{Задача}
\newtheorem*{definition}{Определение}
\renewcommand \theproblem {%
\@arabic\c@problem
}
\renewcommand \theexample {%
\@arabic\c@example
}
\renewcommand \thetheorem {%
\@arabic\c@theorem
}
\newenvironment{vartab}[1]
{
    \begin{tabular}{*{#1}{|c} |c| } \hline
}{
    \end{tabular}
}
\newcounter{colidx}
\newcommand \conduit {

\vspace*{\fill}
\begin{center}
\begin{Large}
\begin{vartab}{\c@problem}
\hline
\forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{\; \arabic{colidx} \; &} \; $\Sigma$ \; \\ \hline
\forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\ \hline
\forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\ \hline
\forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\ \hline
\forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\
\forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\
\forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\ \hline
\end{vartab}
\end{Large}
\end{center}
}
\AddEnumerateCounter{\Asbuk}{\@Asbuk}{Ы}
\AddEnumerateCounter{\asbuk}{\@asbuk}{ы}
\setlist[itemize]{nosep, nolistsep}
\newlist{probenum}{enumerate}{1}
\newlist{probparts}{enumerate*}{1}
\setlist[enumerate]{nosep, nolistsep}
\setlist[probenum]{nosep, nolistsep, label = \textbf{(\asbuk*)}}
\setlist[probparts]{nosep, nolistsep, label = \textbf{(\asbuk*)}}
\newenvironment{multienum}[1]
{
    \begin{probenum}
    \begin{multicols}{#1}
}{
    \end{multicols}
    \end{probenum}
}
\endinput
%%
%% End of file `ustn.cls'.
