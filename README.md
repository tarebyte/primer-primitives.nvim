# primer-primitives.nvim

🎨 A clean and refined Neovim colorscheme powered by [GitHub's Primer Primitives](https://primer.style/primitives) design system.

If you've ever wished your terminal felt a little more like home (a.k.a. GitHub), this is for you.

## ✨ Features

- 🌗 **4 beautiful variants** — Dark, Light, Dark Dimmed, and Dark High Contrast
- 🔌 **Zero runtime dependencies** — Generated standalone colorscheme files load instantly
- 🎯 **Accurate colors** — Extracted directly from `@primer/primitives`
- 🧩 **Extensive plugin support** — 35+ popular plugins styled out of the box
- 🖥️ **Terminal extras** — Matching themes for Ghostty, iTerm2, and tmux
- 📊 **Built-in lualine themes** — Coordinated statusline themes included

## 🎨 Variants

| Variant | Description |
|---------|-------------|
| `primer_dark` | The classic GitHub dark theme you know and love |
| `primer_light` | Clean and bright for the daylight coders |
| `primer_dark_dimmed` | Softer contrast for those late night sessions |
| `primer_dark_high_contrast` | Maximum readability when you need it |

## 📦 Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled (`:set termguicolors`)

## 🚀 Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "tarebyte/primer-primitives.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd("colorscheme primer_dark")
  end,
}
```

### [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use {
  "tarebyte/primer-primitives.nvim",
  config = function()
    vim.cmd("colorscheme primer_dark")
  end
}
```

### Manual

```bash
git clone https://github.com/tarebyte/primer-primitives.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/primer-primitives.nvim
```

## 💻 Usage

```lua
-- Pick your flavor
vim.cmd("colorscheme primer_dark")
vim.cmd("colorscheme primer_light")
vim.cmd("colorscheme primer_dark_dimmed")
vim.cmd("colorscheme primer_dark_high_contrast")
```

## 🔌 Supported Plugins

<details>
<summary>Click to expand full list</summary>

### Syntax & Highlighting
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — All standard captures
- [LSP Semantic Tokens](https://neovim.io/doc/user/lsp.html) — `@lsp.type.*` and `@lsp.mod.*`
- [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)

### Completion
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [blink.cmp](https://github.com/Saghen/blink.cmp)

### Fuzzy Finders
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [fzf-lua](https://github.com/ibhagwan/fzf-lua)

### File Explorers
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)

### Git
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)

### UI & Navigation
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Which-key](https://github.com/folke/which-key.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [Lualine](https://github.com/nvim-lualine/lualine.nvim)
- [noice.nvim](https://github.com/folke/noice.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [aerial.nvim](https://github.com/stevearc/aerial.nvim)
- [nvim-navic](https://github.com/SmiteshP/nvim-navic)
- [flash.nvim](https://github.com/folke/flash.nvim)

### Diagnostics & Utilities
- [Diagnostics](https://neovim.io/doc/user/diagnostic.html)
- [mason.nvim](https://github.com/williamboman/mason.nvim)
- [trouble.nvim](https://github.com/folke/trouble.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)
- [grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)
- [sidekick.nvim](https://github.com/sidebar-nvim/sidebar.nvim)

### mini.nvim
- [mini.files](https://github.com/echasnovski/mini.files)
- [mini.pick](https://github.com/echasnovski/mini.pick)
- [mini.hipatterns](https://github.com/echasnovski/mini.hipatterns)
- [mini.statusline](https://github.com/echasnovski/mini.statusline)
- [mini.notify](https://github.com/echasnovski/mini.notify)
- [mini.diff](https://github.com/echasnovski/mini.diff)
- [mini.indentscope](https://github.com/echasnovski/mini.indentscope)
- [mini.jump](https://github.com/echasnovski/mini.jump)
- [mini.clue](https://github.com/echasnovski/mini.clue)
- [mini.tabline](https://github.com/echasnovski/mini.tabline)
- [mini.starter](https://github.com/echasnovski/mini.starter)
- [mini.cursorword](https://github.com/echasnovski/mini.cursorword)

</details>

## 📊 Lualine

Built-in lualine themes are included for each variant:

```lua
require("lualine").setup({
  options = {
    theme = "primer_dark", -- or primer_light, primer_dark_dimmed, primer_dark_high_contrast
  },
})
```

Or just use `"auto"` and it'll pick the right one:

```lua
require("lualine").setup({
  options = { theme = "auto" },
})
```

## 🖥️ Extras

Matching themes for your terminal emulator.

### Ghostty

```bash
# Copy theme to your Ghostty themes directory
cp extras/ghostty/primer_dark ~/.config/ghostty/themes/
```

Then in your Ghostty config:

```
theme = primer_dark
```

### iTerm2

1. Open iTerm2 → Preferences (⌘,)
2. Go to **Profiles → Colors**
3. Click **Color Presets...** → **Import...**
4. Select `extras/iterm/primer_dark.itermcolors`
5. Choose **primer_dark** from the presets

### tmux

```bash
# Add to your tmux.conf
source-file /path/to/extras/tmux/primer_dark.tmux
```

## 🎨 Customization

Override any highlight group to make it your own:

```lua
vim.cmd("colorscheme primer_dark")

-- Override specific highlights
vim.api.nvim_set_hl(0, "Comment", { fg = "#8b949e", italic = true })
```

For persistent overrides that survive colorscheme reloads:

```lua
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "primer_*",
  callback = function()
    vim.api.nvim_set_hl(0, "Comment", { fg = "#8b949e", italic = true })
  end,
})
```

## 🛠️ Development

This theme uses a generator-based architecture:

1. **Palettes** — Color definitions extracted from `@primer/primitives`
2. **Highlights** — Mappings from highlight groups to palette colors
3. **Generator** — Produces standalone, dependency-free colorscheme files

### Updating from upstream

```bash
npm update @primer/primitives && npm run build
```

### Regenerating after changes

```bash
npm run generate
# or
nvim -l scripts/generate.lua
```

## 🙏 Credits

- [Primer Primitives](https://github.com/primer/primitives) — The design system that powers this theme
- [GitHub VS Code Theme](https://github.com/primer/github-vscode-theme) — The reference implementation
