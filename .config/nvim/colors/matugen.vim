hi Normal guibg=NONE guifg=#e7e2d5
hi NormalFloat guibg=NONE
hi NormalNC guibg=NONE

" Comentários — discreto, surface variant
hi Comment guibg=NONE guifg=#cbc7b5

" Pontuação — outline, sutil
hi Delimiter guibg=NONE guifg=#949181
hi Operator guibg=NONE guifg=#949181

" TODO/FIXME — destaque com tertiary
hi Todo guibg=#274e3d guifg=#c1ecd5

" Variáveis — cor base do texto
hi Identifier guibg=NONE guifg=#e7e2d5

" Números, booleanos — secondary
hi Constant guibg=NONE guifg=#ccc8a3

" Tipos, classes — tertiary
hi Type guibg=NONE guifg=#a5d0ba

" Strings — primary container (suave)
hi String guibg=NONE guifg=#ede68c

" Caracteres especiais, regex — tertiary container
hi Special guibg=NONE guifg=#c1ecd5

" Imports, diretivas — secondary container
hi PreProc guibg=NONE guifg=#e9e4be

" Funções — primary, destaque principal
hi Function guibg=NONE guifg=#d1c973

" Keywords (if, for, return) — tertiary, destaque forte
hi Statement guibg=NONE guifg=#a5d0ba

" Erros
hi Error guibg=#93000a guifg=#ffdad6

" Status bar

hi StatusLine guibg=#d1c973 guifg=#353100
hi StatusLineNC guibg=#4d4800 guifg=#ede68c

" Seleção de texto
hi Visual guibg=#4a482c guifg=#e9e4be
hi Selection guibg=#4a482c

" _____________ Markdown abaixo ____________________________

" Headings markdown
hi RenderMarkdownH1 guibg=NONE guifg=#353100
hi RenderMarkdownH2 guibg=NONE guifg=#ccc8a3
hi RenderMarkdownH3 guibg=NONE guifg=#a5d0ba
hi RenderMarkdownH4 guibg=NONE guifg=#ede68c
hi RenderMarkdownH5 guibg=NONE guifg=#e9e4be
hi RenderMarkdownH6 guibg=NONE guifg=#c1ecd5

" Fundo dos headings (a barrinha colorida)
hi RenderMarkdownH1Bg guibg=#d1c973 guifg=#353100
hi RenderMarkdownH2Bg guibg=#ccc8a3 guifg=#333117
hi RenderMarkdownH3Bg guibg=#a5d0ba guifg=#0e3727

" Cor dos numeros (1. 2. 3. etc)
hi @markup.list.markdown guibg=NONE guifg=#d1c973