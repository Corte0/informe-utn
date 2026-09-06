\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{informeutn}[2026/09/05 Clase para informes UTN-FRC]

\newif\ifchaptersright
\chaptersrightfalse % valor por defecto

\DeclareOption{chaptersright}{\chaptersrighttrue}

\ExecuteOptions{}
\ProcessOptions\relax

\ifchaptersright
  \LoadClass[12pt,openright,twoside]{report}
\else
  \LoadClass[12pt,openany]{report}
\fi

% Paquetes esenciales
\RequirePackage{emptypage}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{amsmath, amsfonts}
\RequirePackage{xfrac}
\RequirePackage{float}
\RequirePackage{enumitem}
\RequirePackage{booktabs}
\RequirePackage{indentfirst}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\RequirePackage{circuitikz}
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}
\RequirePackage{afterpage}
\RequirePackage[main=spanish, provide=*]{babel}
\RequirePackage{hyperref}
\RequirePackage{caption}
\RequirePackage{wrapfig}  % queda para no romper retro compatibilidad, eliminar en próxima version
\RequirePackage{siunitx}
\RequirePackage{subcaption}
\RequirePackage[backend=bibtex, style=alphabetic, sorting=ynt]{biblatex}
\RequirePackage{xcolor}
\RequirePackage{pdfpages}
\RequirePackage{listings}
\usetikzlibrary{plotmarks}
\captionsetup{justification=centering}
\pgfplotsset{compat=1.18}

% configuracion de hipervinculos
\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black
}

% Márgenes y geometría
\geometry{
  left=2.5cm, right=2.5cm,
  top=2cm, bottom=2cm,
  includehead
}

% Encabezados y pies de página
\pagestyle{fancy}
\fancyhf{}
\lhead{UTN-FRC}
\chead{\@materia}
\rhead{\@comision}
\cfoot{\thepage}
\setlength{\headheight}{15pt}
\setlength{\headsep}{20pt}
\setlength{\headwidth}{\textwidth}

% Comandos personalizados
\newcommand{\materia}[1]{\def\@materia{#1}}
\newcommand{\comision}[1]{\def\@comision{#1}}
\newcommand{\titulo}[1]{\def\@titulo{#1}}
\newcommand{\@subtitulo}{}  % Inicialmente vacío
\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}
\newcommand{\autores}[1]{\def\@autores{#1}}
\newcommand{\fecha}[1]{\def\@fecha{#1}}

% UNIDADES UTILES (Retrocompatibles vía siunitx)
% --- Resistencias ---
\newcommand{\ohm}{\,\unit{\ohm}}
\newcommand{\kohm}{\,\unit{\kilo\ohm}}
\newcommand{\Mohm}{\,\unit{\mega\ohm}}

% --- Capacitancias ---
\newcommand{\nF}{\,\unit{\nano\farad}}
\newcommand{\uF}{\,\unit{\micro\farad}}
\newcommand{\mF}{\,\unit{\milli\farad}}
\newcommand{\F}{\,\unit{\farad}}

% --- Tensión ---
\newcommand{\uV}{\,\unit{\micro\volt}}
\newcommand{\mV}{\,\unit{\milli\volt}}
\newcommand{\V}{\,\unit{\volt}}
\newcommand{\kV}{\,\unit{\kilo\volt}}

% --- Corriente ---
\newcommand{\uA}{\,\unit{\micro\ampere}}
\newcommand{\mA}{\,\unit{\milli\ampere}}
\newcommand{\A}{\,\unit{\ampere}}

% --- Inductancias ---
\newcommand{\mH}{\,\unit{\milli\henry}}
\newcommand{\uH}{\,\unit{\micro\henry}}
\newcommand{\nH}{\,\unit{\nano\henry}}

% --- Frecuencia ---
\newcommand{\Hz}{\,\unit{\hertz}}

% --- Potencia ---
\newcommand{\W}{\,\unit{\watt}}       % Watt
\newcommand{\mW}{\,\unit{\milli\watt}} % miliWatt
\newcommand{\kW}{\,\unit{\kilo\watt}}  % kiloWatt

% --- Energía ---
\newcommand{\J}{\,\unit{\joule}}       % Joule
\newcommand{\mJ}{\,\unit{\milli\joule}} % miliJoule
\newcommand{\kJ}{\,\unit{\kilo\joule}}  % kiloJoule
\newcommand{\Wh}{\,\unit{\watt\hour}}      % Watt-hora
\newcommand{\kWh}{\,\unit{\kilo\watt\hour}} % kiloWatt-hora

% --- Temperatura ---
\newcommand{\Celsius}{\,\unit{\degreeCelsius}} % Grados Celsius
\newcommand{\Kelvin}{\,\unit{\kelvin}}         % Kelvin

% --- Tiempo ---
\newcommand{\s}{\,\unit{\second}}
\newcommand{\ms}{\,\unit{\milli\second}}       % milisegundos
\newcommand{\us}{\,\unit{\micro\second}}       % microsegundos
\newcommand{\ns}{\,\unit{\nano\second}}

% --- Otros ---
\newcommand{\percent}{\,\unit{\percent}}

% Estilo de capítulos y secciones
\titleformat{\chapter}[hang]{\normalfont\LARGE\bfseries}{}{0pt}{}
\titlespacing*{\chapter}{10pt}{0pt}{20pt}
\patchcmd{\chapter}{\thispagestyle{plain}}{\thispagestyle{fancy}}{}{}

\titleformat{\section} {\normalfont\Large\bfseries} {}{0pt}{}
\titlespacing*{\section} {12pt}{18pt plus 2pt minus 2pt}{8pt}

\titleformat{\subsection} {\normalfont\large\bfseries}{}{0pt}{}
\titlespacing*{\subsection} {15pt}{12pt plus 1pt minus 1pt}{6pt}

% Índice
\renewcommand{\contentsname}{Tabla de Contenidos}

% Interlineado de las tablas
\renewcommand{\arraystretch}{1.5}

% Carátula automática
\def\maketitle{
  \begin{titlepage}
    \centering
    \vspace*{1cm}
    \includegraphics[width=0.2\textwidth]{UTN_logo.png}\par\vspace{1cm}
    {\Huge Universidad Tecnológica Nacional\\
    Facultad Regional Córdoba\par}
    \vspace{2cm}
    {\Huge \bfseries \@titulo \par}
    {\Large \ \@subtitulo \par}
    \vspace{1.5cm}
    {\LARGE \@materia \par}
    \vspace{0.2cm}
    {\Large \@comision\par}
    \vfill
    {\Large \@autores \par}
    \vspace{1cm}
    {\Large Fecha de entrega: \@fecha \par}
  \end{titlepage}
}

