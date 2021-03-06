\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tudelft-report}[2013/10/30 v1.1 TU Delft report class]

\newif\if@dutch
\newif\if@english
\DeclareOption{dutch}{\@dutchtrue\@englishfalse}
\DeclareOption{english}{\@dutchfalse\@englishtrue}
\newif\if@nativefonts
\DeclareOption{nativefonts}{\@nativefontstrue}
\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ExecuteOptions{english}
\ProcessOptions\relax

\LoadClass[10pt]{book}

\RequirePackage{amsmath}
\RequirePackage{amssymb}
%% English is the default language, but this can be changed to Dutch by
%% specifying the 'dutch' option to the document class.
\if@dutch
    \RequirePackage[dutch]{babel}
\else
    %% Even for English reports, some sections might be in Dutch, for example on
    %% the title page.
    \RequirePackage[dutch,english]{babel}
\fi
\RequirePackage[nooneline,footnotesize]{caption}
\RequirePackage{fancyhdr}
\RequirePackage[flushmargin,hang]{footmisc}
\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\ifxetex
    \RequirePackage[xetex]{geometry}
    \RequirePackage[xetex]{graphicx}
    \RequirePackage[xetex]{hyperref}
    \RequirePackage{fontspec}
    \RequirePackage{xltxtra}
    \defaultfontfeatures{Ligatures=TeX}
\else
    \ifpdf
        \RequirePackage[pdftex]{geometry}
        \RequirePackage[pdftex]{graphicx}
        \RequirePackage[pdftex]{hyperref}
    \else
        \RequirePackage[dvips]{geometry}
        \RequirePackage[dvips]{graphicx}
        \RequirePackage[hypertex]{hyperref}
    \fi
\fi
\RequirePackage{metalogo}
\RequirePackage[numbers,sort&compress]{natbib}
\RequirePackage{tikz}
\RequirePackage[noindentafter]{titlesec}
\RequirePackage{titletoc}
\RequirePackage[nottoc]{tocbibind}
\RequirePackage{xcolor}
\RequirePackage{xkeyval}





\ifxetex
    %% If the document is compiled with XeLaTeX, we load the TU Delft house
    %% style fonts: Bookman Old Style (serif) for titles and Tahoma (sans-serif)
    %% for text. Even if the nativefonts option was specified, we need these
    %% fonts for the cover.
    \newfontfamily\tudrmfamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{times}
    \newfontfamily\tudsffamily[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        BoldItalicFont = *-Bold,
        BoldItalicFeatures = FakeSlant
    ]{times}
\else
    %% If the document is not compiled with XeLaTeX, we need to use the native
    %% fonts.
    \@nativefontstrue
    \newcommand*\tudrmfamily{\rmfamily}
    \newcommand*\tudsffamily{\sffamily}
\fi

\if@nativefonts
    %% The native font is Utopia Regular with Fourier math. We use Latin Modern
    %% as a fallback, since Utopia lacks support for sans-serif and monospace.
    \RequirePackage[T1]{fontenc}
    \RequirePackage[utf8]{inputenc}
    \RequirePackage{lmodern}
    \RequirePackage{fourier}
    %% The style for titles is small caps.
    \def\titlefont{\rmfamily}
    \def\titleshape{\scshape}
    \def\titlestyle{\titlefont\titleshape\bfseries}
    \if@print
        \def\headerstyle{\titlefont\titleshape\bfseries}
    \else
        \def\headerstyle{\titlefont\titleshape}
    \fi
\else
    %% Apart from Bookman Old Style and Tahoma, we use Courier New for monospace
    %% and Cambria for math.
    \RequirePackage{unicode-math}
    \setmainfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *-Italic,
        BoldItalicFont = *-BoldItalic
    ]{times}
    \setsansfont[
        Path = fonts/,
        Extension = .ttf,
        BoldFont = *-Bold,
        ItalicFont = *,
        ItalicFeatures = FakeSlant,
        BoldItalicFont = *-Bold,
        BoldItalicFeatures = FakeSlant
    ]{times}
    \setmonofont[
        Path = fonts/,
        Extension = .ttf,
        UprightFont = *MT,
        BoldFont = *-BoldMT,
        ItalicFont = *-ItalicMT,
        BoldItalicFont = *-BoldItalicMT
    ]{times}
    \setmathfont[
        Path = fonts/,
        Extension = .ttf
    ]{fourier}
    %% The default style for text is Tahoma (sans-serif).
    \renewcommand*\familydefault{\sfdefault}
    %% The default style for titles is Bookman Old Style (serif).
    \def\titlefont{\rmfamily}
    \def\titleshape{}
    \if@print
        \def\titlestyle{\titlefont\titleshape\bfseries}
    \else
        \def\titlestyle{\titlefont\titleshape}
    \fi
    \def\headerstyle{\titlestyle}
\fi

