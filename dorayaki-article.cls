\NeedsTeXFormat{LaTeX2e}[2025-06-01]
\ProvidesClass{dorayaki-article}[2026-06-26]

\ExplSyntaxOn

\fp_new:N \l__dorayaki_linespread_fp

\keys_define:nn { dorayaki }{%
  linespread .fp_set:N = \l__dorayaki_linespread_fp,
  linespread .initial:n = 1.0,
  DIV .initial:n = calc,
  DIV .code:n = {
    \ClassInfo{ dorayaki-article }{ DIV: #1 }
    \PassOptionsToClass{ DIV=#1 }{ scrartcl }
  },
  unknown .code:n = {
    \ClassInfo{ dorayaki-article }{ \CurrentOption }
    \PassOptionsToClass{ \CurrentOption }{ scrartcl }
  }
}

\ProcessKeyOptions[ dorayaki ]

\ClassInfo{ dorayaki-article }{ linespread: \fp_use:N \l__dorayaki_linespread_fp }

\AtBeginDocument{%
  \linespread{ \fp_use:N \l__dorayaki_linespread_fp }
  \recalctypearea
}

\ExplSyntaxOff

\LoadClass{scrartcl}

\RequirePackage{mathtools}
\RequirePackage[varnothing]{fontsetup}
\RequirePackage[serif]{dorayaki-font}
\RequirePackage{dorayaki-math}
\RequirePackage[language=english]{dorayaki-thm}
\RequirePackage{microtype}

\frenchspacing

