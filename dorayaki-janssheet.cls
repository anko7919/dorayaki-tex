\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dorayaki-janssheet}[2026-09-27]

\LoadClass{dorayaki-ja}
\RequirePackage{dorayaki-ansbox}
\RequirePackage{paracol}

\columnratio{0.8}

\AtBeginDocument{%
  \begin{paracol}{2}%
}

\AtEndDocument{%
  \switchcolumn[1]
  \printans
  \end{paracol}%
}

