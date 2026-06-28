\NeedsTeXFormat{LaTeX2e}[2025-06-01]
\ProvidesClass{dorayaki-article}[2026-06-26]

\ExplSyntaxOn

\dim_new:N \l__dorayaki_fontsize_dim
\fp_new:N \l__dorayaki_linespread_fp
\dim_new:N \l__dorayaki_margin_dim

\keys_define:nn { dorayaki }{%
  fontsize .dim_set:N = \l__dorayaki_fontsize_dim,
  fontsize .initial:n = 11pt,
  linespread .fp_set:N = \l__dorayaki_linespread_fp,
  linespread .initial:n = 1.0,
  margin .dim_set:N = \l__dorayaki_margin_dim,
  margin .initial:n = 3.0cm
}

\ProcessKeyOptions[ dorayaki ]

\ClassInfo{dorayaki-article}{fontsize: \dim_use:N \l__dorayaki_fontsize_dim}
\ClassInfo{dorayaki-article}{linespread: \fp_use:N \l__dorayaki_linespread_fp}
\ClassInfo{dorayaki-article}{margin: \dim_use:N \l__dorayaki_margin_dim}

\PassOptionsToPackage{margin=\l__dorayaki_margin_dim}{geometry}

\AtBeginDocument{%
  \fontsize{%
    \l__dorayaki_fontsize_dim
  }{%
    \dim_eval:n { 1.3 \l__dorayaki_fontsize_dim }
  }\selectfont
  \linespread{ \fp_use:N \l__dorayaki_linespread_fp }
}

\ExplSyntaxOff

\LoadClass{scrartcl}

\RequirePackage{mathtools}
\RequirePackage[default,varnothing]{fontsetup}
\RequirePackage[serif]{dorayaki-font}
\RequirePackage{dorayaki-math}
\RequirePackage[language=english]{dorayaki-thm}
\RequirePackage{microtype}
\RequirePackage{geometry}

