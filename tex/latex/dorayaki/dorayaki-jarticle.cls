\NeedsTeXFormat{LaTeX2e}[2025-06-01]
\ProvidesClass{dorayaki-jarticle}[2026-06-27]

\ExplSyntaxOn

\fp_new:N \l__dorayaki_linespread_fp

\keys_define:nn { dorayaki }{%
  linespread .fp_set:N = \l__dorayaki_linespread_fp,
  linespread .initial:n = 1.0,
  linespread .code:n = { \ClassInfo{ dorayaki-jarticle }{ linespread: #1 } },
  jafontscale .code:n = {
    \ClassInfo{ dorayaki-jarticle }{ jafontscale: #1 }
    \PassOptionsToClass{jafontscale=#1}{jlreq}
    \PassOptionsToPackage{jafontscale=#1}{dorayaki-font}
  },
  jafontscale .initial:n = 0.9247,
  unknown .code:n = {
    \ClassInfo{ dorayaki-jarticle }{ unknown-option: \CurrentOption }
    \PassOptionsToClass{ \CurrentOption }{ jlreq }
  },
}

\PassOptionsToClass{ hanging_punctuation }{ jlreq }

\ProcessKeyOptions[ dorayaki ]

\AtBeginDocument{%
  \linespread{ \fp_use:N \l__dorayaki_linespread_fp }
}

\ExplSyntaxOff

\LoadClass{jlreq}

\RequirePackage{mathtools}
\RequirePackage[varnothing]{fontsetup}
\RequirePackage[serif,jpn]{dorayaki-font}
\RequirePackage{dorayaki-math}
\RequirePackage[language=japanese]{dorayaki-thm}

\RenewDocumentCommand{\emph}{ m }{\textbf{#1}}

