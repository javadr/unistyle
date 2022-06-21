\NeedsTeXFormat{LaTeX2e}
\def\unistyle@date{21/06/2022}
\def\unistyle@version{0.94}
\ProvidesClass{unistyle}[\unistyle@date\space version \unistyle@version\space
Exam, Coures Syllabus, and Excercise Style for Universities]
\RequirePackage{biditools}
\RequirePackage{tikz}
\RequirePackage{pgfornament}
\RequirePackage{calc}
\usetikzlibrary{calc, shadows, positioning, backgrounds}
\RequirePackage{bidi-atbegshi} %must be loaded after tikz
\RequirePackage{fancybox}
\newif\if@uni@decorate
\newif\if@uni@noborder
\newif\if@uni@key
\newif\if@uni@grid
\newif\if@uni@afivepaper
\DeclareOption{a5paper}{\PassOptionsToPackage{a5paper}{geometry}\@uni@afivepapertrue}
\DeclareOption{a4paper}{\PassOptionsToPackage{a4paper}{geometry}}
\DeclareOption{decorate}{\@uni@decoratetrue}
\DeclareOption{rectangle}{\@uni@decoratefalse}
\DeclareOption{noborder}{\@uni@nobordertrue}
\DeclareOption{automata}{%https://www3.nd.edu/~kogge/courses/cse30151-fa17/Public/other/tikz_tutorial.pdf
\usetikzlibrary{automata, positioning, arrows}
\tikzset{%
    ->, % makes the edges directed
    >=stealth', % makes the arrow heads bold
    node distance=3cm, % specifies the minimum distance between two nodes. Change if necessary.
    every state/.style={thick, fill=gray!10}, % sets the properties for each ’state’ node
    initial text=$ $, % sets the text that appears on the start arrow
    }
%\node[<options>] (name) {text label};
%options: • state  • initial  • accepting
%\begin{tikzpicture}
%    \node[state, initial, accepting] (1) {$1$};
%    \node[state, below left of=1] (2) {$2$};
%    \node[state, right of=2] (3) {$3$};
%    \draw (1) edge[above] node{$b$} (2)
%    (1) edge[below, bend right, left=0.3] node{$\epsilon$} (3)
%    (2) edge[loop left] node{$a$} (2)
%    (2) edge[below] node{$a, b$} (3)
%    (3) edge[above, bend right, right=0.3] node{$a$} (1);
%\end{tikzpicture}
}
\DeclareOption{flowchart}{%
\usetikzlibrary{shapes.geometric, shapes.symbols,arrows}
\tikzstyle{startstop} = [rectangle, rounded corners=15pt, minimum width=2cm, minimum height=1cm,text centered, draw=black, ]
\tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=2cm, minimum height=1cm, text centered, draw=black, ]
\tikzstyle{process} = [rectangle, minimum width=2cm, minimum height=1cm, text centered, draw=black,]
\tikzstyle{decision} = [diamond, minimum width=2cm, minimum height=1cm, text centered, draw=black,
shape aspect=2 ]
%\tikzstyle{output} =[draw,tape, minimum size=2cm, tape bend top=none, tape bend bottom=out,
%tape bend height=1cm]
%\tikzstyle{output} =[draw,append after command={
%    append after command={[rounded corners=0pt](\tikzlastnode.west)|-(\tikzlastnode.north)},
%    append after command={[rounded corners=3pt](\tikzlastnode.north)-|(\tikzlastnode.east)},
%    append after command={[rounded corners=10pt](\tikzlastnode.east)|-(\tikzlastnode.south)},
%    append after command={[rounded corners=5pt](\tikzlastnode.south)-|(\tikzlastnode.west)}} ]
\tikzstyle{arrow} = [thick,->,>=stealth]%
}
\DeclareOption{key}{\@uni@keytrue}
\DeclareOption{grid}{\@uni@gridtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{a4paper}
\ExecuteOptions{decorate}
\ProcessOptions
\LoadClass[a4paper, 10pt]{article}
\RequirePackage{keyval}
\define@key{unistyle}{عنوان}{\def\uni@title{#1}}
\define@key{unistyle}{عنوان درس}{\def\uni@course{#1}}
\define@key{unistyle}{مقطع و رشته}{\def\uni@major{#1}}
\define@key{unistyle}{روز و تاریخ}{\def\uni@date{#1}}
\define@key{unistyle}{ترم}{\def\uni@semester{\ifcase#1{}\or{اول}\or{دوم}\or{تابستان}\fi}}
\define@key{unistyle}{سال تحصیلی}{\def\uni@year{#1}}
\define@key{unistyle}{مدت امتحان}{\def\uni@time{#1}}
\define@key{unistyle}{تاریخ تحویل}{\def\uni@time{#1}} %   تاریخ تحویل پروژه
\define@key{unistyle}{نوع آزمون}{\def\uni@type{#1}}
\define@key{unistyle}{دانشکده}{\def\uni@faculty{#1}}
\define@key{unistyle}{گروه}{\def\uni@deptartment{#1}}
\define@key{unistyle}{لوگوی دانشگاه}{\def\uni@logo{#1}}
\newcommand{\unidetails}{\setkeys{unistyle}}
%\@onlypreamble\unidetails
% https://github.com/persiantex/xepersian/issues/17
% \ExplSyntaxOn \cs_set_eq:NN \etex_iffontchar:D \tex_iffontchar:D \cs_undefine:N \c_one \int_const:Nn \c_one { 1 } \ExplSyntaxOff%
\bidi@AtEndPreamble{%
    \RequirePackage{xepersian}%
    \settextfont[Scale=1]{XB Niloofar}%
    \setdigitfont{Yas}%
    \defpersianfont\Pook{XB Kayhan Sayeh}%
    \defpersianfont\Niloofar[Scale=1]{XB Niloofar}%
    \defpersianfont\Homa[Scale=1]{BHoma}%
    \defpersianfont\Yas[Scale=1]{Yas}%
    \defpersianfont\Shafigh[Scale=1]{XB Shafigh}%
    \bidi@patchcmd{\@Abjad}{آ}{الف}{}{}%
    \bidi@patchcmd{\@Abjad}{ه}{ه‍}{}{}%
    \PersianAlphs%
%%%%%    \maketitle (without the titlepage class option) internally uses \thispagestyle{plain} which locally overrides \pagestyle{empty}. Add \thispagestyle{empty} immediately after \maketitle.
    \bidi@appto\maketitle{\thispagestyle{empty}}%
    \ifdefined\uni@logo\else\def\uni@logo{logo}\fi
    \savebox\uni@logobox(1.2cm,1.2cm){\includegraphics[width=1.2cm, height=1.2cm]{\uni@logo}}
}
\parindent=0pt%
%\bidi@AfterEndPreamble{\null\setRTL\null}
\RequirePackage[top=.6cm,bottom=1cm,left=1cm,right=1cm]{geometry}
\pagestyle{empty}
\RequirePackage{lastpage}
\RequirePackage{refcount}
\RequirePackage{graphicx}
\graphicspath{{images/}}
\RequirePackage{forloop}
\RequirePackage{multicol}
\RequirePackage[inline]{enumitem}
\setlist{noitemsep,leftmargin=6mm,}% rightmargin=6mm,labelwidth=7mm,labelsep=2mm}
%,before={\baselineskip=.65cm},after={\baselineskip=.76cm}}%,itemsep=-2mm}
\SetEnumitemKey{twocolumn}{itemsep=1\itemsep,parsep=1\parsep,
before=\raggedcolumns\begin{multicols}{2},after=\end{multicols}}
\SetEnumitemKey{threecolumn}{itemsep=1\itemsep,parsep=1\parsep,
before=\raggedcolumns\begin{multicols}{3},after=\end{multicols}}
\SetEnumitemKey{itemtwocol}{itemsep=1\itemsep,parsep=1\parsep,
before=\raggedcolumns\begin{multicols}{2},after=\end{multicols}}
\SetEnumitemKey{itemtwocolLTR}{itemsep=1\itemsep,parsep=1\parsep,leftmargin=*,
before=\raggedcolumns\LTRmulticolcolumns\begin{multicols}{2},after=\end{multicols}}
\SetEnumitemKey{arLTRlabel}{label=-\arabic*}
\setlist[enumerate]{label=\arabic*-}
%\setlist[enumerate, 2]{label={\if@RTL\alph*)\else(\alph*\fi}}
\setlist[enumerate, 2]{label=\alph*)}
%
\RequirePackage{tabularx}
%
\RequirePackage{color}
\RequirePackage{xecolor}
\RequirePackage{listings}
\lstset{% general command to set parameter(s)
    language=python,
    basicstyle=\setLTR\setlatin\color{black}\ttfamily\small,          % print whole listing small
    keywordstyle=\color{black}\bfseries,
    numberstyle=\tiny\Yas,
    columns=flexible,
%    identifierstyle=\color{red},           % nothing happens
%    commentstyle=\color{blue},
%    stringstyle=\color{green}\ttfamily,      % typewriter type for strings
    showstringspaces=false,     % no special string spaces
    numbers=left,
    numbersep=5pt,
    tabsize=2,
    frameround=tftf,
    frame=ltbr,
%    backgroundcolor=\color{green},
%    xleftmargin=35pt
    }
%
\def\questionbox{\framebox[9mm]{?}}%
\def\uni@clock@get#1:#2;{\def\uni@clock@hour{#1}\def\uni@clock@min{#2}}%
\def\uni@stripmin#1:{\edef\uni@clock@min{#1}}%
\def\uni@hour@min#1{%
  \uni@clock@get#1:\relax;%
  \edef\uni@tmpa{\uni@clock@min}%
  \edef\uni@relax{\relax}%
  \ifx\uni@tmpa\uni@relax\edef\uni@clock@min{00}%
  \else\expandafter\uni@stripmin\uni@clock@min\fi%
}%
\def\clock[#1]{%
\expandafter\uni@hour@min\expandafter{#1}%
    \ifx\uni@clock@hour\uni@clock@min\hboxL{$\uni@clock@hour$:$00$}%
    \else\hboxL{$\uni@clock@hour$:$\uni@clock@min$}%
    \fi%
}%
\newcommand{\tbox}[1]{\centerline{%
\begin{tikzpicture}[font=\normalsize\persianfont]
%    \node (left) {\pgfornament[width=12mm]{11}};
%    \node (text) [right=of left] {\hboxR{#1}};
%    \node (right) [right=of text] {\pgfornament[width=12mm]{14}};
%%    \draw [very thick, ] (0,0) node (uni@sa)  {\pgfornament[width=12mm]{14}} --
%%        (\textwidth,0)  node  (uni@sb) {\pgfornament[width=12mm]{11}};
%%    \node at  ($(uni@sa)!0.5!(uni@sb)$) [draw, rectangle, color=black, fill=white,
%%    general shadow={fill=black,shadow xshift=-2pt, shadow yshift=-2pt}]  {\hboxR{\Shafigh #1}} ;
    \draw [very thick, ] (0,0) node [rotate=90] {\pgfornament[height=10mm, ]{26}}   --
        (\textwidth,0)  node  [draw, rectangle, color=black!70, fill=white, anchor=east,
    general shadow={fill=gray,shadow xshift=-2pt, shadow yshift=-2pt}]  {\hboxR{\Shafigh #1}} ;
\end{tikzpicture}}\nobreak}
\newcommand\SyllabusMakeTitle[3]{%
\begin{tikzpicture}
    \node (semester) at (\textwidth,0) [anchor=east, xshift=-.05\textwidth] {\hboxR{#1}};
    \node (course) at (semester.south east) [anchor=east] {\hboxR{{\Homa\large #2} $#3$}};
    \node at (0,0) {\resizebox{.1\textwidth}{!}{\logo}};
\end{tikzpicture}}
%\long\def\tbox#1{\noindent\par\fbox{\Shafigh{#1}}\par}
\let\uni@course\@empty
\let\uni@title\@empty
\let\uni@major\@empty
\let\uni@date\@empty
\let\uni@semester\@empty
\let\uni@year\@empty
\let\uni@time\@empty
\let\uni@type\@empty
\def\uni@faculty{علوم‌پایه}
\def\uni@deptartment{علوم‌کامپیوتر}
%
%\@onlypreamble{\etitle}
\@onlypreamble{\ecourse}
\@onlypreamble{\emajor}
\@onlypreamble{\edate}
\@onlypreamble{\esemester}
\@onlypreamble{\eyear}
%\@onlypreamble{\etime}
\@onlypreamble{\etype}
% \@onlypreamble{\logo}
\@onlypreamble{\efaculty}
\@onlypreamble{\edepartment}
%
\def\etitle#1{\def\uni@title{#1}}
\def\ecourse#1{\def\uni@course{#1}}
\def\emajor#1{\def\uni@major{#1}}
\def\edate#1{\def\uni@date{#1}}
\def\esemester#1{\def\uni@semester{\ifcase#1{}\or{اول}\or{دوم}\or{تابستان}\fi}}
\def\eyear#1{\def\uni@year{#1}}
\def\etime#1{\def\uni@time{#1}}
\def\etype#1{\def\uni@type{#1}}
\def\efaculty#1{\def\uni@faculty{#1}}
\def\edepartment#1{\def\uni@deptartment{#1}}
\newsavebox\uni@logobox%
\def\logo{\usebox{\uni@logobox}}%
%
\def\uni@ifexist#1{\ifx#1\undefined\else#1\fi}
\newcommand{\MakeTitle}{%\phantom{leavevmode}
\centerline{{\Shafigh\scriptsize به نام خدا}}
\centerline{\logo}
%\vspace{-.3cm}\centerline{\tiny دانشکده علوم‌پایه}
\vspace{-.3cm}\centerline{\tiny دانشکده \uni@ifexist\uni@faculty}
\vspace{-.2cm}\centerline{\tiny گروه \uni@ifexist\uni@deptartment}
\vspace{-.1cm}\centerline{\textbf{\tiny آزمون \uni@ifexist\uni@type}}
\vspace{-2cm}
\noindent
\makebox[4cm][r]{نام و نام خانوادگی:}\hfill       \makebox[4cm][l]{ سالِ تحصیلی: \uni@ifexist\uni@year}\newline
\makebox[4cm][r]{شماره‌ٔ دانشجویی:}\hfill        \makebox[4cm][l]{ نيمسالِ \uni@ifexist\uni@semester}\newline
\makebox[4cm][r]{\textbf{\uni@ifexist\uni@course}}    \hfill
\makebox[4cm][l]{{\ifx\uni@date\@empty\today\else\uni@date\fi}}\newline
\makebox[4cm][r]{\uni@ifexist\uni@major}\hfill\makebox[4cm][l]{ وقـت: \uni@ifexist\uni@time{} دقيقه}\newline
%\vspace{1mm}
\hrule  height .4mm  %\vspace{ 3mm }
\null
}
\newcommand{\MakeTitlePro}{\small
\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ccc}
\parbox[c]{2.5cm}{%
\vspace{-.3cm}\centerline{\logo}
\vspace{-.3cm}\centerline{\tiny دانشکده \uni@ifexist\uni@faculty}
\vspace{-.2cm}\centerline{\tiny گروه \uni@ifexist\uni@deptartment}
}
&
\parbox[c]{6cm}{%
\centerline{\Homa{به نام خدا‌}}
\vspace{4mm}
\centerline{\textbf{\uni@ifexist\uni@course}}
\centerline{\uni@ifexist\uni@title}
\centerline{\mbox{}}
}
&
\parbox[r]{3cm}{%
\vspace{2mm}
نیم‌سال {}\uni@ifexist\uni@semester{} \uni@ifexist\uni@year\\
تحریر: \hfill\uni@ifexist\uni@date\\
تحویل: \hfill \uni@ifexist\uni@time\\
}\\
\end{tabular*}
\hrule  height .4mm  %\vspace{ 3mm }
\null
}%
%
\newcommand{\newQomExamTitle}[7]{% for compatibility with old documents
\centerline{\Homa{\scriptsize  به نام خدا‌}}
\centerline{\logo}
\vspace{-.3cm}\centerline{\tiny دانشکده علوم‌}
\vspace{-.2cm}\centerline{\tiny گروه علوم کامپیوتر}
\centerline{\textbf{\tiny آزمون #7   }}
\vspace{-2cm}
\noindent
\makebox[6cm][r]{نام و نام خانوادگی‌:}\hfill       \makebox[4cm][l]{\small سالِ تحصیلی:  #3}\newline
\makebox[6cm][r]{شماره‌‌ی دانشجویی‌‍‌:}\hfill        \makebox[4cm][l]{\small ن‍ي‍م‍س‍‍الِ #4}\newline
\makebox[6cm][r]{\textbf{#1}}                 \hfill        \makebox[4cm][l]{\small{#5}}\newline
\makebox[6cm][r]{#2}                 \hfill        \makebox[4cm][l]{\small وق‍ـت‌: {\textbf{#6}} دق‍ي‍ق‍ه‌}\newline
\hrule  height .4mm  %\vspace{ 3mm }
}
%
%\RequirePackage{fancyhdr}
%\pagestyle{fancy}
%\fancyhf{}
%\cfoot{صفحهٔ \thepage{} از \pageref*{LastPage}}
%\renewcommand{\headrulewidth}{0pt}
\newcounter{lastpagenumber}%
\AtBeginDocument{\AtBeginShipoutInit}%
\AtBeginShipout{\AtBeginShipoutAddToBox{%
\setcounter{lastpagenumber}{\getrefbykeydefault{LastPage}{page}{1}}%
\begin{tikzpicture}[color=black,remember picture, overlay, every node/.style={inner sep=0pt},]
\if@uni@noborder%
            \ifnum\thelastpagenumber>1%
                \node [fill=white, above=.5cm,centered,font=\persianfont ] at  ($(current page.south) + (0cm,0cm)$)
                {\hboxR{\rl{صفحهٔ} {\Yas\thepage} \rl{از} {\Yas\thelastpagenumber}}  };
            \fi%
\else%
    \if@uni@decorate%
        \node[anchor=north west] (CNW) at ($(current page.north west) + (2mm,-2mm)$)
        {\pgfornament[width=2cm]{41}};
        \node[anchor=north east] (CNE) at ($(current page.north east) + (-2mm,-2mm)$)
        {\pgfornament[width=2cm,symmetry=v]{41}};
        \node[anchor=south west] (CSW) at ($(current page.south west) + (2mm,2mm)$)
        {\pgfornament[width=2cm,symmetry=h]{41}};
        \node[anchor=south east] (CSE) at ($(current page.south east) + (-2mm,2mm)$)
        {\pgfornament[width=2cm,symmetry=c]{41}};
        \draw [double distance=1pt, line width=1pt,]
            ([yshift=.45pt]$(CNW.north)+(1cm,-1mm)$) to ($(CNE.north)+(-1cm,-1mm)$);
        \draw [double distance=1pt, line width=1pt,]
            ($(CNW.south west)+(3.5pt,0cm)$) to ($(CSW.north west)+(3.5pt,0cm)$);
        \draw [double distance=1pt, line width=1pt,]
            ($(CNE.south east)-(3.5pt,0cm)$) to ($(CSE.north east)-(3.5pt,0cm)$);
        \ifnum\thelastpagenumber=1%
            \draw [double distance=1pt, line width=1pt,]
             ([yshift=-.45pt]$(CSW.south)+(1cm,1mm)$) -- ($(CSE.south)+(-1cm,1mm)$){};
        \else%
            \draw [double distance=1pt, line width=1pt,]
             ($(CSW.south)+(1cm,1mm)$) -- ($(CSE.south)+(-1cm,1mm)$)
             node [midway, color=black, fill=white,font=\persianfont] {\hboxR{صفحهٔ \thepage{} از \thelastpagenumber}};
         \fi%
    \else%rectangle border option
        \draw [double distance=1pt, line width=1pt, rounded corners=1mm, ]
                            ($(current page.north west) + (4mm,-4mm)$) rectangle
                            ($(current page.south east)  + (-4mm,4mm)$) node (rect) {};
            \ifnum\thelastpagenumber=1%
                \node [fill=white, anchor=west, xshift=1cm] at  ($(current page.south west) + (1cm,1cm)$)  {};%
            \else%
                \node [fill=white, above=.5cm,centered,font=\persianfont ] at  ($(current page.south) + (0mm,-1mm)$)
                {\hboxR{\rl{صفحهٔ} {\Yas\thepage} \rl{از} {\Yas\thelastpagenumber}}  };
            \fi%
    \fi%
\fi%
\if@uni@key%
    \node [color=gray, scale=\textwidth/1.1cm, rotate=45,font=\persianfont\normalsize, opacity=.3] at ($(current page.center)$) {پاسخنامه};
\fi%
\if@uni@grid% draw a grid in the background of the paper.
    \foreach \y in {0.0, 0.01, ..., 1.0}%
    {\draw[draw=gray,draw opacity=0.7] ($(current page.south west)+(\y\paperwidth,0pt)$) %
         -- ($(current page.south west)+(\y\paperwidth,\paperheight)$);}%
    \foreach \y in {0.0, 0.01, ..., 1.0}%
    {\draw[draw=gray,draw opacity=0.7] ($(current page.south west)+(0pt,\y\paperheight)$) %
         -- ($(current page.south west)+(\paperwidth,\y\paperheight)$);}%
\fi%
    \end{tikzpicture}%
}}
%
%
\newcounter{mnum}
\newenvironment{mlist}{\setcounter{mnum}{0}     % 1) 2) 3)
\begin{list}{\arabic{mnum}-}{\usecounter{mnum}\rightmargin=6mm
    \labelwidth=7mm\labelsep=2mm\setlength{\parsep}{\parskip}
    \setlength{\listparindent}{\parindent}
    }}{\end{list}}
%
\def\uni@mul@pos{\iflatin{l}{r}}
\def\alef{\iflatin{\hbox to 5mm{a)}}{\hbox to 8mm{الف\hfill)\kern2mm }}}%
\def\be{\iflatin{\hbox to 5mm{b)}}{\hbox to 7mm{ب\hfill)\kern2mm }}}%
\def\jim{\iflatin{\hbox to 5mm{c)}}{\hbox to 7mm{ج\hfill)\kern2mm }}}%
\def\dal{\iflatin{\hbox to 5mm{d)}}{\hbox to 6mm{د\hfill)\kern2mm }}}%
%
\newcommand{\fourj}[4]{\nopagebreak\nobreak\par\vskip1mm
   \noindent\makebox[2.5cm][\uni@mul@pos]{\alef#1}\hfill
            \makebox[2.5cm][\uni@mul@pos]{\be#2}\hfill
            \makebox[2.5cm][\uni@mul@pos]{\jim#3}\hfill
            \makebox[2.5cm][\uni@mul@pos]{\dal#4}\newline
   \par%\vskip3mm
}%
%
\newcommand{\twoj}[4]{\nopagebreak\nobreak\par\vskip1mm
   \noindent\makebox[4.5cm][\uni@mul@pos]{\alef#1}\hfill
            \makebox[7.5cm][\uni@mul@pos]{\be#2}\newline
            \makebox[4.5cm][\uni@mul@pos]{\jim#3}\hfill
            \makebox[7.5cm][\uni@mul@pos]{\dal#4}\newline
   \par%\vskip3mm
}%
%
\newcommand{\onej}[4]{\nopagebreak\nobreak\par%\vskip5mm
   \noindent\makebox[\linewidth][\uni@mul@pos]{\alef\parbox[t]{.95\linewidth}{#1}}\newline
            \makebox[\linewidth][\uni@mul@pos]{\be\parbox[t]{.95\linewidth}{#2}}\newline
            \makebox[\linewidth][\uni@mul@pos]{\jim\parbox[t]{.95\linewidth}{#3}}\newline
            \makebox[\linewidth][\uni@mul@pos]{\dal\parbox[t]{.95\linewidth}{#4}}\newline
  \par%\vskip3mm
}%
% multiple choices environment inspired by the below and improved by Vafa Khalighi
% https://tex.stackexchange.com/questions/140923/how-to-automatically-align-the-four-choices-of-a-multiple-choice-question-in-exa
% MultipltChoices Environment.
\newcounter{uni@MultChoiceCount}
\newcommand{\uni@InitialChoice}{%
    \ifnum\value{uni@MultChoiceCount}>\z@
        \cr
    \fi
    \stepcounter{uni@MultChoiceCount}%
    (\harfi{uni@MultChoiceCount})
}
\newcommand{\uni@FinalChoice}{%
    \ifnum\value{uni@MultChoiceCount}>\z@
        \hfill
        \egroup
    \fi
    \stepcounter{uni@MultChoiceCount}%
    \hspace{0pt}%
    \hbox to \uni@MultChoicesWidth\bgroup
    (\harfi{uni@MultChoiceCount})
}
\newbox\uni@MultChoicesBox
\newdimen\uni@MultChoicesWidth
\newcommand{\uni@ComputeMultChoicesWidth}[1]{%
    \setbox\uni@MultChoicesBox\hbox{%
        \vbox{%
        \halign{%
            ##\hfil\cr
            #1\crcr
        }%
        }%
    }%
}
\newenvironment{multiplechoices}{%
    \setcounter{uni@MultChoiceCount}{0}%
    \let\Choice\uni@InitialChoice
    \bidi@collect@long@body\uni@ComputeMultChoicesWidth
}{%
    \uni@MultChoicesWidth-\fontcharwd\font`
    \advance\uni@MultChoicesWidth\wd\uni@MultChoicesBox
    \ifdim\uni@MultChoicesWidth>0.5\textwidth
        \uni@MultChoicesWidth=\textwidth
    \else
        \ifdim\uni@MultChoicesWidth>0.25\textwidth
        \uni@MultChoicesWidth=0.5\textwidth
        \else
        \uni@MultChoicesWidth=0.25\textwidth
        \fi
    \fi
    \setcounter{uni@MultChoiceCount}{0}%
    \let\Choice\uni@FinalChoice
    \parindent\z@
    \the\@bidi@envbody
    \hfill
    \egroup
}
% End of multiplechoices
\def\DOTS{\hbox to 4cm {\dotfill}}%
\def\bdots{\leavevmode\hbox to 14mm {\dotfill}\hbox to 2pt{}}
%
\newcounter{uni@t@lct}%
\newcounter{uni@t@row}%
\newcounter{uni@t@col}%
\newcounter{uni@t@c}%
\newcounter{uni@t@r}%
%    the solution based on http://tex.stackexchange.com/questions/131265/defining-tabular-rows-with-macros-using-ifnum-leads-to-incomplete-ifnum
\def\uni@t@and#1{%
    \setcounter{uni@t@c}{1}%
    \whiledo{\value{uni@t@c} < \numexpr#1+1\relax}{\uppercase{&}\stepcounter{uni@t@c}}%
}
\newcolumntype{Y}{>{\centering\arraybackslash}X}
\newcommand{\makeresponseform}[1]{%
    \pgfmathparse{int(ceil(#1/4))}%
    \setcounter{uni@t@row}{\pgfmathresult}%
    \pgfmathparse{int(mod(#1,4))}%
    \setcounter{uni@t@col}{\pgfmathresult}%
    \pgfmathparse{int(3-\theuni@t@col))}%
    \ifnum\theuni@t@col=0{\setcounter{uni@t@r}{0}}\else\setcounter{uni@t@r}{\pgfmathresult}\fi%
    \begin{center}\Yas
        \begin{tabularx}{.97\textwidth}{||*{4}{@{\hskip 2pt}Y@{\hskip 2pt}|Y|Y|Y|Y||}}
        \hline
    {\scriptsize سوال} & الفـ & ب & ج & د &  {\scriptsize سوال} & الفـ & ب & ج & د &  {\scriptsize سوال} & الفـ & ب & ج & د & {\scriptsize سوال} & الفـ & ب & ج & د  \\
        \hline\hline
        \forloop{uni@t@lct}{1}{\value{uni@t@lct} < \numexpr\value{uni@t@row}+0\relax}%10}
        {\arabic{uni@t@lct} \uni@t@and{5}  %
        \addtocounter{uni@t@lct}{\value{uni@t@row}}\arabic{uni@t@lct} \uni@t@and{5}  %
        \addtocounter{uni@t@lct}{\ifnum\theuni@t@r=2\numexpr\value{uni@t@row}-1\relax\else\value{uni@t@row}\fi}\arabic{uni@t@lct} \uni@t@and{5}  %
        \addtocounter{uni@t@lct}{\ifnum\theuni@t@r>0\numexpr\value{uni@t@row}-1\relax\else\value{uni@t@row}\fi}\arabic{uni@t@lct} \uni@t@and{4}  \\\hline
        \pgfmathparse{int(\value{uni@t@row}*-3+\value{uni@t@r})}%
        \addtocounter{uni@t@lct}{\pgfmathresult}%
        }%
        \ifcase\value{uni@t@col}
            \pgfmathparse{int(\value{uni@t@row})}$\pgfmathresult$ \uni@t@and{5}
            \pgfmathparse{int(\value{uni@t@row}*2)}$\pgfmathresult$ \uni@t@and{5}
            \pgfmathparse{int(\value{uni@t@row}*3)}$\pgfmathresult$ \uni@t@and{5}
            \pgfmathparse{int(\value{uni@t@row}*4)}$\pgfmathresult$ \uni@t@and{4}
            \\\hline
            \or \pgfmathparse{int(\value{uni@t@row})}$\pgfmathresult$  \uni@t@and{4}
            \\\cline{1-5}%
            \or \pgfmathparse{int(\value{uni@t@row})}$\pgfmathresult$ \uni@t@and{5}
            \pgfmathparse{int(\value{uni@t@row}*2)}$\pgfmathresult$  \uni@t@and{4}
            \\\cline{1-10}%
            \or \pgfmathparse{int(\value{uni@t@row}*1)}$\pgfmathresult$ \uni@t@and{5}
            \pgfmathparse{int(\value{uni@t@row}*2)}$\pgfmathresult$ \uni@t@and{5}
            \pgfmathparse{int(\value{uni@t@row}*3)}$\pgfmathresult$ \uni@t@and{4}
            \\\cline{1-15}%
        \fi%
        \end{tabularx}
    \end{center}
}
%https://tex.stackexchange.com/questions/114069/flush-whats-following-hfill-to-the-next-line-if-it-doesnt-fit/114077#114077
\def\grade#1{\hspace{\fill}\mbox{}\linebreak[0]\hspace*{\fill}\mbox{($#1$~نمره)}}
%
\newcommand\sign[1][]{\nobreak%
\begin{flushleft}
\Shafigh\scriptsize
\makebox[15mm][c]{«موفق باشید»}\\
\ifthenelse{\equal{#1}{}}{\makebox[15mm][c]{{#1}}}{}%
\end{flushleft}
}
%
\newcommand{\xepersianproof}[1][\if@uni@afivepaper\scriptsize\else\footnotesize\fi]{\color{black}
\centerline{{#1 این نوشتار تحت \lr{\LaTeX{}} بوسیله بسته \lr{\XePersian{}} آماده شده است}\reflectbox{{#1 این نوشتار تحت \lr{\LaTeX{}} بوسیله بسته \lr{\XePersian{}} آماده شده است.}}}
}
%
\RequirePackage{xifthen}
\newcounter{uni@hakim}
\newif\ifuni@latinquote
\def\uni@a{{\tiny\raisebox{ .8em }{(ع)}}}%
\def\uni@s{{\tiny\raisebox{ .8em }{(ص)}}}%
\newbox\uni@notebox%
%\newdimen\uni@notedim%
\newread\uni@reader%
\newcount\uni@wisewordscount%
\openin\uni@reader=wisewords.def\relax%
\gdef\uni@empty@line{\par }
\def\uni@wisewords{}
%\def\uni@wisewords@makelist{%\csname ifcase\endcsname#1{}%
    \loop%
        \read\uni@reader to \uni@reader@line%
        \unless\ifeof\uni@reader%
            \ifx\uni@reader@line\uni@empty@line\else
                \global\advance\uni@wisewordscount by 1\relax
                %\csname or\endcsname
                \typeout{\uni@reader@line}%
%                \edef\uni@wisewords{\uni@wisewords\or\uni@reader@line}
            \fi
        \repeat%
    \closein\uni@reader%
%    \def\uni@wisewords{\ifcase\uni\uni@wisewords\fi}
%    \csname fi\endcsname
%    \typeout{TTTTTTTTTTTTTTTTTTTTTTT \the\uni@wisewordscount}
%}

%\RequirePackage[first=1, last=\the\uni@wisewordscount, counter=uni@rand]{lcg}
\newcommand\kalamehakim[1][]{%
\ifthenelse{\equal{#1}{}}%
{\setcounter{uni@hakim}{\numexpr\uniformdeviate21 +1\relax}}%
{\setcounter{uni@hakim}{#1}}%
\savebox\uni@notebox{%
\ifcase\theuni@hakim{}%
\or{حضرت علی\uni@a:  هر چيزى نيازمند عقل است و عقل نياز به ادب دارد.}% 1
\or{امام رضا\uni@a: آفت کار دلبستگی نداشتن به آنهاست.}% 2
\or{بزرگمهر:‌ قویترین رکن بنای مودت، کتمان اسرار دوستان است.}% 3
\or{امام حسین\uni@a: بگو مگو کردن با بی‌فکران نادانی است.}% 4
\or{امام حسین\uni@a: إِنْ لَمْ يَكُنْ لَكُمْ دينٌ وَ كُنْتُمْ لا تَخافُونَ الْمَعادَ فَكُونُوا أَحْرارًا فی  دُنْياكُم.}% 5
\or{امام حسین\uni@a: إنَّ الحَیاةَ عَقیدَةٌ و جِهادٌ.}% 6
\or{حضرت علی‌\uni@a: آفت سخن، پرحرفی و طول دادن آن است.}% 7
\or{امام باقر\uni@a: از کسی که نمی‌شناسی بر حذر باش.}% 8
\or{گیبون: معاشرت بر دانایی می‌افزاید ولی تنهایی مکتب نبوغ است.}% 9
\or{امام علی\uni@a:‌ هیچ خوشی در عالم نیست جز آنکه یک ناخوشی در کنارش است.}% 10
\or{رسول اکرم\uni@s: از آن کسان مباش که بر مردم سخت و با خویش آسان گیرند.}% 11
\or{رسول اکرم\uni@s: به خود بالیدن آفت حسب و نسب است.}% 12
\or{سقراط: بکوش تا آنچه را که علاج ندارد، با مدارا تحمل کنی.}% 13
\or{حضرت علی\uni@a: آنان که وقتشان پایان یافته خواستار مهلتند، و آنان که مهلت دارند کوتاهی می‌ورزند.}% 14
\or{حضرت علی\uni@a: فرصت‌ها چون ابر می‌گذرد.}% 15
\or{بقراط: فرومایگی شخص از دو چیز مشخص می‌شود: بیهوده سخن گفتن، نپرسیده جواب دادن}% 16
\or{حضرت علی\uni@a: ما اکثر العبر و اقل الاعتبار (عبرت‌ها چه‌ بسيار است‌ و پند گرفتن‌‌ها چقدر کم!)}% 17
\or{حضرت علی\uni@a: اندیشیدن همانند دیدن نیست، زیرا گاهی چشم‌ها دروغ می‌نمایاند، اما آن کس که از عقل نصیحت خواهد به او خیانت نمی‌کند.
{\scriptsize(حکمت۲۸۱)}}% 18
\or{رسول اکرم \uni@s: بهترین مردم کسی است که مردم از او بهره‌مند شوند.}% 19
\or{\lr{Integrity has no need of rules. \footnotesize Albert Camus}\global\uni@latinquotetrue}%20
\or{\lr{Man is the only creature that refuses to be what he is. \footnotesize Albert Camus}\global\uni@latinquotetrue}%21
\or{\lr{He who asks a question is a fool for five minutes; he who does not ask a question remains a fool forever.\footnotesize{ }Chinese Proverb}\global\uni@latinquotetrue}%22
\fi%
}
\ifuni@latinquote\begin{latin}\fi
\centerline{\shadowbox{%\leavevmode%
\ifdim\wd\uni@notebox<.95\linewidth%
    \usebox\uni@notebox%
\else
    \parbox{.9\linewidth}{\centering\unhbox\uni@notebox}%
\fi
}}
\ifuni@latinquote\end{latin}\fi
}
%
\endinput
%% End of file `unistyle.sty'.
