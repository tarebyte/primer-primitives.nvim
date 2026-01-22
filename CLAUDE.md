# Claude Code Instructions for primer-primitives.nvim

## Project Overview

A Neovim colorscheme based on GitHub's Primer Primitives design system. The theme generates standalone colorscheme files that require **no runtime dependencies**.

## Architecture

```
primer-primitives.nvim/
├── colors/                              # Generated standalone colorscheme files
│   ├── primer_dark.lua
│   ├── primer_light.lua
│   ├── primer_dark_dimmed.lua
│   └── primer_dark_high_contrast.lua
├── lua/primer-primitives/
│   ├── palettes/                        # Color definitions for each variant
│   │   ├── dark.lua
│   │   ├── light.lua
│   │   ├── dark_dimmed.lua
│   │   └── dark_high_contrast.lua
│   ├── highlights.lua                   # Highlight group definitions
│   └── generator.lua                    # Generates colors/*.lua files
└── scripts/
    └── generate.lua                     # CLI entry point for generation
```

## Key Concepts

### Palettes (`lua/primer-primitives/palettes/*.lua`)

Each palette file exports a table with:
- `name` - Colorscheme name (e.g., `primer_dark`)
- `background` - `'dark'` or `'light'`
- `blend` - Transparency level for selection highlights (60-85)
- `fg` - Foreground colors (`default`, `muted`, `subtle`, `on_emphasis`)
- `canvas` - Background colors (`default`, `inset`, `subtle`, `overlay`)
- `border` - Border colors
- `accent`, `danger`, `success`, `attention`, `severe`, `done` - Semantic colors
- `syntax` - Syntax highlighting colors
- `ansi` - Terminal colors (16 ANSI colors)

### Highlights (`lua/primer-primitives/highlights.lua`)

Contains two functions:
- `M.build(palette)` - Returns a table of highlight groups
- `M.build_terminal(palette)` - Returns terminal color mappings

Highlight groups use the mini.colors format:
```lua
groups['Normal'] = { fg = p.fg.default, bg = p.canvas.default }
groups['@variable'] = { fg = p.fg.default }  -- Treesitter captures use brackets
groups['Comment'] = { fg = p.syntax.comment, italic = true }
groups['SpellBad'] = { sp = p.danger.fg, undercurl = true }
groups['Visual'] = { bg = p.accent.muted, blend = blend }
groups['lCursor'] = { link = 'Cursor' }  -- Links to other groups
```

### Generator (`lua/primer-primitives/generator.lua`)

Produces standalone Lua files that:
1. Set `vim.opt.background`
2. Set `vim.g.colors_name`
3. Clear existing highlights
4. Apply all highlight groups via `vim.api.nvim_set_hl()`
5. Set terminal colors via `vim.g.terminal_color_*`

## Common Tasks

### Regenerate colorscheme files

After modifying palettes or highlights:

```bash
nvim -l scripts/generate.lua
```

### Add a new highlight group

Edit `lua/primer-primitives/highlights.lua`:

```lua
-- For standard groups
groups.NewGroup = { fg = p.accent.fg, bold = true }

-- For treesitter/LSP captures (use brackets)
groups['@new.capture'] = { fg = p.syntax.entity }
```

Then regenerate.

### Add a new color to palettes

1. Add the color to ALL palette files in `lua/primer-primitives/palettes/`
2. Use the color in `highlights.lua`
3. Regenerate

### Test colorscheme loading

```bash
nvim --headless -u NONE --noplugin -c "set rtp+=." -c "colorscheme primer_dark" -c "qa"
```

### Verify a highlight group

```bash
nvim -c "colorscheme primer_dark" -c "highlight Normal"
```

## Color Sources

Colors come from GitHub's Primer Primitives:
- https://primer.style/primitives
- https://github.com/primer/primitives

Reference the VS Code theme for comparison:
- https://github.com/primer/github-vscode-theme

## Supported Plugins

The theme includes highlight groups for:
- Treesitter (all `@` captures)
- LSP semantic tokens (`@lsp.type.*`, `@lsp.mod.*`)
- Diagnostics
- GitSigns
- Telescope
- nvim-cmp
- nvim-tree
- Neo-tree
- Lazy.nvim
- Which-key
- Indent Blankline

## GUI Attributes Reference

Available attributes for highlight groups:
- `fg` - Foreground color (hex string)
- `bg` - Background color (hex string)
- `sp` - Special color for underlines (hex string)
- `bold` - Boolean
- `italic` - Boolean
- `underline` - Boolean
- `undercurl` - Boolean (wavy underline)
- `strikethrough` - Boolean
- `blend` - Integer 0-100 for transparency
- `link` - String name of group to link to
