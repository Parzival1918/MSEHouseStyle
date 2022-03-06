\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MSEHouseStyle}[2022/03/06 Document class of the official Materials Science and Engineering Department House Style.]

\newcounter{qcounter}
\newcounter{headingCount}
\newcounter{subHeadingCount}
\newcounter{subsubHeadingCount}
\newcounter{subsubsubHeadingCount}
\newcounter{subsubsubsubHeadingCount}
\setcounter{headingCount}{0}
\setcounter{subHeadingCount}{0}
\setcounter{subsubHeadingCount}{0}
\setcounter{subsubsubHeadingCount}{0}
\setcounter{subsubsubsubHeadingCount}{0}

\newcommand{\hBoxHeaders}{1.6cm}
\newcommand{\headerNum}{-2em}
\newcommand{\topHeaderNum}{-0.2cm}

\newcommand{\Text}{
    \normalsize
    %\fontsize{11}{16}\fontseries{n}%
    %\selectfont
}
\newcommand{\Emphasis}{
    \fontsize{11}{16}\fontseries{b}
    \selectfont
}
\newcommand{\Footnote}{
    \fontsize{10}{13}\fontseries{n}%
    \selectfont
}
\newcommand{\Title}{
    \fontsize{24}{30}\fontseries{b}%
    \selectfont
}
\newcommand{\Subtitle}{
    \fontsize{14}{20}\fontseries{n}%
    \selectfont
}
\newcommand{\MainHeading}{
    \fontsize{14}{20}\fontseries{b}%
    \selectfont
}
\newcommand{\SubHeading}{
    \fontsize{12}{20}\fontseries{b}%
    \selectfont
}
\newcommand{\SubSubHeading}{
    \fontsize{11}{20}\fontseries{b}%
    \selectfont
}
\newcommand{\SubSubSubHeading}{
    \fontsize{11}{20}\itshape%
    \selectfont
}
\newcommand{\SubSubSubSubHeading}{
    \fontsize{11}{20}\fontseries{n}%
    \selectfont
}
\newcommand{\TableHeading}{
    \fontsize{11}{16}\fontseries{b}%
    \selectfont
}

