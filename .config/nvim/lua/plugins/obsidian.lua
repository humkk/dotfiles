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
        { name = "RPG", path = "~/Documents/Obsidian-Vaults/RPG" },
      },
      notes_subdir = "Conteudo/Notas",
      note_id_func = function(title)
        return title:gsub(" ", "-"):lower()
      end,
      completion = { nvim_cmp = false, min_chars = 2 },
      ui = { enable = false },
      disable_frontmatter = true,
      new_notes_location = "notes_subdir",
      mappings = {},
    },
    config = function(_, opts)
      require("obsidian").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()

          -- ─── CONFIGURAÇÃO ────────────────────────────────────────────
          -- Mapeamento de tecla → nome do template
          -- Para adicionar um novo: coloque a tecla e o nome do arquivo em Templates/
          -- Exemplo: p = "personagem"  →  cria Templates/personagem.md
          local template_map = {
            c = "campanha",
            n = "npc",
            v = "vazia",
          }
          -- ─────────────────────────────────────────────────────────────

          vim.keymap.set("n", "<CR>", function()

           -- Detecta o vault baseado no arquivo atual
            local current_file = vim.fn.resolve(vim.fn.expand("%:p"))
            local vault

            if current_file:find("/Obsidian%-Vaults/Notes") then
              vault = vim.fn.expand("~/Documents/Obsidian-Vaults/Notes")
            elseif current_file:find("/Obsidian%-Vaults/RPG") then
              vault = vim.fn.expand("~/Documents/Obsidian-Vaults/RPG")
            else
              -- Fallback: mostra aviso em vez de assumir RPG
              vim.api.nvim_echo({ { "Vault não detectado para: " .. current_file, "WarningMsg" } }, false, {})
              return
            end

            local line = vim.api.nvim_get_current_line()
            local link = line:match("%[%[(.-)%]%]")

            -- Se não há [[link]] na linha, Enter se comporta normalmente
            if not link then
              vim.cmd("normal! \r")
              return
            end

            -- Remove alias do link (ex: [[Vorago|O Grande]] → "Vorago")
            link = link:match("([^|]+)")
            link = vim.trim(link)

            -- Busca o arquivo recursivamente dentro do vault
            local matches = vim.fn.glob(vault .. "/**/" .. link .. ".md", false, true)

            -- Arquivo já existe → abre direto
            if #matches > 0 then
              vim.cmd("edit " .. vim.fn.fnameescape(matches[1]))
              return
            end

            -- Arquivo não existe → monta o prompt com as opções disponíveis
            local options = {}
            for key, name in pairs(template_map) do
              table.insert(options, "(" .. key:upper() .. ")" .. name)
            end
            local prompt = "Criar '" .. link .. "' como: " .. table.concat(options, "  ") .. "  [ESC cancela]"

            vim.api.nvim_echo({ { prompt, "Question" } }, false, {})

            local ok, char = pcall(vim.fn.getchar)
            if not ok then return end

            local key = string.char(char):lower()

            -- Enter → cria nota vazia
            if char == 13 then
              local content = { "# " .. link, "" }
              local new_path = vault .. "/Conteudo/Notas/" .. link .. ".md"
              vim.fn.mkdir(vim.fn.fnamemodify(new_path, ":h"), "p")
              vim.fn.writefile(content, new_path)
              vim.cmd("edit " .. vim.fn.fnameescape(new_path))
              return
            end

            -- ESC → cancela
            if char == 27 then
              vim.api.nvim_echo({ { " Cancelado.", "WarningMsg" } }, false, {})
              vim.cmd("redraw")
              return
            end

            local template_name = template_map[key]

            -- Tecla inválida → cancela
            if not template_name then
              vim.api.nvim_echo({ { " Cancelado.", "WarningMsg" } }, false, {})
              vim.cmd("redraw")
              return
            end

            -- Lê o template em Conteudo/Templates/<nome>.md
            -- Se não existir, usa fallback com só o título
            local template_path = vault .. "/Conteudo/Templates/" .. template_name .. ".md"
            local content

            if vim.fn.filereadable(template_path) == 1 then
              content = vim.fn.readfile(template_path)
              -- Substitui {{title}} pelo nome do link em todo o template
              for i, l in ipairs(content) do
                content[i] = l:gsub("{{title}}", link)
              end
            else
              content = { "# " .. link, "" }
            end

            -- Cria o arquivo em Conteudo/Notas/ e abre no editor
            local new_path = vault .. "/Conteudo/Notas/" .. link .. ".md"
            vim.fn.mkdir(vim.fn.fnamemodify(new_path, ":h"), "p")
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
      heading = { enabled = true },
      checkbox = { enabled = true },
      code = { enabled = true },
    },
  },
}