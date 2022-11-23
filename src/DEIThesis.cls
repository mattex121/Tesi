\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{DEIThesis}[DEI Thesis Class]

% -- GENERAL SETUP --

% type
\LoadClass[12,5pt, a4paper, twoside, openright]{book}

% page geometry
\RequirePackage[
  headheight=2cm,
  top=2.5cm,
  bottom=2.5cm,
  footskip=1.5cm,
  footnotesep=1cm,
  twoside,
  a4paper
]{geometry}

% export in PDF/X, PDF/A, etc...
\RequirePackage{etoolbox}
\RequirePackage{colorprofiles}
\RequirePackage[a-2b,mathxmp]{pdfx}[\today]

% language, font and encodings
\RequirePackage{newpxtext,newpxmath}
\RequirePackage[T1]{fontenc}
\RequirePackage[english]{babel}



% -- USEFUL PACKAGES --

% spacings (\onehalfsize, \doublesize)
\RequirePackage{setspace}
\usepackage{enumitem}

% indent first line of paragraph
\RequirePackage{indentfirst}

% captions
\RequirePackage{caption}
\RequirePackage{subcaption}

% footnotes
\RequirePackage{footnote}
\RequirePackage[bottom]{footmisc}

% mathematics
\RequirePackage{amsmath}
\RequirePackage{gensymb}

% links
\RequirePackage{hyperref}
\RequirePackage{url}
\RequirePackage{multirow}

% colors
\RequirePackage{color}

% graphics
\RequirePackage{graphicx}

% chem and algo
\RequirePackage{chemmacros}
\RequirePackage{algorithm}
\RequirePackage{algorithmic}


% code snippets
\RequirePackage{listings}

% plots, drawings etc...
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows.meta}

% references
\RequirePackage[autostyle]{csquotes}
\RequirePackage[backend=biber]{biblatex}
\addbibresource{references.bib}



% -- DEFINITIONS --

% university
\def\university#1{\gdef\@university{#1}}

% master name
\def\mastername#1{\gdef\@mastername{#1}}

% academic Year
\def\academicYear#1{\gdef\@academicYear{#1}}

% student ID
\def\studentId#1{\gdef\@studentId{#1}}

% advisor
\def\advisor#1{\gdef\@advisor{#1}}

% co-advisor (if one)
\def\coadvisor#1{\gdef\@coadvisor{#1}}

% university of Udine color
\definecolor{UniUDColor}{RGB}{0, 0, 244}


% -- LINKS SETUP --

% set all links to black color
\hypersetup{
  colorlinks,
  citecolor=black,
  filecolor=black,
  linkcolor=black,
  urlcolor=black
}



% -- ITEMS AND ENUMARATIONS --

% reduce spacing for items and enumerations
\let\saveditemize=\itemize
\let\savedenditemize=\enditemize
\renewenvironment{itemize}
  {\begin{spacing}{0.5}\saveditemize}
  {\savedenditemize\end{spacing}}

\let\savedenumerate=\enumerate
\let\savedendenumerate=\endenumerate
\renewenvironment{enumerate}
  {\begin{spacing}{0.5}\savedenumerate}
  {\savedendenumerate\end{spacing}}
  

% italic for quotes
\let\savedquote\quote
\let\endsavedquote\endquote
\renewenvironment{quote}
    {\itshape\savedquote}
    {\endsavedquote}



% -- HEADERS AND FOOTERS --

% custom headers and footers
\RequirePackage{fancyhdr}

% custom title style
\RequirePackage{titlesec}

% remove headers and footers in blank pages
\RequirePackage{scrextend}

% box for titles
\RequirePackage{adjustbox}

% style for chapters
\titleformat{\chapter}[display]
{\Huge\filleft}
{
  \minsizebox{!}{70pt}{\colorbox{UniUDColor}{\color{white} \thechapter}}
}
{1.2ex}
{}

% style for sections
\titleformat{\section}[hang]
{\Large}
{
  \colorbox{UniUDColor}{\color{white} \thesection}
}
{1ex}
{\scshape}

% style for subsections
\titleformat{\subsection}[hang]
{\large}
{
  \colorbox{UniUDColor}{\color{white} \thesubsection}
}
{1ex}
{\scshape}

% style for subsubsections
\titleformat{\subsubsection}[hang]
{\normalsize}
{}
{0ex}
{\bfseries\scshape}

% remove line headers
\renewcommand{\headrulewidth}{0ex}

% style for headers and footers
\newcommand{\setfancyhf} {
  \fancyhf{}
  \fancyhead[RO]{{\footnotesize\leftmark}}
  \fancyhead[LE]{{\footnotesize\rightmark}}
  \fancyfoot[RE, LO]{}
  \fancyfoot[C]{\thepage}
}



% -- FRONTMATTER --

