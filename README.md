Семейство классов listok ∗

Илья Райко

## rayko_i@179.ru

12 марта 2020 г.

Аннотация

Классы, используемый нашей командой для вёрстки листков.

- 1 Введение

## На данный момент у нас есть классы listok, written, ustn, test. listok используется для вёрстки листков,

## written и ustn используются для вёрстки письменных и устных собеседований, test используется для

- контрольных работ.

Разница между ними описана в следующей табличке

Заголовок

Задача

Пример

Теорема

## listok

Title

## test

\title{Title}

## written

## ustnTitle. Вариант №num … собеседование\begin{problem}[Text]

Задача num.problemText

Пример num.exampleText

Задача problemText

Пример exampleText

\begin{example}[Text]

\begin{theorem}[Text]

Теорема num.theorem (Text)

Теорема theorem (Text)

При этом у классов есть ещё некоторые индивидуальные особенности, которые будут описаны ниже.- 2 Параметры классов

- 2.1 Формат бумаги

1 (cid:104)common(cid:105)\RequirePackage{kvoptions}

2 (cid:104)common(cid:105)\newcommand{\@paperfile}{}

3 (cid:104)common(cid:105)\DeclareOption{a4paper}{\renewcommand{\@paperfile}{a4.clo}}

- С a4paper всё просто — напечатает одну копию на листе A4, ориентированном вертикально. Ширина

- текста будет 179mm, а высота 267mm. Текст выровнен по центру (вертикально и горизонтально).

4 (cid:104)∗a4(cid:105)

5 \RequirePackage[a4paper, width = 179mm, height = 267mm, footskip = 0mm, centering, includeheadfoot]{geometry}6 \PassOptionsToClass{a4paper,oneside}{article}

7 (cid:104)/a4(cid:105)

8 (cid:104)common(cid:105)\DeclareOption{a5paper}{\renewcommand{\@paperfile}{a5.clo}}

- Чуть сложнее с a5paper. Он нужен для того, чтобы напечать два вертикальных A5 на одном горизонталь-

- ном A4. Признаться честно, я уже забыл, что делают конкретные команды, но это, кажется, работает.

9 (cid:104)∗a5(cid:105)

- 10 \setlength\paperheight {210mm}

- 11 \setlength\paperwidth {148mm}

- 12 \PassOptionsToClass{a5paper,oneside}{article}

- 13 \RequirePackage{pgfpages}

∗

Этот документ относится к listok v2.1, от 2019/01/09

- 14 \RequirePackage{atbegshi}

- 15 \setlength\hoffset{.4in}

- 16 \setlength\oddsidemargin{-1in}

- 17 \setlength\textwidth{130mm}

- 18 \setlength\voffset{-25mm}

- 19 \setlength\textheight{185mm}

- 20 \pgfpagesuselayout{2 on 1}[a4paper,landscape,border shrink=5mm]

- 21 \AtBeginShipout{%

- 22 \pgfpagesshipoutlogicalpage{1}\copy\AtBeginShipoutBox%

- 23 \pgfpagesshipoutlogicalpage{2}\box\AtBeginShipoutBox%

- 24 \pgfshipoutphysicalpage%

- 25 }

- 26 (cid:104)/a5(cid:105)

- 2.2 Дата и номер листка

- date задаёт дату листочка в углу. Сейчас значение по умолчанию — сегодня. Бейте меня палками, если

- до сих пор не взлетает.

- 27 (cid:104)∗common(cid:105)

- 28 \DeclareStringOption[\DTMToday]{date}

- num — номер листочка. Влияет на номер задач.

- 29 \DeclareStringOption[1]{num}

- Все остальные опции передаются классу article.

- 30 \DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

- 31 \ProcessOptions

- 32 \ProcessKeyvalOptions*

- 33 \LoadClass{article}

- 34 \input{\@paperfile}

- 35 \RequirePackage{iftex}

- 3 Движки

- Вот тут начинается цирк с движками. Проблема заключается в том, что традиционный Web2C движок

- использует кодировки отличные от utf8 (OT2, T2A, T2B, T2C, etc.) Чем это плохо? В OT2 был очень

- странный порядок сортировки кириллических букв (Э, Ю, Ж, Й, Ё, Я, А, Б, Ц, Д, Е, Ф и т.д.), что

- выливается в отвратительные списки и предметные указатели.

Даже игнорируя это факт, мы получаем две проблемы: старый Web2C движок генерирует странный- слой текст в pdf (зюковки и кракозябры вместо русского текста), можно использовать только шрифты

- поддерживающие кодировки T2. Проблемы в том, что был только один такой шрифт, в котором русские

