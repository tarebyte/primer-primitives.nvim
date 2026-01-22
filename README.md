# primer-primitives.nvim

A Neovim colorscheme based on [GitHub's Primer Primitives](https://primer.style/primitives), built with [lush.nvim](https://github.com/rktjmp/lush.nvim).

This theme aims to match the [GitHub VS Code theme](https://github.com/primer/github-vscode-theme) as closely as possible.

## Variants

- `primer_dark` - Dark Default
- `primer_light` - Light Default
- `primer_dark_dimmed` - Dark Dimmed
- `primer_dark_high_contrast` - Dark High Contrast

## Requirements

- Neovim >= 0.8.0
- [lush.nvim](https://github.com/rktjmp/lush.nvim)
- `termguicolors` enabled

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "tarebyte/primer-primitives.nvim",
  dependencies = { "rktjmp/lush.nvim" },
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
  requires = { "rktjmp/lush.nvim" },
  config = function()
    vim.cmd("colorscheme primer_dark")
  end
}
```

### Manual

Clone the repository to your Neovim packages directory:

```bash
git clone https://github.com/tarebyte/primer-primitives.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/primer-primitives.nvim
```

Don't forget to also install [lush.nvim](https://github.com/rktjmp/lush.nvim).

## Usage

```vim
" Set the colorscheme
:colorscheme primer_dark
:colorscheme primer_light
:colorscheme primer_dark_dimmed
:colorscheme primer_dark_high_contrast
```

Or in Lua:

```lua
vim.cmd("colorscheme primer_dark")
```

## Development

This theme is built with [lush.nvim](https://github.com/rktjmp/lush.nvim), which provides real-time theme editing.

To edit the theme:

1. Open a lush theme file (e.g., `lua/lush_theme/primer_dark.lua`)
2. Run `:Lushify` to enable live editing
3. Changes will be applied in real-time as you edit

## Project Structure

```
primer-primitives.nvim/
├── colors/                              # Colorscheme loaders
│   ├── primer_dark.lua
│   ├── primer_dark_dimmed.lua
│   ├── primer_dark_high_contrast.lua
│   └── primer_light.lua
└── lua/lush_theme/                      # Lush theme definitions
    ├── primer_dark.lua
    ├── primer_dark_dimmed.lua
    ├── primer_dark_high_contrast.lua
    └── primer_light.lua
```

## Supported Plugins

- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [LSP Semantic Tokens](https://neovim.io/doc/user/lsp.html)
- [Diagnostics](https://neovim.io/doc/user/diagnostic.html)
- [GitSigns](https://github.com/lewis6991/gitsigns.nvim)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Which-key](https://github.com/folke/which-key.nvim)
- [Indent Blankline](https://github.com/lukas-reineke/indent-blankline.nvim)

## Extending the Theme

Since this is a lush theme, you can extend it in your own configuration:

```lua
local lush = require("lush")
local primer_dark = require("lush_theme.primer_dark")

-- Extend the theme
local my_theme = lush.extends({ primer_dark }).with(function()
  return {
    -- Override or add highlight groups
    Comment { fg = "#888888", gui = "italic" },
    -- Add your own groups
    MyCustomGroup { fg = "#ff0000" },
  }
end)

-- Apply
lush(my_theme)
```

## Lualine Integration

You can create a matching lualine theme by extracting colors from the theme:

```lua
-- Get the theme's parsed highlight groups
local primer_dark = require("lush_theme.primer_dark")

-- Extract colors from highlight groups
local colors = {
  bg = primer_dark.Normal.bg.hex,
  fg = primer_dark.Normal.fg.hex,
  accent = primer_dark.Title.fg.hex,
  -- ... etc
}

-- Use in your lualine config
require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.accent, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
      },
      -- ... other modes
    },
  },
})
```

## Credits

- [GitHub VS Code Theme](https://github.com/primer/github-vscode-theme)
- [Primer Primitives](https://github.com/primer/primitives)
- [lush.nvim](https://github.com/rktjmp/lush.nvim)
- [lush-template](https://github.com/rktjmp/lush-template)

## License

MIT
