\NeedsTeXFormat{LaTeX2e}[2025-06-01]
\ProvidesClass{dorayaki-article}[2026-06-26]

\DeclareKeys[dorayaki-article]{
  margin.usage     = load,
  margin.store     = \dorayaki@article@margin,
  fontsize.usage   = load,
  fontsize.store   = \dorayaki@article@fontsize,
  linespread.usage = load,
  linespread.store = \dorayaki@article@linespread,
}

\SetKeys{
  margin = 2.5cm,
  fontsize = 11pt,
  linespread = 1.3,
}

\DeclareUnknownKeyHandler{%
  \PassOptionsToClass{\CurrentOption}{scrartcl}
}

\ProcessKeyOptions

\LoadClass{scrartcl}

\RequirePackage{mathtools}
\RequirePackage[default,varnothing]{fontsetup}
\RequirePackage[serif]{dorayaki-font}
\RequirePackage{dorayaki-math}
\RequirePackage[language=english]{dorayaki-thm}
\RequirePackage{microtype}
\RequirePackage[margin=\dorayaki@article@margin]{geometry}

% fontsize rates
\NewDocumentCommand{\dorayaki@article@tinyrate}{}{0.5}
\NewDocumentCommand{\dorayaki@article@scriptsizerate}{}{0.7}
\NewDocumentCommand{\dorayaki@article@footnotesizerate}{}{0.8}
\NewDocumentCommand{\dorayaki@article@smallrate}{}{0.9}
\NewDocumentCommand{\dorayaki@article@largerate}{}{1.2}
\NewDocumentCommand{\dorayaki@article@Largerate}{}{1.44}
\NewDocumentCommand{\dorayaki@article@LARGErate}{}{1.728}
\NewDocumentCommand{\dorayaki@article@hugerate}{}{2.074}
\NewDocumentCommand{\dorayaki@article@Hugerate}{}{2.488}
% fontsize
\RenewDocumentCommand{\tiny}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@tinyrate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@tinyrate * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\scriptsize}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@scriptsizerate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@scriptsizerate * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\footnotesize}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@footnotesizerate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@footnotesizerate * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\small}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@smallrate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@smallrate * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\normalsize}{}{\fontsize{\fpeval{\dorayaki@article@fontsize}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\large}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@largerate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@largerate * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\Large}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@Largerate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@Largerate * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\LARGE}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@LARGErate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@LARGErate * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\huge}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@hugerate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@hugerate * \dorayaki@article@linespread}}\selectfont}
\RenewDocumentCommand{\Huge}{}{\fontsize{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@Hugerate}}{\fpeval{\dorayaki@article@fontsize * \dorayaki@article@Hugerate * \dorayaki@article@linespread}}\selectfont}