\renewcommand{\frontmatter} {
    
  % set roman page numbering
  \pagenumbering{roman}

  % set page style
  \pagestyle{fancy}

  % create cover
  \maketitle

  % reset fancy headers
  \setfancyhf

  % set head witdth
  \setlength{\headwidth}{\textwidth}


  \def\abstractnameit{Sommario}

  \renewcommand{\bibname}{Bibliografia}

  \def\acknowledgmentsname{Ringraziamenti}

  % insert dedication page
  \dedicationpage

  % insert abstract
  \abstractpage

  % insert table of contents
  \renewcommand{\contentsname}{Indice}
  \tableofcontents
  \cleardoublepage

}



% -- TITLE/COVER --

% insert watermark
\RequirePackage{watermark}

\renewcommand{\maketitle} {
  %set custom geometry
  \newgeometry{
    top=1.5cm,
    bottom=2cm,
    inner=2cm,
    outer=2cm,
    headheight=3.5cm,
    includehead,
    includefoot,
  }

  % set head witdth
  \setlength{\headwidth}{\textwidth}

  % set watermark
  \thiswatermark{
    \centering
    \put(-380,-700) {
      \includegraphics[width=1.4\linewidth]{res/10}
    }
  }

  % set academic year in footer
  \cfoot{\normalsize\textsc{Anno accademico \\ \@academicYear}}

  % set brands in header
  \lhead{
    \includegraphics[height=3cm]{res/logo}
  }

  % content
  \begin{center}

    \null \vspace{\stretch{2}}
    \large\textsc{
      Dipartimento Politecnico di Ingegneria e Architettura
    } \\
    % master name
    \null \vspace{3ex}
    \large\textsc{
      Corso di Laurea  in \@mastername
    } \\

    % title
    \vspace{3ex}
    \huge\textbf{\@title} \\
    \vspace{\stretch{3}}

    % authors, advisors etc...
    \doublespacing

    \begin{flushleft}
      \small
      \textsc{Laureando} \hfill \textsc{Relatore} \\
      \large{\textbf{\@author}} \hfill \large{\textbf{\@advisor}} \\
      \small
      \textbf{Matricola \@studentId} \hfill
    \end{flushleft}

    \vspace{\stretch{1}} \null
  \end{center}

  % restore defaults
  \cleardoublepage
  \restoregeometry
  \onehalfspacing
}



% -- DEDICATION --

\newcommand{\dedicationpage} {
  % set empty style for this page (no headers and footers)
  \thispagestyle{empty}

  \phantomsection
  
  \null \vspace{\stretch{1}}

  \begin{flushright}
    \input{frontmatter/dedication}
  \end{flushright}

  \vspace{\stretch{4}} \null
  
  % insert pages for alignment
  \cleardoublepage
}


% -- ABSTRACT --

\newenvironment{abstract}[1][en] {
  % get argument (en/it)
  \def\it{it}
  \def\arg{#1}

  \null \vfill
  \begin{center}
    \bfseries
    
    % set title in english or italian
    \ifx\arg\it
      \abstractnameit
    \else
      \abstractname
    \fi
  \end{center}
} {
  \vfill \null
}

\newcommand{\abstractpage} {
  % set empty style for this page (no headers and footers)
  \thispagestyle{empty}

  % english version
  \input{frontmatter/sommario}
}



% -- MAIN MATTER --

\renewcommand{\mainmatter} {
  \cleardoublepage

  % reset page counter
  \setcounter{page}{1}

  % set arabic page numbering
  \pagenumbering{arabic}

  % reset chapter counter
  \setcounter{chapter}{0}
}



% -- BACKMATTER --

\renewcommand{\backmatter}{
  \cleardoublepage
  \phantomsection

  % add references
  \addcontentsline{toc}{chapter}{\bibname}
  \printbibliography
  
  \cleardoublepage
  \phantomsection

  % add acknowledgments
  \addcontentsline{toc}{chapter}{\acknowledgmentsname}
  \acknowledgments
}



% -- ACKNOWLEDGMENTS --
\newcommand{\acknowledgments} {
  \phantomsection
  \chapter*{\acknowledgmentsname}
  \input{frontmatter/thanks}
}


% -- CODE SNIPPETS --

% Colors for code snippets highlights
\definecolor{commentsColor}{RGB}{36, 161, 156}
\definecolor{numColor}{RGB}{71, 96, 114}
\definecolor{stringColor}{RGB}{205, 63, 62}
\definecolor{kwColor}{RGB}{248, 6, 204}
\definecolor{bgCodeColor}{RGB}{255, 249, 249}

% Style of code snippets
\lstdefinestyle{codeSnippet} {
  backgroundcolor=\color{bgCodeColor},
  commentstyle=\color{commentsColor},
  keywordstyle=\color{kwColor},
  numberstyle=\tiny\color{numColor},
  stringstyle=\color{stringColor},
  basicstyle=\ttfamily\footnotesize,
  breakatwhitespace=false,         
  breaklines=true,                 
  captionpos=b,                    
  keepspaces=true,                 
  numbers=left,                    
  numbersep=5pt,                  
  showspaces=false,                
  showstringspaces=false,
  showtabs=false,                  
  tabsize=2
}

\lstset{style=codeSnippet}