
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2015/06/03 CV class]
\LoadClass[a4paper,11pt]{article}
%\LoadClass[10pt,a4paper,sans]{moderncv}
% \moderncvstyle{classic}
% \moderncvcolor{blue}
% \nopagenumbers{}

\def\@ok{ok}
\def\@fr{}
\DeclareOption{fr}
   {\def\@fr{ok}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{moderncv}}
\ProcessOptions

\newlength{\leftalign}
\setlength{\leftalign}{2.8cm}
\newlength{\halfleftalign}
\setlength{\halfleftalign}{1.4cm}
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
\newlength{\sectionrulehalfwidth}
\setlength{\mleftalign}{-\leftalign}
\setlength{\sectionruleskip}{3mm}
\setlength{\sectionrulewidth}{\leftalign}
\setlength{\sectionrulehalfwidth}{\halfleftalign}
\addtolength{\sectionrulewidth}{-\sectionruleskip}

% \renewcommand\subsection{\@startsection {section}{2}{-3cm}%
%                                    {-2.5ex \@plus -0.1ex \@minus -.2ex}%
%                                    {0.1ex \@plus.2ex}%
%                                    {\Large\bfseries\rule{\sectionrulewidth}{1.5mm}\hs}}

\renewcommand\subsection{\@startsection {section}{2}{\z@}%
                                   {-2.5ex \@plus -0.1ex \@minus -.2ex}%
                                   {0.1ex \@plus.2ex}%
                                   {\Large\bfseries\hspace{\mleftalign}\rule{\sectionrulewidth}{1.5mm}\hspace{\sectionruleskip}}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
{3.25ex \@plus1ex \@minus.2ex}%
{-0.1ex \@plus.2ex}%
{\hspace{\mleftalign}\hspace{\halfleftalign}\hspace{-\sectionruleskip}\rule{\sectionrulehalfwidth}{0.5mm}\hspace{\sectionruleskip}\normalfont\large\bfseries}}

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
backend=bibtex,
%hyperref=true,
natbib=true,
sorting=ydnt,
% citestyle=numbers,%authoryear,
% bibstyle=numbers,%authoryear,
% %backref=true,
% backrefstyle=three,
abbreviate=true,
% alldates=year,
% maxcitenames=1,
firstinits=true,
maxbibnames=100,
% mergedate=true,
% firstinits=true,
% doi=false,
isbn=false,
url=false,
% eprint=false,
]{biblatex}
\AtEveryBibitem{% Clean up the bibtex rather than editing it
  \clearfield{pages}
  \clearfield{arxivId}
}
\renewbibmacro*{bbx:savehash}{}
\renewbibmacro{in:}{}
\DefineBibliographyStrings{french}{andothers={\itshape et~al\adddot},in={dans}}


\newbibmacro{string+doiurlisbn}[1]{%
  \iffieldundef{url}{%
    #1%
  }{%
    \href{\thefield{url}}{#1}%
  }%
}
\newcommand{\doi}[1]{\textsc{doi}: \href{http://dx.doi.org/#1}{\nolinkurl{#1}}}

\DeclareFieldFormat{title}{\usebibmacro{string+doiurlisbn}{\mkbibemph{#1}}}
\DeclareFieldFormat[article,incollection]{title}%
    {\usebibmacro{string+doiurlisbn}{\mkbibquote{#1}}}

\DefineBibliographyExtras{french}{%
  \renewcommand{\mkbibnamelast}[1]{{\hyphenrules{nohyphenation}#1}}}
\DeclareCiteCommand{\citeyear}
  {\boolfalse{citetracker}%
   \boolfalse{pagetracker}%
   \usebibmacro{prenote}}
  {\printtext[bibhyperref]{\printfield{year}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}
\DeclareCiteCommand{\citeauthor}
  {\boolfalse{citetracker}%
   \boolfalse{pagetracker}%
   \usebibmacro{prenote}}
  {\ifciteindex
     {\indexnames{labelname}}
     {}%
   \printtext[bibhyperref]{\printnames{labelname}}}
  {\multicitedelim}
  {\usebibmacro{postnote}}
\DeclareFieldFormat{citehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{#1}}
\DeclareFieldFormat{textcitehyperref}{%
  \DeclareFieldAlias{bibhyperref}{noformat}% Avoid nested links
  \bibhyperref{%
    #1%
    \ifbool{cbx:parens}
      {\bibcloseparen\global\boolfalse{cbx:parens}}
      {}}}
\savebibmacro{cite}
\savebibmacro{textcite}
\renewbibmacro*{cite}{%
  \printtext[citehyperref]{%
    \restorebibmacro{cite}%
    \usebibmacro{cite}}}
\renewbibmacro*{textcite}{%
  \ifboolexpr{
    ( not test {\iffieldundef{prenote}} and
      test {\ifnumequal{\value{citecount}}{1}} )
    or
    ( not test {\iffieldundef{postnote}} and
      test {\ifnumequal{\value{citecount}}{\value{citetotal}}} )
  }
    {\DeclareFieldAlias{textcitehyperref}{noformat}}
    {}%
  \printtext[textcitehyperref]{%
    \restorebibmacro{textcite}%
    \usebibmacro{textcite}}}
\newcommand{\makeauthorbold}[1]{%
\DeclareNameFormat{author}{%
  \ifnumequal{\value{listcount}}{1}
    {\ifnumequal{\value{liststop}}{1}
      {\expandafter\ifstrequal{##1}{#1}{\textbf{##4\addcomma\addspace ##1\addcomma\isdot}}{##4\addcomma\addspace ##1\addcomma\isdot}}
      {\expandafter\ifstrequal{##1}{#1}{\textbf{##4\addcomma\addspace ##1}}{##4\addcomma\addspace ##1}}}
    {\ifnumless{\value{listcount}}{\value{liststop}}
      {\expandafter\ifstrequal{##1}{#1}{\textbf{\addcomma\addspace ##4\addcomma\addspace ##1}}{\addcomma\addspace ##4\addcomma\addspace ##1}}
      {\expandafter\ifstrequal{##1}{#1}{\textbf{\addcomma\addspace ##4\addcomma\addspace ##1\addcomma\isdot}}{\addcomma\addspace ##4\addcomma\addspace ##1\addcomma\isdot}}%
    }%
}%
}
\makeauthorbold{Etancelin}

% \defbibenvironment{bibliography}
% {\list{}
%   {\setlength{\leftmargin}{\bibhang}%
%     \setlength{\itemindent}{-\leftmargin}%
%     \setlength{\itemsep}{\bibitemsep}%
%     \setlength{\parsep}{\bibparsep}}}
% {\endlist}
% {\item}
\defbibenvironment{bibliography}
  {\list
     {\printtext[labelnumberwidth]{%
    \printfield{prefixnumber}%
    \printfield{labelnumber}}}
     {\setlength{\labelwidth}{\labelnumberwidth}%
      \setlength{\leftmargin}{-\labelwidth}%
      \setlength{\labelsep}{\biblabelsep}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}%
      \renewcommand*{\makelabel}[1]{\hss##1}}
  {\addperiod\endlist}%<---- here
  {\item}


\AtBeginDocument{
\renewcommand\labelitemi{}
\renewcommand\labelitemii{}}