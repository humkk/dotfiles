hi Normal guibg=NONE guifg={{ colors.on_background.dark.hex }}
hi NormalFloat guibg=NONE
hi NormalNC guibg=NONE

" Comentários — discreto, surface variant
hi Comment guibg=NONE guifg={{ colors.on_surface_variant.dark.hex }}

" Pontuação — outline, sutil
hi Delimiter guibg=NONE guifg={{ colors.outline.dark.hex }}
hi Operator guibg=NONE guifg={{ colors.outline.dark.hex }}

" TODO/FIXME — destaque com tertiary
hi Todo guibg={{ colors.tertiary_container.dark.hex }} guifg={{ colors.on_tertiary_container.dark.hex }}

" Variáveis — cor base do texto
hi Identifier guibg=NONE guifg={{ colors.on_surface.dark.hex }}

" Números, booleanos — secondary
hi Constant guibg=NONE guifg={{ colors.secondary.dark.hex }}

" Tipos, classes — tertiary
hi Type guibg=NONE guifg={{ colors.tertiary.dark.hex }}

" Strings — primary container (suave)
hi String guibg=NONE guifg={{ colors.on_primary_container.dark.hex }}

" Caracteres especiais, regex — tertiary container
hi Special guibg=NONE guifg={{ colors.on_tertiary_container.dark.hex }}

" Imports, diretivas — secondary container
hi PreProc guibg=NONE guifg={{ colors.on_secondary_container.dark.hex }}

" Funções — primary, destaque principal
hi Function guibg=NONE guifg={{ colors.primary.dark.hex }}

" Keywords (if, for, return) — tertiary, destaque forte
hi Statement guibg=NONE guifg={{ colors.tertiary.dark.hex }}

" Erros
hi Error guibg={{ colors.error_container.dark.hex }} guifg={{ colors.on_error_container.dark.hex }}

" Status bar

hi StatusLine guibg={{ colors.primary.dark.hex }} guifg={{ colors.on_primary.dark.hex }}
hi StatusLineNC guibg={{ colors.primary_container.dark.hex }} guifg={{ colors.on_primary_container.dark.hex }}

" Seleção de texto
hi Visual guibg={{ colors.secondary_container.dark.hex }} guifg={{ colors.on_secondary_container.dark.hex }}
hi Selection guibg={{ colors.secondary_container.dark.hex }}

" _____________ Markdown abaixo ____________________________

" Headings markdown
hi RenderMarkdownH1 guibg=NONE guifg={{ colors.on_primary.dark.hex }}
hi RenderMarkdownH2 guibg=NONE guifg={{ colors.secondary.dark.hex }}
hi RenderMarkdownH3 guibg=NONE guifg={{ colors.tertiary.dark.hex }}
hi RenderMarkdownH4 guibg=NONE guifg={{ colors.on_primary_container.dark.hex }}
hi RenderMarkdownH5 guibg=NONE guifg={{ colors.on_secondary_container.dark.hex }}
hi RenderMarkdownH6 guibg=NONE guifg={{ colors.on_tertiary_container.dark.hex }}

" Fundo dos headings (a barrinha colorida)
hi RenderMarkdownH1Bg guibg={{ colors.primary.dark.hex }} guifg={{ colors.on_primary.dark.hex }}
hi RenderMarkdownH2Bg guibg={{ colors.secondary.dark.hex }} guifg={{ colors.on_secondary.dark.hex }}
hi RenderMarkdownH3Bg guibg={{ colors.tertiary.dark.hex }} guifg={{ colors.on_tertiary.dark.hex }}

" Cor dos numeros (1. 2. 3. etc)
hi @markup.list.markdown guibg=NONE guifg={{ colors.primary.dark.hex }}