return {
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      workspaces = {
        { name = "notes", path = "~/Documents/Obsidian-Vaults/Notes" },
        { name = "RPG",   path = "~/Documents/Obsidian-Vaults/RPG"   },
      },
      -- notes_subdir REMOVIDO → evita criação automática de Conteudo/
      note_id_func        = function(title) return title:gsub(" ", "-"):lower() end,
      completion          = { nvim_cmp = false, min_chars = 2 },
      ui                  = { enable = false },
      disable_frontmatter = true,
      new_notes_location  = "current_dir",
      mappings            = {},
    },

    config = function(_, opts)
      require("obsidian").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()

          vim.keymap.set("n", "<CR>", function()

            -- ── 1. Detecta o vault ──────────────────────────────────────
            local current_file = vim.fn.resolve(vim.fn.expand("%:p"))
            local vault

            if current_file:find("/Obsidian%-Vaults/Notes/") then
              vault = vim.fn.expand("~/Documents/Obsidian-Vaults/Notes")
            elseif current_file:find("/Obsidian%-Vaults/RPG/") then
              vault = vim.fn.expand("~/Documents/Obsidian-Vaults/RPG")
            -- Caso especial: o próprio RPG.md (não tem trailing slash)
            elseif current_file:find("/Obsidian%-Vaults/RPG") then
              vault = vim.fn.expand("~/Documents/Obsidian-Vaults/RPG")
            else
              vim.api.nvim_echo({ { "Vault não detectado: " .. current_file, "WarningMsg" } }, false, {})
              return
            end

            -- ── 2. Pega o [[link]] da linha atual ──────────────────────
            local line = vim.api.nvim_get_current_line()
            local link = line:match("%[%[(.-)%]%]")

            if not link then
              vim.cmd("normal! \r")
              return
            end

            link = vim.trim(link:match("([^|]+)"))

            -- ── 3. Estamos no RPG.md? ───────────────────────────────────
            local is_rpg_index = current_file:match("[/\\]RPG%.md$") ~= nil

            if is_rpg_index then

              -- Sobe linha a linha a partir do cursor buscando o heading da seção
              local section     = nil
              local cursor_row  = vim.api.nvim_win_get_cursor(0)[1]

              for row = cursor_row, 1, -1 do
                local l = vim.api.nvim_buf_get_lines(0, row - 1, row, false)[1] or ""
                if l:match("^#+%s*Minhas Campanhas") then
                  section = "Minhas-Campanhas"
                  break
                elseif l:match("^#+%s*Campanhas de Amigos") then
                  section = "Campanhas-de-Amigos"
                  break
                end
              end

              if not section then
                vim.api.nvim_echo({ { "Cursor não está em nenhuma seção reconhecida.", "WarningMsg" } }, false, {})
                return
              end

              local campaign_root = vault .. "/" .. section .. "/" .. link
              local index_path    = campaign_root .. "/" .. link .. ".md"

              -- Cenário B: campanha já existe → abre
              if vim.fn.filereadable(index_path) == 1 then
                vim.cmd("edit " .. vim.fn.fnameescape(index_path))
                return
              end

              -- Cenário A: campanha nova → cria estrutura e abre
              vim.fn.mkdir(campaign_root .. "/Notas",     "p")
              vim.fn.mkdir(campaign_root .. "/Midia",     "p")
              vim.fn.mkdir(campaign_root .. "/Templates", "p")

              vim.fn.writefile({ "# " .. link, "", "## Personagens", "", "## Sessões", "" }, index_path)
              vim.cmd("edit " .. vim.fn.fnameescape(index_path))
              vim.api.nvim_echo({ { "Campanha '" .. link .. "' criada.", "None" } }, false, {})
              return
            end

            -- ── 3.5. Dentro do vault Notes ─────────────────────────────
            local is_notes_vault = current_file:find("/Obsidian%-Vaults/Notes/") ~= nil

            if is_notes_vault then
              local notes_vault = vim.fn.expand("~/Documents/Obsidian-Vaults/Notes")

              local matches = vim.fn.glob(notes_vault .. "/**/" .. link .. ".md", false, true)
              if #matches > 0 then
                vim.cmd("edit " .. vim.fn.fnameescape(matches[1]))
                return
              end

              local new_path = notes_vault .. "/Conteudo/Notas/" .. link .. ".md"
              vim.fn.mkdir(notes_vault .. "/Conteudo/Notas", "p")
              vim.fn.writefile({ "# " .. link, "" }, new_path)
              vim.cmd("edit " .. vim.fn.fnameescape(new_path))
              vim.api.nvim_echo({ { "Nota '" .. link .. "' criada.", "None" } }, false, {})
              return
            end

            -- ── 4. Dentro de uma campanha ───────────────────────────────
            -- Extrai o diretório raiz da campanha pelo caminho do arquivo atual
            local campaign_dir =
              current_file:match("(.*Minhas%-Campanhas/[^/]+)") or
              current_file:match("(.*Campanhas%-de%-Amigos/[^/]+)")

            if not campaign_dir then
              -- Fora de campanha conhecida: comportamento padrão
              vim.cmd("normal! \r")
              return
            end

            local notes_dir     = campaign_dir .. "/Notas"
            local templates_dir = campaign_dir .. "/Templates"

            -- Cenário D: arquivo já existe em algum lugar da campanha → abre
            local matches = vim.fn.glob(campaign_dir .. "/**/" .. link .. ".md", false, true)
            if #matches > 0 then
              vim.cmd("edit " .. vim.fn.fnameescape(matches[1]))
              return
            end

            -- Cenário C: não existe → lista templates disponíveis
            local all_templates = {}
            if vim.fn.isdirectory(templates_dir) == 1 then
              for _, f in ipairs(vim.fn.glob(templates_dir .. "/*.md", false, true)) do
                table.insert(all_templates, {
                  name = vim.fn.fnamemodify(f, ":t:r"),
                  path = f,
                })
              end
            end

            -- Monta prompt dinamicamente pelas iniciais dos templates
            local key_map     = {}
            local options_str = {}

            for _, tpl in ipairs(all_templates) do
              local key     = tpl.name:sub(1, 1):lower()
              local attempt = 0
              while key_map[key] and attempt < 25 do
                attempt = attempt + 1
                key     = string.char(string.byte("a") + attempt)
              end
              if not key_map[key] then
                key_map[key] = tpl
                table.insert(options_str, "(" .. key:upper() .. ")" .. tpl.name)
              end
            end

            local prompt
            if #options_str > 0 then
              prompt = "Criar '" .. link .. "' como: " .. table.concat(options_str, "  ") .. "  [ENTER=vazio  ESC=cancela]"
            else
              prompt = "Criar '" .. link .. "'  [ENTER=vazio  ESC=cancela]"
            end

            vim.api.nvim_echo({ { prompt, "Question" } }, false, {})

            local ok, char = pcall(vim.fn.getchar)
            if not ok then return end

            -- ENTER → nota vazia
            if char == 13 then
              local new_path = notes_dir .. "/" .. link .. ".md"
              vim.fn.mkdir(notes_dir, "p")
              vim.fn.writefile({ "# " .. link, "" }, new_path)
              vim.cmd("edit " .. vim.fn.fnameescape(new_path))
              return
            end

            -- ESC → cancela
            if char == 27 then
              vim.api.nvim_echo({ { " Cancelado.", "WarningMsg" } }, false, {})
              vim.cmd("redraw")
              return
            end

            local chosen = key_map[string.char(char):lower()]

            if not chosen then
              vim.api.nvim_echo({ { " Tecla inválida. Cancelado.", "WarningMsg" } }, false, {})
              vim.cmd("redraw")
              return
            end

            -- Aplica template
            local content = vim.fn.readfile(chosen.path)
            for i, l in ipairs(content) do
              content[i] = l:gsub("{{title}}", link)
            end

            local new_path = notes_dir .. "/" .. link .. ".md"
            vim.fn.mkdir(notes_dir, "p")
            vim.fn.writefile(content, new_path)
            vim.cmd("edit " .. vim.fn.fnameescape(new_path))

          end, { buffer = true, desc = "Obsidian Follow/Create Link" })
        end,
      })
    end,
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = "markdown",
    opts = {
      heading  = { enabled = true },
      checkbox = { enabled = true },
      code     = { enabled = true },
      
      link = {
        enabled = true,
        image = '󰋩 ', -- Ícone para imagens
        email = '󰇰 ', -- Ícone para e-mail
        hyperlink = '󰌹 ', -- Ícone para links web
        wiki = { icon = '󰈚 ' }, -- Esse muda o [[link]] do Obsidian!
        custom = {
          -- Você pode criar ícones específicos para pastas se quiser
          -- { pattern = '^Notas/', icon = '󰠮 ' },
        },
      },
    },
  }
}