- буквы имеют равную высоту. Этот шрифт распространялся пакетом pscyr, который не обновляется

- с конца 2000-х годов. И тут нас постигает совсем проблема: pscyr сегодня поддерживается только

- дистрибутивом MiKTEX.

Поэтому предлагается использовать расширенный движок LuaTEX. Если не вдаваться в подробности,- то имеет место простая формула:

LuaTEX = pdfTEX + Поддержка Unicode и OpenType шрифтов+

+ e-TEX + Omega + встроенный интерпретатор luaКорректная работа классов семейства listok гарантируется при использовании LuaLATEX. В тео-- рии можно использовать и другие движки, но на свой страх и риск (на момент 19.01.2019 я не мог

- скомпилировать русский текст с pdfLATEX).

Движок определяется автоматически по имени запускаемой программы.

- 36 \ifLuaTeX

- 37 \input{lua.clo}

- 38 (cid:104)/common(cid:105)

- 39 (cid:104)∗lua(cid:105)

- 40 \RequirePackage[TU]{fontenc}

- 41 \RequirePackage[lutf8]{luainputenc}

- 42 \RequirePackage{fontspec}

- 43 \setmainfont{CMU Serif}

- 44 (cid:104)/lua(cid:105)

- 45 (cid:104)common(cid:105)\else

- 46 (cid:104)pdf(cid:105)\RequirePackage[utf8]{inputenc}

- 47 (cid:104)pdf(cid:105)\RequirePackage{cmap}

- 48 (cid:104)∗common(cid:105)

- 49 \input{pdf.clo}

- 50 \fi

- 4 Фишки

- Далее идут подключённые пакеты

- 51 \RequirePackage[russian]{babel}

- 52 \RequirePackage[inline]{enumitem}

- 53 \RequirePackage{textcomp, multicol}

- 54 \RequirePackage{mathtext}

- 55 \RequirePackage{indentfirst}

- 56 \RequirePackage{amsmath, amssymb, amsfonts, amsthm}

- 57 \RequirePackage{mathtools, mathabx}

- 58 \RequirePackage{epstopdf}

- 59 \RequirePackage{graphicx}

- 60 \RequirePackage{forloop}

- 61 \RequirePackage{datetime2}

- 62 \RequirePackage{microtype}

- 63 \relax

- 64 \tolerance 4000

- \listok@name задаёт имя листка, затем используется командой \maketitle для заголовка.

- 65 (cid:104)listok(cid:105)\newcommand{\listok@name}{������ №\listok@num}

- 66 (cid:104)test(cid:105)\newcommand{\listok@name}{������� №\listok@num}

- 67 (cid:104)written(cid:105)\newcommand{\listok@name}{}

- 68 (cid:104)ustn(cid:105)\newcommand{\listok@name}{�������, ���}

- 69 \renewcommand{\maketitle}{%

- 70 \begin{center}%

- 71 {\Large \textit{\textbf{\underline{%

- 72 (cid:104)listok(cid:105)\@title % ����� �����

- 73 (cid:104)test(cid:105)\@title. \listok@name % ����������� �� ����� �����. ������� №N

- 74 (cid:104)written(cid:105)���������� �������������

- 75 (cid:104)ustn(cid:105)������ �������������

- 76 }}}}

- 77 \end{center}

- 78 }

- 79 \DTMsetup{datesep=.}

- 80 \DTMsetstyle{ddmmyyyy}

- 81 \renewcommand{\thefootnote}{\fnsymbol{footnote}}

- 82 \renewcommand{\@oddhead}{

- 83 \vbox{\hbox to\textwidth{\listok@name\hfil \strut

- 84 \listok@date

- 85 }\hrule}

- 86 }

- 87 \renewcommand{\@oddfoot}{}

- 4.1 Трансокеанизация

Вывод

∅

## (cid:54)

## (cid:62)

ε

ϕ

Команда

\emptyset

\le

\ge

\epsilon

\phi

\N

\Z

\Q

\R

\Cx

\Re z

\Im z

\Zm{p}

\Expect{ξ}

\pt{Text}

Text\point

Text\hard

N

Z

Q

R

C

Re z

Im z

Zp

Eξ

Text◦

Text◦

Text∗

\Prob{Event}

P [Event]

### \ProbV{ξ}{Event} Pξ [Event]

- 88 \renewcommand{\emptyset}{\varnothing}

- 89 \renewcommand{\le}{\leqslant}

- 90 \renewcommand{\ge}{\geqslant}

- 91 \renewcommand{\epsilon}{\varepsilon}

- 92 \renewcommand{\phi}{\varphi}

