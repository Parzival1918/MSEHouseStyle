\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{MSEHouseStyle}[2022/03/09 Document class of the official Materials Science and Engineering Department House Style.]

\newcounter{coverPage}
\newcounter{pageNum}
\newcounter{qcounter}
\newcounter{headingCount}
\newcounter{subHeadingCount}
\newcounter{subsubHeadingCount}
\newcounter{subsubsubHeadingCount}
\newcounter{subsubsubsubHeadingCount}
\setcounter{coverPage}{0}
\setcounter{pageNum}{1}
\setcounter{headingCount}{0}
\setcounter{subHeadingCount}{0}
\setcounter{subsubHeadingCount}{0}
\setcounter{subsubsubHeadingCount}{0}
\setcounter{subsubsubsubHeadingCount}{0}

\newcommand{\hBoxHeaders}{2.5em}
\newcommand{\headerNum}{-2em}
\newcommand{\headerNumStar}{-1.8em}
\newcommand{\topHeaderNum}{-0.2cm}

\newcommand{\university}{The University of Sheffield}
\newcommand{\department}{Materials Science \& Engineering}
\newcommand{\country}{United Kingdom}
\newcommand{\subtitle}{Subtitle}

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
\RequirePackage{ifthen}
\RequirePackage{titling}
\RequirePackage[sorting=none]{biblatex}

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
            \ifnum\thecoverPage=0
                \thepage
            \else
                \thepageNum
                \addtocounter{pageNum}{1}
            \fi
        }
    \fi
}%

