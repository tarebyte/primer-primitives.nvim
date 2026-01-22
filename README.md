# primer-primitives.nvim

A Neovim colorscheme based on [GitHub's Primer Primitives](https://primer.style/primitives).

This theme aims to match the [GitHub VS Code theme](https://github.com/primer/github-vscode-theme) as closely as possible.

## Variants

- `primer_dark` - Dark Default
- `primer_light` - Light Default
- `primer_dark_dimmed` - Dark Dimmed
- `primer_dark_high_contrast` - Dark High Contrast

## Requirements

- Neovim >= 0.8.0
- `termguicolors` enabled

## Installation

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

Clone the repository to your Neovim packages directory:

```bash
git clone https://github.com/tarebyte/primer-primitives.nvim \
  ~/.local/share/nvim/site/pack/plugins/start/primer-primitives.nvim
```

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

## Project Structure

```
primer-primitives.nvim/
├── colors/                              # Standalone colorscheme files (generated)
│   ├── primer_dark.lua
│   ├── primer_dark_dimmed.lua
│   ├── primer_dark_high_contrast.lua
│   └── primer_light.lua
├── lua/primer-primitives/
│   ├── palettes/                        # Color palettes for each variant
│   │   ├── dark.lua
│   │   ├── dark_dimmed.lua
│   │   ├── dark_high_contrast.lua
│   │   └── light.lua
│   ├── highlights.lua                   # Shared highlight definitions
│   └── generator.lua                    # Theme generator
└── scripts/
    └── generate.lua                     # CLI to regenerate themes
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

You can override highlight groups in your configuration:

```lua
-- After setting the colorscheme, override specific highlights
vim.cmd("colorscheme primer_dark")

-- Override highlights
vim.api.nvim_set_hl(0, 'Comment', { fg = '#888888', italic = true })
vim.api.nvim_set_hl(0, 'MyCustomGroup', { fg = '#ff0000' })
```

Or using an autocmd to ensure overrides persist:

```lua
vim.api.nvim_create_autocmd('ColorScheme', {
  pattern = 'primer_*',
  callback = function()
    vim.api.nvim_set_hl(0, 'Comment', { fg = '#888888', italic = true })
  end,
})
```

## Lualine Integration

You can create a matching lualine theme by extracting colors:

```lua
-- Example lualine theme using primer colors
local colors = {
  bg = '#0d1117',
  fg = '#f0f6fc',
  accent = '#4493f8',
  muted = '#9198a1',
}

require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = colors.bg, bg = colors.accent, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.muted, bg = colors.bg },
      },
      insert = {
        a = { fg = colors.bg, bg = '#3fb950', gui = 'bold' },
      },
      visual = {
        a = { fg = colors.bg, bg = '#a371f7', gui = 'bold' },
      },
      command = {
        a = { fg = colors.bg, bg = '#d29922', gui = 'bold' },
      },
    },
  },
})
```

## Development

### Regenerating Themes

If you modify the palettes or highlight definitions, regenerate the colorscheme files:

```bash
nvim -l scripts/generate.lua
```

### Project Architecture

The colorscheme uses a generator-based approach:

1. **Palettes** (`lua/primer-primitives/palettes/`) define the colors for each variant
2. **Highlights** (`lua/primer-primitives/highlights.lua`) define how highlight groups map to palette colors
3. **Generator** (`lua/primer-primitives/generator.lua`) produces standalone colorscheme files
4. **Colors** (`colors/`) contain the generated, dependency-free colorscheme files

This approach means:
- **Zero runtime dependencies** - the generated files work standalone
- **Easy to customize** - modify palettes or highlights and regenerate
- **Fast loading** - no processing at runtime

## Credits

- [GitHub VS Code Theme](https://github.com/primer/github-vscode-theme)
- [Primer Primitives](https://github.com/primer/primitives)

## License

MIT
