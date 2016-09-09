
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2015/06/03 CV class]
\LoadClass[a4paper]{article}
\def\@ok{ok}
\def\@fr{}
\DeclareOption{fr}
   {\def\@fr{ok}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\newlength{\leftalign}
\setlength{\leftalign}{2.8cm}
\newlength{\cvleftmargin}
\setlength{\cvleftmargin}{1.5cm}
\addtolength{\cvleftmargin}{\leftalign}

\RequirePackage{fancyhdr}
\RequirePackage[margin=1.7cm,left=\cvleftmargin]{geometry}
\RequirePackage{ifthen}

\ifx\@fr\@ok
\RequirePackage[french]{babel}
\fi

\pagestyle{empty}

\renewcommand\maketitle{%
  \hspace{-\leftalign}\begin{minipage}[l]{.6\textwidth}
    \Huge\@author\par
    \Large\@title\par
  \end{minipage}\hfill
  \begin{minipage}[r]{.4\textwidth}
    \raggedleft
    \@date
  \end{minipage}\par\vspace{1.3cm}}

\renewcommand\familydefault{\sfdefault}

\newlength{\sectionrulewidth}
\newlength{\sectionruleskip}
\newlength{\mleftalign}
\setlength{\mleftalign}{-\leftalign}
\setlength{\sectionruleskip}{3mm}
\setlength{\sectionrulewidth}{\leftalign}
\addtolength{\sectionrulewidth}{-\sectionruleskip}

% \renewcommand\subsection{\@startsection {section}{2}{-3cm}%
%                                    {-2.5ex \@plus -0.1ex \@minus -.2ex}%
%                                    {0.1ex \@plus.2ex}%
%                                    {\Large\bfseries\rule{\sectionrulewidth}{1.5mm}\hs}}

\renewcommand\subsection{\@startsection {section}{2}{\z@}%
                                   {-2.5ex \@plus -0.1ex \@minus -.2ex}%
                                   {0.1ex \@plus.2ex}%
                                   {\Large\bfseries\hspace{\mleftalign}\rule{\sectionrulewidth}{1.5mm}\hspace{\sectionruleskip}}}

% \renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
% {3.25ex \@plus1ex \@minus.2ex}%
% {-0.1ex \@plus.2ex}%
% {\hspace{\mleftalign}\normalfont\normalsize\bfseries}}


% \renewcommand\subsection{\@startsection {section}{2}{\z@}%
%                                    {-2.5ex \@plus -0.1ex \@minus -.2ex}%
%                                    {0.1ex \@plus.2ex}%
%                                    {\Large\bfseries\rule{\sectionrulewidth}{1.5mm}\hspace{\sectionruleskip}}}

% \renewcommand\section{\@startsection {section}{2}{\z@}%
%                                    {-2.5ex \@plus -0.1ex \@minus -.2ex}%
%                                    {0.1ex \@plus.2ex}%
%                                    {\Large\bfseries\rule{\sectionrulewidth}{1.5mm}\hspace{\sectionruleskip}}}

\setlength\parskip{0.3em}
\setlength\parindent{0pt}

\RequirePackage{enumitem}
\setlist[description,1]{%
  topsep=0pt,partopsep=0pt,parsep=0pt,itemsep=0pt,
  labelwidth=\leftalign,align=right,labelsep=3mm,
  leftmargin=10pt,
  itemindent=-10pt,
  font={\normalfont\small\bfseries},
}

\setlist[itemize,1]{%
  topsep=0pt,partopsep=0pt,parsep=0pt,itemsep=0pt,
  labelsep=3mm,
  labelwidth=0pt,%\leftalign,
  align=right,
  leftmargin=10pt,
  itemindent=0pt,
}

% \setlist[itemize,2]{%
%   partopsep=0pt,
%   parsep=0pt,
%   topsep=0pt,
%   itemsep=0pt,
%   labelwidth=0pt,%,align=right,
%   leftmargin=10pt,
%   itemindent=-10pt,
%   labelsep=0pt,
%   before={\vspace{-.5em}},
%   after={\vspace{-.5em}},
% }





\usepackage[
sorting=none,
backend=bibtex,
hyperref=true,
%natbib=true,
%citestyle=authoryear,
%bibstyle=authoryear,
%backref=true,
backrefstyle=three,
abbreviate=false,
alldates=year,
maxcitenames=1,
maxbibnames=100,
%mergedate=true,
firstinits=true,
doi=true,
isbn=false,
url=false,
eprint=false,
]{biblatex}
\AtEveryBibitem{% Clean up the bibtex rather than editing it
  \clearfield{pages}
  \clearfield{arxivId}
}
\newbibmacro{string+doiurlisbn}[1]{%
  \iffieldundef{url}{%
    \iffieldundef{doi}{%
      \href{http://dx.doi.org/\thefield{doi}}{#1}%
    }%
  }{%
    \href{\thefield{url}}{#1}%
  }%
}
\DeclareFieldFormat[article,inproceedings]{title}%
    {\usebibmacro{string+doiurlisbn}{\mkbibquote{#1}}}
\DeclareFieldFormat{doi}{\href{http://dx.doi.org/#1}{(\mkbibacro{DOI}:#1)}}
\renewbibmacro{in:}{}


\AtBeginDocument{
\renewcommand\labelitemi{}
\renewcommand\labelitemii{}}