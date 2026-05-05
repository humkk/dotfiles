hi Normal guibg=NONE guifg=#e3e1e9
hi NormalFloat guibg=NONE
hi NormalNC guibg=NONE

" Comentários — discreto, surface variant
hi Comment guibg=NONE guifg=#c6c5d0

" Pontuação — outline, sutil
hi Delimiter guibg=NONE guifg=#90909a
hi Operator guibg=NONE guifg=#90909a

" TODO/FIXME — destaque com tertiary
hi Todo guibg=#5b3d57 guifg=#ffd7f5

" Variáveis — cor base do texto
hi Identifier guibg=NONE guifg=#e3e1e9

" Números, booleanos — secondary
hi Constant guibg=NONE guifg=#c2c5dd

" Tipos, classes — tertiary
hi Type guibg=NONE guifg=#e3bada

" Strings — primary container (suave)
hi String guibg=NONE guifg=#dce1ff

" Caracteres especiais, regex — tertiary container
hi Special guibg=NONE guifg=#ffd7f5

" Imports, diretivas — secondary container
hi PreProc guibg=NONE guifg=#dee1f9

" Funções — primary, destaque principal
hi Function guibg=NONE guifg=#b6c4ff

" Keywords (if, for, return) — tertiary, destaque forte
hi Statement guibg=NONE guifg=#e3bada

" Erros
hi Error guibg=#93000a guifg=#ffdad6

" Status bar

hi StatusLine guibg=#b6c4ff guifg=#1d2d61
hi StatusLineNC guibg=#354479 guifg=#dce1ff

" Seleção de texto
hi Visual guibg=#424659 guifg=#dee1f9
hi Selection guibg=#424659

" _____________ Markdown abaixo ____________________________

" Headings markdown
hi RenderMarkdownH1 guibg=NONE guifg=#1d2d61
hi RenderMarkdownH2 guibg=NONE guifg=#c2c5dd
hi RenderMarkdownH3 guibg=NONE guifg=#e3bada
hi RenderMarkdownH4 guibg=NONE guifg=#dce1ff
hi RenderMarkdownH5 guibg=NONE guifg=#dee1f9
hi RenderMarkdownH6 guibg=NONE guifg=#ffd7f5

" Fundo dos headings (a barrinha colorida)
hi RenderMarkdownH1Bg guibg=#b6c4ff guifg=#1d2d61
hi RenderMarkdownH2Bg guibg=#c2c5dd guifg=#2b3042
hi RenderMarkdownH3Bg guibg=#e3bada guifg=#43273f

" Cor dos numeros (1. 2. 3. etc)
hi @markup.list.markdown guibg=NONE guifg=#b6c4ff