%% Define the TU Delft house style colors.
\definecolor{tudelft-cyan}{cmyk}{.89,.58,.48,0.30}
\definecolor{tudelft-black}{cmyk}{0,0,0,1}
\definecolor{tudelft-white}{cmyk}{0,0,0,0}
\definecolor{tudelft-sea-green}{cmyk}{0.54,0,0.32,0}
\definecolor{tudelft-green}{cmyk}{1,0.15,0.4,0}
\definecolor{tudelft-dark-blue}{cmyk}{1,0.66,0,0.4}
\definecolor{tudelft-purple}{cmyk}{0.98,1,0,0.35}
\definecolor{tudelft-turquoise}{cmyk}{0.82,0,0.21,0.08}
\definecolor{tudelft-sky-blue}{cmyk}{0.45,0,0.06,0.06}
\definecolor{tudelft-lavendel}{cmyk}{0.45,0.2,0,0.07}
\definecolor{tudelft-orange}{cmyk}{0.02,0.56,0.84,0}
\definecolor{tudelft-warm-purple}{cmyk}{0.58,1,0,0.02}
\definecolor{tudelft-fuchsia}{cmyk}{0.19,1,0,0.19}
\definecolor{tudelft-bright-green}{cmyk}{0.36,0,1,0}
\definecolor{tudelft-yellow}{cmyk}{0.02,0,0.54,0}

%% Use TU Delft cyan as the color for titles, unless the 'print' option is
%% specified.
\if@print
    \colorlet{title}{black}
\else
    \colorlet{title}{tudelft-cyan}
\fi

%% We use A4 paper with slightly smaller margins than the default (scale = 0.7).
\geometry{a4paper,hscale=0.758,vscale=0.829}