\DeclareOption{headers1}{\renewcommand{\hBoxHeaders}{2.5em}}
\DeclareOption{headers2}{\renewcommand{\hBoxHeaders}{3.2em}}
\DeclareOption{headers3}{\renewcommand{\hBoxHeaders}{3.9em}}
\DeclareOption{headers4}{\renewcommand{\hBoxHeaders}{4.6em}}
\DeclareOption*{
    \typeout{Unknown option ‘\CurrentOption’. Passing to article class.}%
    \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions\relax
\LoadClass{article} %Class constructed on top of article class

\RequirePackage{ctable}
\RequirePackage{subcaption}

\DeclareCaptionFormat{custom}
{%
    \Text#1#2#3\Text
}
\captionsetup{format=custom}

\renewcommand{\@oddhead}{
    \ifcase\value{page}
    \or
    \else
        \hskip \topHeaderNum
        \hbox to \textwidth{
            \@title ; \@author ; \@date
            \hfill
            \thepage
        }
    \fi
}%

\renewcommand{\@oddfoot}{
    \ifnum\value{page}=1
        %\begin{center}
            1
        %\end{center}
    \fi
}%

\renewcommand\footnotesize{ %to make footnotes of the correct font size
   %\@setfontsize\footnotesize\@ixpt{11}%
   \Footnote
   \abovedisplayskip 8\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\renewcommand{\maketitle}{ %make the title of the document
    \begin{center}
        \Subtitle Department of Materials Science \& Engineering \par
        University of Sheffield \par
        \medskip
        \Title\@title \par
        \bigskip
        \Subtitle\@author \par
        \Subtitle\@date
        \bigskip
        \bigskip
    \end{center}
    \Text
    \ignorespacesafterend
    \vskip -0.8cm
}

\renewcommand{\section}[1]{
    \medskip
    \addtocounter{headingCount}{1}
    \par
    \hskip \headerNum %to fix it to the left side
    \hbox{
        \hbox to \hBoxHeaders{
            \noindent\MainHeading\theheadingCount\hfill
        }
        \hbox{
            \noindent\MainHeading #1
        }
    }
    \setcounter{subHeadingCount}{0}
    \setcounter{subsubHeadingCount}{0}
    \setcounter{subsubsubHeadingCount}{0}
    \setcounter{subsubsubsubHeadingCount}{0}
    \medskip
    
    \Text
    %\ignorespacesafterend
}

%\renewcommand\section{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\MainHeading}}

\renewcommand{\subsection}[1]{
    \medskip
    \addtocounter{subHeadingCount}{1}
    \par
    \hskip \headerNum %to fix it to the left side
    \hbox{
        \hbox to \hBoxHeaders{
            \noindent\SubHeading\theheadingCount.\thesubHeadingCount\hfill
        }
        \hbox{
            \noindent\SubHeading #1
        }
    }
    \setcounter{subsubHeadingCount}{0}
    \setcounter{subsubsubHeadingCount}{0}
    \setcounter{subsubsubsubHeadingCount}{0}
    
    \medskip
    \Text
}

\renewcommand{\subsubsection}[1]{
    \medskip
    \addtocounter{subsubHeadingCount}{1}
    \par
    \hskip \headerNum %to fix it to the left side
    \hbox{
        \hbox to \hBoxHeaders{
            \noindent\SubSubHeading\theheadingCount.\thesubHeadingCount.\thesubsubHeadingCount\hfill
        }
        \hbox{
            \noindent\SubSubHeading #1
        }
    }
    \setcounter{subsubsubHeadingCount}{0}
    \setcounter{subsubsubsubHeadingCount}{0}
    
    \medskip
    \Text
}

\newcommand{\subsubsubsection}[1]{
    \medskip
    \addtocounter{subsubsubHeadingCount}{1}
    \par
    \hskip \headerNum %to fix it to the left side
    \hbox{
        \hbox to \hBoxHeaders{
            \noindent\SubSubSubHeading\theheadingCount.\thesubHeadingCount.\thesubsubHeadingCount.\thesubsubsubHeadingCount\hfill
        }
        \hbox{
            \noindent\SubSubSubHeading #1
        }
    }
    \setcounter{subsubsubsubHeadingCount}{0}
    
    \medskip
    \Text
}

\newcommand{\subsubsubsubsection}[1]{
    \medskip
    \addtocounter{subsubsubsubHeadingCount}{1}
    \par
    \hskip \headerNum %to fix it to the left side
    \hbox{
        \hbox to \hBoxHeaders{
            \noindent\SubSubSubSubHeading\theheadingCount.\thesubHeadingCount.\thesubsubHeadingCount.\thesubsubsubHeadingCount.\thesubsubsubsubHeadingCount\hfill
        }
        \hbox{
            \noindent\SubSubSubSubHeading #1
        }
    }
    \medskip
    \Text
}

\newcommand{\data}[1]{
    \mbox{#1}
}

\newcommand{\thickline}{
    \specialrule{.2em}{.1em}{.1em}
}

\newcommand{\thicklinec}[2]{
    \specialrule{#1em}{#2em}{#2em}
}

\newenvironment{texteqn}[1][0.9]
    {\begin{equation}
    \begin{minipage}{#1\textwidth}}
    {\end{minipage}
    \end{equation}
    \ignorespacesafterend}
    
\newenvironment{nonumtexteqn}[1][0.9]
    {\begin{equation*}
    \begin{minipage}{#1\textwidth}}
    {\end{minipage}
    \end{equation*}
    \ignorespacesafterend}
    
\newcommand\ddfrac[2]{\frac{\displaystyle #1}{\displaystyle #2}}

\newenvironment{numlist}[1]
    {\setcounter{qcounter}{0}
    \begin{list}
    {\arabic{qcounter})~}
    {
    \usecounter{qcounter}
    \setlength\leftmargin{1.5cm}
    %\setlength\itemindent{1cm}
    \setlength\rightmargin{1cm}
    %\setlength\labelwidth{2cm}
    }
    #1}
    {\end{list}}

\renewcommand{\normalsize}{\fontsize{11pt}{16pt}\fontseries{m}\selectfont}
\setlength{\paperheight}{297mm}%
\setlength{\paperwidth}{210mm}%
\setlength{\oddsidemargin}{0mm}%
\setlength{\topmargin}{0mm}%
\setlength{\textwidth}{160mm}%
\setlength{\textheight}{210mm}%
%\setlength{\parindent}{0pt} %paragraphs do not indent