- 93 \newcommand{\N}{\mathbb{N}}

- 94 \newcommand{\Z}{\mathbb{Z}}

- 95 \newcommand{\Q}{\mathbb{Q}}

- 96 \newcommand{\R}{\mathbb{R}}

- 97 \newcommand{\Cx}{\mathbb{C}}

- 98 \renewcommand{\Re}[1]{\operatorname{Re}{#1}}

- 99 \renewcommand{\Im}[1]{\operatorname{Im}{#1}}

- 100 \newcommand{\Zm}[1]{\mathbb{Z}_{#1}}

- 101 \renewcommand{\Prob}[1]{\mathbb{P}\left [ #1 \right ]}

- 102 \newcommand{\ProbV}[2]{\mathbb{P}_{#1}\left [ #2 \right ]}

- 103 \DeclareMathOperator{\Expect}{\mathbb{E}}

- 104 \newcommand{\wdt}{\widetilde}

- 105 \newcommand{\pt}[1]{$\text{#1}^\circ$}

- 106 \newcommand{\point}{${}^\circ$}

- 107 \newcommand{\hard}{${}^\ast$}

- 4.2 Переопределение кванторов

- Проблема: команды \exists и \forall задают просто символ, а не оператор или что-то ещё. Из этого

- следует, что на печати надо самим заботиться о пробелах после кванторной связки. Поэтому команды

- переопределены и ставят \; после связки.

К тому же доопределён макрос \existsone.

Команды \existssym и \forallsym задают символы кванторов в старом смысле.

- 108 \let\existssym\exists

- 109 \renewcommand*{\exists}[1]{\existssym #1~\;~}

- 110 \newcommand*{\existsone}[1]{\existssym! #1~\;~}

- 111 \let\forallsym\forall

- 112 \renewcommand*{\forall}[1]{\forallsym #1~\;~}

- \closure

- abstract

- 4.3 Остальное

- В «The Comprehensive LATEX Symbol List» Скотт Пакин, рассуждая о различиях \bar и \closure, реко-

- мендует промежуточный вариант, который придумал Энрико Грегорио и опубликовал во втором издании

- своего «Appunti di programmazione in LATEX e TEX», который дословно воспроизведён тут

- 113 \newcommand{\closure}[2][3]{%

- 114 {}\mkern#1mu\overline{\mkern-#1mu#2}}

- Abstract имеет смысл использовать под разные комментарии. Текст печатается по центру курсивом.

- 115 \renewenvironment{abstract}{\quotation\itshape\centering}{\endquotation}

- theorem

- theorem*

- lemma

- lemma*

- proposition

- proposition*

- corollary

- corollary*

- definition

- definition*

- note

- note*

- problem

- problem*

- example

- example*

- Для вёрстки теорем, лемм, утверждений, следствий, определений и замечаний определены окружения.

- Вариант со звёздочкой делает нумерованную теорему, etc.

- 116 \newtheorem{theorem}{�������}

- 117 \newtheorem*{theorem*}{�������}

- 118 \newtheorem{lemma}{�����}

- 119 \newtheorem*{lemma*}{�����}

- 120 \newtheorem{proposition}{�����������}

- 121 \newtheorem*{proposition*}{�����������}

- 122 \newtheorem{corollary}{���������}

- 123 \newtheorem*{corollary*}{���������}

- 124 \theoremstyle{definition}

- 125 \newtheorem{note}{���������}

- 126 \newtheorem*{note*}{���������}

## Новый стиль для amsthm теорем приследует следующую цель. Хотим отрисовывать звёздочку около

- сложной задачи и кружочек около обязательной. Для этого будем использовать аргумент, который обычно

- используют для названия теорем!

Можно использовать и для примеров.

- 127 \newtheoremstyle{problem}{0pt}{0pt}{\normalfont}{}{\bfseries}{.}{ }{\thmname{#1}\thmnumber{ #2}\textit{#3}}

- 128 \theoremstyle{problem}

- 129 \newtheorem{example}{������}

- 130 \newtheorem*{example*}{������}

- 131 \newtheorem{problem}{������}

- 132 \newtheorem*{problem*}{������}

- 133 \newtheorem*{definition}{�����������}

- 134 \renewcommand \theproblem {%

- 135 (cid:104)listok(cid:105) \listok@num.\@arabic\c@problem

- 136 (cid:104)common&!listok(cid:105)\@arabic\c@problem

- 137 }

- 138 \renewcommand \theexample {%

- 139 (cid:104)listok(cid:105) \listok@num.\@arabic\c@example

- 140 (cid:104)common&!listok(cid:105)\@arabic\c@example

- 141 }

- 142 \renewcommand \thetheorem {%

- 143 (cid:104)listok(cid:105) \listok@num.\@arabic\c@theorem

- 144 (cid:104)common&!listok(cid:105)\@arabic\c@theorem

- 145 }

- \problems есть переписка с \section* из класса article. \theme — аналог \subsection* из класса article.

- \theme Рекомендуется использовать, если задачи явно сгруппированы по какой-то теме. Команды \problems и

- \problems

- theme есть только в классе listok

- 146 (cid:104)∗listok(cid:105)

- 147 \newcommand \problems{\@startsection{section}{1}{\z@}{-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus.2ex}{\normalfont\Large\bfseries\centering}*{������}}

- 148 \newcommand \theme{\@startsection{subsection}{2}{\z@}{-3.25ex\@plus -1ex \@minus -.2ex}{1.5ex \@plus .2ex}{\normalfont\large\bfseries}*}

- 150 (cid:104)/listok(cid:105)

- Окружение vartab{(cid:104)amount(cid:105)} необходимо для набора таблиц различного размера. amount задаёт количе-

- vartab

- \conduit

\end{tabular}

\begin{tabular}{*{#1}{|c} |c| } \hline

- ство столбцов.

- 151 \newenvironment{vartab}[1]

- 152 {

- 154 }{

- 156 }

- \conduit печатает кондуит. В случае устного собеседования — это табличка в пять строк и \c@problem

- столбцов (то есть по одному столбцу на задачу). (Три оценки за каждую задачу и подпись). На листочке и

- контрольной — табличка с критериями оценки.

- 157 (cid:104)∗ustn(cid:105)

- 158 \newcounter{colidx}

- 159 \newcommand \conduit {

- 161 \vspace*{\fill}

- 162 \begin{center}

- 163 \begin{Large}

- 164 \begin{vartab}{\c@problem}

- 165 \hline

- 166 \forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{\; \arabic{colidx} \; &} \; $\Sigma$ \; \\ \hline

- 167 \forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\ \hline

- 168 \forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\ \hline

- 169 \forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\ \hline

- 170 \forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\

- 171 \forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\

- 172 \forloop{colidx}{1}{\not{\value{colidx} > \c@problem}}{&} \\ \hline

- 173 \end{vartab}

- 174 \end{Large}

- 175 \end{center}

- 176 }

- 177 (cid:104)/ustn(cid:105)

- 178 (cid:104)∗listok | test(cid:105)

- 179 \newcommand \conduit [4]{

- 180 \begin{center}

- 181 \begin{tabular}{|c|c|c|c|}

- 182 \hline

- 183 \multicolumn{4}{|c|}{�������� ������} \\

- 184 \hline

- 185 <<5>> & <<4>> & <<3>> & <<2>> \\ \hline

- 186 #1 ����� & #2 ����� & #3 ����� & #4 ����� \\ \hline

- 187 \end{tabular}

- 188 \end{center}

- 189 }

- 190 (cid:104)/listok | test(cid:105)

- enumitem позволяет делать свои списки. Поэтому есть следующие списки:

enumerate Каждый пункт на новой строке, делает так: 1. , 2. , 3. , …

itemize Каждый пункт на новой строке, делает так: • , • , • , …

enumerate*, itemize* Тоже, что и двое выше, inline версия (все пункты в одну строчку)

probenum Каждый пункт на новой строке, делает так: а. , б. , в. , …

probparts Inline версия probenum, но делает так: (а) , (б) , (в) , …

multienum Есть один аргумент. Разбивает probenum на переданное число столбцов.

- 191 (cid:104)∗common(cid:105)

- 192 \AddEnumerateCounter{\Asbuk}{\@Asbuk}{�}

- 193 \AddEnumerateCounter{\asbuk}{\@asbuk}{�}

- 194 \setlist[itemize]{nosep, nolistsep}

- 195 \newlist{probenum}{enumerate}{1}

- 196 \newlist{probparts}{enumerate*}{1}

- 197 \setlist[enumerate]{nosep, nolistsep}

- 198 \setlist[probenum]{nosep, nolistsep, label = \textbf{(\asbuk*)}}

- 199 \setlist[probparts]{nosep, nolistsep, label = \textbf{(\asbuk*)}}

- 200 \newenvironment{multienum}[1]

- 201 {

- 202 \begin{probenum}

- 203 \begin{multicols}{#1}

- 204 }{

- 205 \end{multicols}

- 206 \end{probenum}

- 207 }

- 208 \endinput

- 209 (cid:104)/common(cid:105)

