\NeedsTeXFormat{LaTeX2e}[2025-06-01]
\ProvidesClass{dorayaki-poster}[2026-08-30]

\ExplSyntaxOn

% \debug_on:n{ all }

\bool_new:N \l__dorayaki_subtitle_on_bool
\tl_new:N \l__dorayaki_subtitle_tl
\dim_new:N \l__dorayaki_fontsize_dim
\fp_new:N \l__dorayaki_vert_space_rate_fp

\bool_set_false:N \l__dorayaki_subtitle_on_bool

\keys_define:nn{ dorayaki/poster }{
  fontsize .dim_set:N = \l__dorayaki_fontsize_dim,
  fontsize .initial:n = { 50pt },
  vertspacerate .fp_set:N = \l__dorayaki_vert_space_rate_fp,
  vertspacerate .initial:n = { 1.5 },
  unknown .code:n = {
    \PackageInfo{ dorayaki-poster }{ passed~'#1'~to~tikzposter }
    \PassOptionsToClass{ \CurrentOption }{ tikzposter }
  },
}
\ProcessKeyOptions[ dorayaki/poster ]

\NewDocumentCommand{\subtitle}{m}{
  \bool_set_true:N \l__dorayaki_subtitle_on_bool
  \tl_set:Nn \l__dorayaki_subtitle_tl { #1 }
}

\NewDocumentCommand{\putsubtitle}{}{
  \bool_if:NT \l__dorayaki_subtitle_on_bool {
    \large \tl_use:N\l__dorayaki_subtitle_tl \par
  }
}

% 1: サイズ名
% 2: 基本サイズ
% 3: スケール
\cs_new:Nn \__dorayaki_set_fontsize:Nnn {
  \RenewDocumentCommand{ #1 }{}{
    \fontsize{
      \fp_eval:n{ \dim_to_fp:n{ #2 } * #3 }pt }
                { \fp_eval:n{ \dim_to_fp:n{ #2 } * #3 * \l__dorayaki_vert_space_rate_fp }pt
    }\selectfont }
}
\NewDocumentCommand{\setfontsize}{}{
  \__dorayaki_set_fontsize:Nnn \tiny { \l__dorayaki_fontsize_dim }{ 0.4 }
  \__dorayaki_set_fontsize:Nnn \scriptsize { \l__dorayaki_fontsize_dim }{ 0.5 }
  \__dorayaki_set_fontsize:Nnn \footnotesize { \l__dorayaki_fontsize_dim }{ 0.6 }
  \__dorayaki_set_fontsize:Nnn \small { \l__dorayaki_fontsize_dim }{ 0.7 }
  \__dorayaki_set_fontsize:Nnn \normalsize { \l__dorayaki_fontsize_dim }{ 0.8 }
  \__dorayaki_set_fontsize:Nnn \large { \l__dorayaki_fontsize_dim }{ 1 }
  \__dorayaki_set_fontsize:Nnn \Large { \l__dorayaki_fontsize_dim }{ 1.2 }
  \__dorayaki_set_fontsize:Nnn \LARGE { \l__dorayaki_fontsize_dim }{ 1.4 }
  \__dorayaki_set_fontsize:Nnn \huge { \l__dorayaki_fontsize_dim }{ 1.9 }
  \__dorayaki_set_fontsize:Nnn \Huge { \l__dorayaki_fontsize_dim }{ 2.1 }
}

\ExplSyntaxOff

% load
\LoadClass[a0paper,portrait,margin=2cm]{tikzposter}
\RequirePackage{xcolor}
\RequirePackage{luatexja}
\RequirePackage[varnothing]{fontsetup}
\RequirePackage[sans,jpn,jafontscale=0.92,mathfontscale=1.1]{dorayaki-font}

\setfontsize

% color
\definecolorpalette{dorayakicolorpalette}{%
  \definecolor{colorOne}{named}{darkgray}
  \definecolor{colorTwo}{named}{gray}
  \definecolor{colorThree}{named}{lightgray}
}
\definecolorstyle{dorayakicolorstyle}{%
  \definecolor{colorOne}{named}{darkgray}
  \definecolor{colorTwo}{named}{gray}
  \definecolor{colorThree}{named}{lightgray}
}{%
  % background colors
  \colorlet{backgroundcolor}{white}
  \colorlet{framecolor}{black}
  % block colors
  \colorlet{blocktitlebgcolor}{colorOne}
  \colorlet{blocktitlefgcolor}{black}
  \colorlet{blockbodybgcolor}{white}
  \colorlet{blockbodyfgcolor}{black}
  % innerblock colors
  \colorlet{innerblocktitlebgcolor}{colorOne!15!white}
  \colorlet{innerblocktitlefgcolor}{black}
  \colorlet{innerblockbodybgcolor}{colorOne!15!white}
  \colorlet{innerblockbodyfgcolor}{black}
  % note colors
  \colorlet{notefgcolor}{black}
  \colorlet{notebgcolor}{colorThree}
  \colorlet{noteframecolor}{colorTwo}
}

% title
\NewDocumentCommand{\dorayaki@set@title}{}{%
  \settitle{%
    \centering
    {\huge\textbf{\@title}\par}
    \putsubtitle
    \begin{flushright}
      \Large\@author\par
    \end{flushright}
  }
}

% layout
\usetheme{Simple}
\usecolorstyle[colorPalette=dorayakicolorpalette]{dorayakicolorstyle}
\usetitlestyle{Empty}
\usebackgroundstyle{Default}
\useblockstyle{Minimal}
\dorayaki@set@title

\TP@showlatexaffectionfalse

