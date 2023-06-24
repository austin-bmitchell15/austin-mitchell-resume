%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author: Austin Mitchell                              %
% MS CSE ASU                                           %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{resume}[Austin's Resume class]

\LoadClass[10pt,letterpaper]{article} % Font size and paper type

% set document margins
\usepackage[left=0.5 in,top=0.4in,right=0.5in,bottom=0.4in]{geometry}
\usepackage[parfill]{parskip} % Remove paragraph indentation

\usepackage{keycommand}
\usepackage{xstring}
\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    urlcolor=black,
}

% Load the fontspec package to set the font
\usepackage{times} % Load the Helvetica font
\usepackage[T1]{fontenc} % Use the T1 font encoding to ensure proper character rendering

\pagestyle{empty}

\def \separator {\text{\Large\textbullet}}

\newcommand\printNameTitle[1]{%
    \begingroup
    \hfill{\huge\bfseries #1}\hfill
    \break
    \vspace{-0.5em}
    \hrule
    \endgroup
}

\newcommand{\printContactInformation}{%
  \vspace{-0.3em} % remove vertical space above
  \begin{center}
    \ifcommandkey{phone}{%
        \commandkey{phone}%
        \ifcommandkey{email}{ \separator\ }%
            {\ifcommandkey{linkedin}{ \separator\ }%
                {\ifcommandkey{github}{ \separator\ }%
                    {}}}%
    }{}%
    \ifcommandkey{email}{%
        \email{\commandkey{email}}%
            \ifcommandkey{linkedin}{ \separator\ }%
                {\ifcommandkey{github}{ \separator\ }}%
    }{}%
    \ifcommandkey{linkedin}{%
            \profilelink{\commandkey{linkedin}}%
            \ifcommandkey{github}{ \separator\ }{}%
    }{}%
    \ifcommandkey{github}{%
        \profilelink{\commandkey{github}}%
    }{}%
  \end{center}
}

\newcommand{\email}[1]{\href{mailto:#1}{#1}}
\newcommand{\profilelink}[1]{\href{https://#1}{#1}}

\newkeycommand{\introduction}[fullname,email,phone,linkedin,github,]{
    \printNameTitle{\commandkey{fullname}}
    \printContactInformation
}

\newcommand{\newsection}[1]{
    \textbf{\MakeUppercase{#1}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newcommand{\summary}[1]{
    \newsection{summary}
    #1
}

\newcommand{\education}[1]{
    \newsection{education}
    #1

}

\newkeycommand{\educationItem}[university,program,city,state,graduation,grade,coursework]{
    {\bf \commandkey{university}} \hfill {\commandkey{city}, \commandkey{state}} \\
    {\it \commandkey{program}} \hfill {Expected \commandkey{graduation}}{} \\
    {\begin{itemize}
        \vspace{-1.7em}
        \itemsep -6pt {} 
        \item GPA: \commandkey{grade}/4.00
        \item Relevant coursework: \commandkey{coursework}
    \end{itemize}}{}
}

\newcommand{\skills}{
    \textbf{\MakeUppercase{skills}}
    \vspace{0.4em}
    \hrule
    \vspace{-0.3em}
}

\newkeycommand{\skillItem}[category, skills]{
    {\bf \commandkey{category}:} {\commandkey{skills}}
}

\newenvironment{workSection}[1]{
  \textbf{\MakeUppercase{#1}}
  \vspace{0.4em}
  \hrule
  \vspace{-0.3em}
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}

\newenvironment{bullets}{
    \begin{itemize}
        \vspace{-0.5em}
        \itemsep -6pt {} 
    }{
    \end{itemize}
}

\newkeycommand{\experienceItem}[company, position, location, duration]{
    \textbf{\commandkey{company}} \hfill {\commandkey{location}} \\
    {\it \commandkey{position}} \hfill {\commandkey{duration}}
}

\newkeycommand{\customItem}[title, duration, location, keyHighlight]{
    \textbf{\commandkey{title}} \hfill {\commandkey{location}} \\
    {\it \commandkey{keyHighlight}} \hfill {\commandkey{duration}}{}
}