\renewcommand{\@oddfoot}{
    \ifnum\thecoverPage=0
        \ifnum\value{page}=1
            %\begin{center}
                1
            %\end{center}
        \fi
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

\makeatletter
\renewcommand{\section}{\@ifstar\sectionStar\sectionNoStar}
\makeatother

\newcommand{\sectionNoStar}[1]{
    \phantomsection
    \bigskip
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
    
    \addcontentsline{toc}{section}{\theheadingCount\hspace{1em}#1}
    \medskip
    
    \Text
    %\ignorespacesafterend
}

\newcommand{\sectionStar}[1]{
    \phantomsection
    \bigskip
    \hskip \headerNumStar
    \hbox{
        \noindent\MainHeading #1
    }
    %\addcontentsline{toc}{section}{#1}
    \medskip
    
    \Text
    %\ignorespacesafterend
}

%\renewcommand\section{\@startsection {section}{1}{\z@}%
%                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
%                                   {2.3ex \@plus.2ex}%
%                                   {\MainHeading}}

\makeatletter
\renewcommand{\subsection}{\@ifstar\subsectionStar\subsectionNoStar}
\makeatother

\newcommand{\subsectionNoStar}[1]{
    \phantomsection
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
    
    \addcontentsline{toc}{subsection}{\theheadingCount.\thesubHeadingCount\hspace{1em}#1}
    \medskip
    \Text
}

\newcommand{\subsectionStar}[1]{
    \phantomsection
    \bigskip
    \hskip \headerNumStar
    \hbox{
        \noindent\SubHeading #1
    }
    %\addcontentsline{toc}{section}{#1}
    \medskip
    
    \Text
    %\ignorespacesafterend
}

\makeatletter
\renewcommand{\subsubsection}{\@ifstar\subsubsectionStar\subsubsectionNoStar}
\makeatother

\newcommand{\subsubsectionNoStar}[1]{
    \phantomsection
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

\newcommand{\subsubsectionStar}[1]{
    \phantomsection
    \bigskip
    \hskip \headerNumStar
    \hbox{
        \noindent\SubSubHeading #1
    }
    %\addcontentsline{toc}{section}{#1}
    \medskip
    
    \Text
    %\ignorespacesafterend
}

\makeatletter
\newcommand{\subsubsubsection}{\@ifstar\subsubsubsectionStar\subsubsubsectionNoStar}
\makeatother

\newcommand{\subsubsubsectionNoStar}[1]{
    \phantomsection
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

\newcommand{\subsubsubsectionStar}[1]{
    \phantomsection
    \bigskip
    \hskip \headerNumStar
    \hbox{
        \noindent\SubSubSubHeading #1
    }
    %\addcontentsline{toc}{section}{#1}
    \medskip
    
    \Text
    %\ignorespacesafterend
}

\makeatletter
\newcommand{\subsubsubsubsection}{\@ifstar\subsubsubsubsectionStar\subsubsubsubsectionNoStar}
\makeatother

\newcommand{\subsubsubsubsectionNoStar}[1]{
    \phantomsection
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

\newcommand{\subsubsubsubsectionStar}[1]{
    \phantomsection
    \bigskip
    \hskip \headerNumStar
    \hbox{
        \noindent\SubSubSubSubHeading #1
    }
    %\addcontentsline{toc}{section}{#1}
    \medskip
    
    \Text
    %\ignorespacesafterend
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
    
\newenvironment{boxed}[1]
    {\begin{center}
    \ifthenelse{\equal{#1}{}}{}{\TableHeading#1\Text\\*[1ex]}
    \begin{tabular}{|p{0.9\textwidth}|}
    \hline\\
    }
    {\\\\\hline
    \end{tabular}\end{center}
    }
    
%%Afegir pagina de portada i contraportada si es passa un parametre a la classe. Suposo que es util en treballs de final de curs?

\newcommand{\setuniversity}[1]{
    \renewcommand{\university}{#1}
}

\newcommand{\setdepartment}[1]{
    \renewcommand{\department}{#1}
}

\newcommand{\setcountry}[1]{
    \renewcommand{\country}{#1}
}

\newcommand{\setsubtitle}[1]{
    \renewcommand{\subtitle}{#1}
}

\newcommand{\makecoverpage}{
    \setcounter{coverPage}{1}
    \begin{center}
        \vspace*{3em}
        \Title \thetitle \par
        \vspace{0.5em}
        \Subtitle\subtitle
        
        \vfill
        \includegraphics[width = 0.4\textwidth]{UoS.png} \par
        \Emphasis\department \par
        \university \par
        \Text\country \par
        \theauthor \par
        \thedate
        
        \Text
    \end{center}
    \clearpage
}

%Canviar l'estil de la bibliografia
\renewcommand*{\newunitpunct}{\addcomma\space}

\DeclareFieldFormat
  [article,incollection,inproceedings,patent,thesis,unpublished,misc,online,book,inbook]
  {title}{\textit{#1}}

\DeclareFieldFormat
  [article]
  {volume}{\textbf{#1}}

%\DeclareFieldFormat
%  [article]
%  {number}{\textbf{#1}}
  
\DeclareFieldFormat
  [incollection,inproceedings,patent,thesis,unpublished,misc,online,book,inbook,article]
  {year}{({#1})}

\DeclareFieldFormat
  [inbook]
  {chapter}{\mkbibquote{#1}} 
  
\DeclareFieldFormat
  [article]
  {journaltitle}{#1} 

\DeclareFieldFormat
  [inbook]
  {date}{({#1})} 
  
\DeclareBibliographyDriver{book}{%
  \printnames{author}%
  \newunit\newblock
  \printfield{title}%
  \newunit\newblock
  \printfield{year}%
  \newunit
  \printlist{publisher}%
  \newunit
  \printlist{location}%
  \newunit
  \printfield{pages}
  \newunit
  \printfield{isbn}
  \finentry}
  
\DeclareBibliographyDriver{inbook}{%
  \printnames{author}%
  \newunit\newblock
  \printfield{chapter}%
  \newunit\newblock
  \printfield{addendum}
  \newunit
  \printfield{title}%
  \newunit
  \printfield{year}%
  \newunit
  \printlist{publisher}%
  \newunit
  \printlist{location}%
  \newunit
  \printfield{pages}
  \newunit
  \printfield{isbn}
  \finentry}
  
\DeclareBibliographyDriver{article}{ %Article entry format
  \printnames{author}%
  \newunit\newblock
  \printfield{title}%
  \newunit\newblock
  \printfield{journaltitle}
  \newunit
  \printfield{volume}
  \newunit\newblock
  \printfield{year}
  \newunit
  \iffieldundef{number}
    {\printfield{pages}}
    {\printfield{number}}
  \newunit
  \printfield{doi}
  \finentry}

\DeclareBibliographyDriver{online}{ %Article entry format
  \printnames{author}%
  \newunit\newblock
  \printfield{title}%
  \newunit\newblock
  \printfield{url}
  \newunit
  \printfield{addendum}
  \finentry}
  
\renewcommand{\normalsize}{\fontsize{11pt}{16pt}\fontseries{m}\selectfont}
\setlength{\paperheight}{297mm}%
\setlength{\paperwidth}{210mm}%
\setlength{\oddsidemargin}{0mm}%
\setlength{\topmargin}{0mm}%
\setlength{\textwidth}{160mm}%
\setlength{\textheight}{210mm}%
%\setlength{\parindent}{0pt} %paragraphs do not indent