%% Redefine the title command to accept an optional subtitle.
\renewcommand*\title[2][]{%
    \def\@subtitle{#1}%
    \def\@title{#2}%
    %% Add the title to the PDF meta data.
    \hypersetup{pdftitle=#2}%
}
%% Redefine the author command to add the name to the PDF meta data.
\renewcommand*\author[1]{%
    \def\@author{#1}%
    \hypersetup{pdfauthor=#1}%
}
%% The affiliation is shown in the blue box on the front cover.
\newcommand*\affiliation[1]{\def\@affiliation{#1}}
%% The cover command is used to specify the filename of the optional cover
%% image.
\newcommand*\coverimage[1]{\def\@cover@image{#1}}
%% The covertext command can be used to specify the text printed on the back
%% cover. This text is inserted in a minipage environment and can therefore
%% include line breaks.
\newcommand\covertext[1]{\def\@cover@text{#1}}

%% The cover image is scaled to fill the width of the front cover.
\newlength\@cover@imagewidth
%% The width of the spine if a back cover is present.
\newlength\@cover@spinewidth
\setlength\@cover@spinewidth{0.375in}
%% Width and height of the boxes on the front and back cover.
\newlength\@cover@frontboxwidth
\setlength\@cover@frontboxwidth{4.375in}
\newlength\@cover@frontboxheight
\setlength\@cover@frontboxheight{2.1875in}
\newlength\@cover@fronttextwidth
\newlength\@cover@fronttextheight
\newlength\@cover@backboxwidth
\setlength\@cover@backboxwidth{4.375in}
\newlength\@cover@backboxheight
\setlength\@cover@backboxheight{2.1875in}
\newlength\@cover@backtextwidth
\newlength\@cover@backtextheight
%% Position on the front cover where the corner of both boxes meet.
\newlength\@cover@x
\setlength\@cover@x{0.8125in}
\newlength\@cover@y
\setlength\@cover@y{3in}
%% The margin around text boxes.
\newlength\@cover@margin
\setlength\@cover@margin{12pt}

%% Define the options for the makecover command.
\define@boolkey{cover}{back}[true]{}
\define@boolkey{cover}{nospine}[true]{}
\define@boolkey{cover}{frontbottom}[true]{}
\define@key{cover}{spinewidth}{\setlength\@cover@spinewidth{#1}}
\define@key{cover}{frontboxwidth}{\setlength\@cover@frontboxwidth{#1}}
\define@key{cover}{frontboxheight}{\setlength\@cover@frontboxheight{#1}}
\define@key{cover}{backboxwidth}{\setlength\@cover@backboxwidth{#1}}
\define@key{cover}{backboxheight}{\setlength\@cover@backboxheight{#1}}
\define@key{cover}{x}{\setlength\@cover@x{#1}}
\define@key{cover}{y}{\setlength\@cover@y{#1}}
\define@key{cover}{margin}{\setlength\@cover@margin{#1}}



%% Remove the header and page number on empty pages.
\def\cleardoublepage{%
    \clearpage%
    \if@twoside%
        \ifodd\c@page%
        \else%
            \thispagestyle{empty}%
            \vspace*{\fill}%
            \newpage%
        \fi%
    \fi%
}

%% Page style for title pages.
\fancypagestyle{plain}{%
    \fancyhf{}
    \renewcommand*\headrulewidth{0pt}
    \renewcommand*\footrulewidth{0pt}
    \fancyfoot[C]{\titlefont\thepage}
}

%% Fancy style for the main matter.
\fancypagestyle{mainmatter}{%
    \fancyhf{}
    %% Page numbers on the top left and top right.
    \fancyhead[LE,RO]{\titlefont\thepage}
    %% Chapter name on the left (even) page.
    \fancyhead[RE]{\titlefont\titleshape\nouppercase{\leftmark}}
    %% Section name on the right (odd) page.
    \fancyhead[LO]{\titlefont\titleshape\nouppercase{\rightmark}}
}

%% The mainmatter style is default for normal pages.
\pagestyle{mainmatter}

%% Print the current chapter and section at the top of the page in cyan.
\renewcommand*\chaptermark[1]{\markboth{\thechapter.\ \color{title}#1}{}}
\renewcommand*\sectionmark[1]{\markright{\thesection.\ \color{title}#1}}

%% The setheader command can be used to print the title of unnumbered chapters
%% in the page header.
\newcommand*\setheader[1]{\markboth{\color{title}#1}{\color{title}#1}}

%% Change the headrule command (from fancyhdr.sty) to draw the line below the
%% header in the title color.
\renewcommand*\headrule{%
    \if@fancyplain%
        \let\headrulewidth\plainheadrulewidth%
    \fi%
    {\color{title}\hrule\@height\headrulewidth\@width\headwidth}%
    \vskip-\headrulewidth%
}

%% Draw the line above a footnote in the title color as well.
\renewcommand*\footnoterule{%
    \vspace*{-3pt}%
    {\color{title}\hrule width 0.5\textwidth height 0.4pt}%
    \vspace*{2.6pt}%
}


%% A part title starts with a huge (96pt) bold black number, flushed to the
%% right, followed by the part name on the next line in the title color.
\titleformat{\part}[display]
    {\flushright\titlestyle}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thepart}
    {0pt}
    {\Huge\color{title}}
%% Separate the title from the text by two empty lines.
\titlespacing{\part}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, the part name is preceded by an empty line, printed
%% in bold, and not followed by a line of dots.
\dottedcontents{part}[0em]{\vspace{\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%% Chapter titles have the same layout as parts.
\titleformat{\chapter}[display]
    {\flushright\titlestyle}
    {\fontsize{96pt}{96pt}\selectfont\bfseries\thechapter}
    {0pt}
    {\Huge\color{title}}
\titlespacing{\chapter}{0pt}{0pt}{2\baselineskip}
%% In the table of contents, a chapter is similar to a part, except that it is
%% preceded by half an empty line.
\dottedcontents{chapter}[1.5em]{\vspace{0.5\baselineskip}\titlefont\bfseries}{1.5em}{0pc}

%\setsecnumformat{\color{title}}
%% Section titles start with the number in bold, followed by the name printed
%% in the title color.
\titleformat{\section}
    {\Large\headerstyle}
    {\bfseries\thesection.\ }
    {0pt}
    {\color{title}}

%% Sections are preceded by an empty line.
\titlespacing{\section}{0pt}{\baselineskip}{0pt}
%% In the table of contents, section names are followed by a line of dots 8pt
%% apart.
\dottedcontents{section}[3.8em]{\titlefont}{2.3em}{8pt}

%% Subsection titles have the same layout as section titles, except in a smaller
%% font.
\titleformat{\subsection}
    {\large\headerstyle}
    {\bfseries\thesubsection.\ }
    {0pt}
    {\color{title}}
\titlespacing{\subsection}{0pt}{\baselineskip}{0pt}
\dottedcontents{subsection}[7em]{\titlefont}{3.2em}{8pt}

%% Subsubsections have the same font and color as sections and subsections, but
%% are not preceded by a number.


\titleformat{\subsubsection}
    {\headerstyle}
    {}
    {0pt}
    {\color{title}}
%% Subsubsections are preceded by an empty line and do not appear in the table
%% of contents.
\titlespacing{\subsubsection}{0pt}{\bigskipamount}{0pt}

%% Color the bullets of the itemize environment and make the symbol of the third
%% level a diamond instead of an asterisk.
\renewcommand*\labelitemi{\color{title}\textbullet}
\renewcommand*\labelitemii{\color{title}--}
\renewcommand*\labelitemiii{\color{title}$\diamond$}
\renewcommand*\labelitemiv{\color{title}\textperiodcentered}

%% Use a custom bibliography style based on apsrev4-1.
\bibliographystyle{tudelft-report}

%% Hyperlinks are cyan, except in print mode, when they are all black.
\hypersetup{
    colorlinks = true,
    citecolor = title,
    linkcolor = title,
    urlcolor = title
}

