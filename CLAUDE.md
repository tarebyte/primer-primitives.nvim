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
├── lua/
│   ├── primer-primitives/
│   │   ├── palettes/                    # Auto-generated color definitions
│   │   │   ├── dark.lua
│   │   │   ├── light.lua
│   │   │   ├── dark_dimmed.lua
│   │   │   └── dark_high_contrast.lua
│   │   ├── highlights.lua               # Highlight group definitions
│   │   └── generator.lua                # Generates colors/*.lua files
│   └── lualine/themes/                  # Built-in lualine themes
│       ├── primer_dark.lua
│       ├── primer_light.lua
│       ├── primer_dark_dimmed.lua
│       └── primer_dark_high_contrast.lua
├── scripts/
│   ├── extract-primitives.mjs           # Extracts colors from @primer/primitives
│   ├── extract-primitives.test.mjs      # Tests for extraction script
│   ├── generate.lua                     # CLI entry point for Lua generation
│   └── templates/
│       └── palette.lua.ejs              # Template for palette generation
├── package.json                         # npm scripts and dependencies
└── node_modules/@primer/primitives/     # Source of truth for colors
```

## Build Workflow

The colorscheme is generated in two steps:

1. **Extract** - Node.js script reads from `@primer/primitives` npm package and generates Lua palette files
2. **Generate** - Neovim Lua script combines palettes with highlight definitions to create standalone colorscheme files

### Full build (extract + generate)

```bash
npm run build
```

### Extract palettes from @primer/primitives

```bash
npm run extract
```

This reads the JSON token files from `node_modules/@primer/primitives/dist/docs/functional/themes/` and generates the Lua palette files in `lua/primer-primitives/palettes/`.

### Generate colorscheme files

```bash
npm run generate
# or
nvim -l scripts/generate.lua
```

### Update to latest @primer/primitives

```bash
npm update @primer/primitives && npm run build
```

## Key Concepts

### Palettes (`lua/primer-primitives/palettes/*.lua`)

Each palette file exports a table with:
- `name` - Colorscheme name (e.g., `primer_dark`)
- `background` - `'dark'` or `'light'`
- `blend` - Transparency level for selection highlights (60-85)
- `fg` - Foreground colors (`default`, `muted`, `subtle`, `on_emphasis`)
- `canvas` - Background colors (`default`, `inset`, `subtle`, `overlay`)
- `border` - Border colors (`default`, `muted`)
- `accent`, `danger`, `success`, `attention`, `severe`, `done` - Semantic colors (`fg`, `emphasis`, `muted`)
- `syntax` - Syntax highlighting colors (`comment`, `constant`, `entity`, `keyword`, `string`, `variable`, `func`, `tag`)
- `ansi` - Terminal colors (16 ANSI colors)
- `scale` - Base scale colors (`black`, `white`)

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

After modifying highlights:

```bash
npm run generate
# or
nvim -l scripts/generate.lua
```

### Update colors from upstream

```bash
npm update @primer/primitives && npm run build
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

1. Edit `scripts/extract-primitives.mjs` to add the new token mapping
2. Run `npm run build` to regenerate everything

### Test colorscheme loading

```bash
nvim --headless -u NONE --noplugin -c "set rtp+=." -c "colorscheme primer_dark" -c "qa"
```

### Verify a highlight group

```bash
nvim -c "colorscheme primer_dark" -c "highlight Normal"
```

## Color Sources

Colors are sourced directly from the `@primer/primitives` npm package:
- Package: https://www.npmjs.com/package/@primer/primitives
- Repository: https://github.com/primer/primitives
- Design system: https://primer.style/primitives

Reference the VS Code theme for comparison:
- https://github.com/primer/github-vscode-theme

### Token Mappings

The extraction script maps primer/primitives tokens to our palette structure:

| Our Token | Primer Primitives Token |
|-----------|-------------------------|
| `fg.default` | `fgColor-default` |
| `fg.muted` | `fgColor-muted` |
| `canvas.default` | `bgColor-default` |
| `canvas.inset` | `bgColor-inset` |
| `accent.fg` | `fgColor-accent` |
| `accent.emphasis` | `bgColor-accent-emphasis` |
| `accent.muted` | `bgColor-accent-muted` (blended) |
| `syntax.comment` | `codeMirror-syntax-fgColor-comment` |
| `ansi.*` | `color-ansi-*` |

Alpha colors (8-digit hex) are blended with the background to produce opaque 6-digit hex values.

## Supported Plugins

The theme includes highlight groups for:

### Core
- Treesitter (all `@` captures)
- LSP semantic tokens (`@lsp.type.*`, `@lsp.mod.*`)
- Diagnostics

### Git
- GitSigns

### Completion
- nvim-cmp
- blink.cmp

### Fuzzy Finders
- Telescope
- fzf-lua

### File Explorers
- nvim-tree
- Neo-tree

### UI
- Lazy.nvim
- Which-key
- Indent Blankline
- Lualine (built-in themes)
- noice.nvim
- snacks.nvim

### Navigation & Context
- aerial.nvim
- nvim-navic
- flash.nvim
- nvim-treesitter-context

### Utilities
- mason.nvim
- trouble.nvim
- todo-comments.nvim
- grug-far.nvim
- sidekick.nvim

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
