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
├── extras/                              # Generated terminal emulator themes
│   ├── ghostty/                         # Ghostty themes (no extension)
│   ├── iterm/                           # iTerm2 themes (.itermcolors)
│   └── tmux/                            # tmux themes (.tmux)
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
│   ├── generate-extras.mjs              # Generates terminal emulator themes
│   ├── generate-extras.test.mjs         # Tests for extras generation
│   ├── generate.lua                     # CLI entry point for Lua generation
│   └── templates/
│       ├── palette.lua.ejs              # Template for palette generation
│       ├── ghostty.ejs                  # Template for Ghostty themes
│       ├── iterm.itermcolors.ejs        # Template for iTerm2 themes
│       └── tmux.tmux.ejs                # Template for tmux themes
├── package.json                         # npm scripts and dependencies
└── node_modules/@primer/primitives/     # Source of truth for colors
```

## Build Workflow

The colorscheme is generated in two steps:

1. **Extract** - Node.js script reads from `@primer/primitives` npm package and generates Lua palette files and terminal extras (Ghostty, iTerm2, tmux)
2. **Generate** - Neovim Lua script combines palettes with highlight definitions to create standalone colorscheme files

### Full build (extract + generate)

```bash
npm run build
```

### Extract palettes from @primer/primitives

```bash
npm run extract
```

This reads the JSON token files from `node_modules/@primer/primitives/dist/docs/functional/themes/` and generates:
- Lua palette files in `lua/primer-primitives/palettes/`
- Terminal emulator themes in `extras/`

### Generate colorscheme files

```bash
npm run generate
# or
nvim -l scripts/generate.lua
```

### Regenerate extras only

```bash
npm run extras
```

### Update to latest @primer/primitives

```bash
npm update @primer/primitives && npm run build
```

## Key Concepts

### Palettes (`lua/primer-primitives/palettes/*.lua`)

Each palette file exports a table with all colors from the Primer Primitives design system:

**Core Configuration:**
- `name` - Colorscheme name (e.g., `primer_dark`)
- `background` - `'dark'` or `'light'`
- `blend` - Transparency level for selection highlights (60-85)

**Foreground Colors (`fg`):**
- `default`, `muted`, `subtle`, `on_emphasis`, `on_inverse`, `disabled`, `link`, `neutral`, `black`, `white`

**Background Colors (`canvas`):**
- `default`, `inset`, `subtle`, `overlay`, `disabled`, `emphasis`, `inverse`

**Border Colors (`border`):**
- `default`, `muted`, `emphasis`, `disabled`, `translucent`

**Semantic Colors** (each with `fg`, `emphasis`, `muted`, `border_emphasis`, `border_muted`):
- `accent` - Primary accent (blue)
- `danger` - Error/destructive actions (red)
- `success` - Success states (green)
- `attention` - Warnings (yellow)
- `severe` - Severe warnings (orange)
- `done` - Completed states (purple)
- `open` - Open issues/PRs (green)
- `closed` - Closed issues/PRs (red)
- `draft` - Draft states (gray)
- `neutral` - Neutral states (gray)
- `sponsors` - GitHub Sponsors (pink)
- `upsell` - Upgrade prompts (purple)

**Syntax Highlighting (`syntax`):**
- Core: `comment`, `constant`, `entity`, `keyword`, `string`, `variable`, `func`, `tag`
- Extended: `constant_other_reference_link`, `string_regexp`, `storage_modifier_import`
- Brackets: `bracket_highlighter_angle`, `bracket_highlighter_unmatched`
- Errors: `carriage_return_bg`, `carriage_return_text`, `invalid_illegal_bg`, `invalid_illegal_text`
- Markup: `markup_bold`, `markup_italic`, `markup_heading`, `markup_list`, `markup_inserted_*`, `markup_deleted_*`, `markup_changed_*`, `markup_ignored_*`
- Diff: `meta_diff_range`, `sublimelinter_gutter_mark`

**CodeMirror Editor Colors (`codemirror`):**
- Editor: `bg`, `fg`, `cursor`, `selection_bg`, `activeline_bg`, `matching_bracket`
- Gutters: `gutters_bg`, `line_number`, `gutter_marker_default`, `gutter_marker_muted`
- Syntax: `syntax_comment`, `syntax_constant`, `syntax_entity`, `syntax_keyword`, `syntax_storage`, `syntax_string`, `syntax_support`, `syntax_variable`

**Diff Colors (`diff`):**
- Addition: `addition_line_bg/fg`, `addition_num_bg/fg`, `addition_word_bg/fg`
- Deletion: `deletion_line_bg/fg`, `deletion_num_bg/fg`, `deletion_word_bg/fg`
- Hunk: `hunk_line_bg/fg`, `hunk_num_bg/fg`, `hunk_num_bg_hover/fg_hover`
- Other: `empty_line_bg`, `empty_num_bg`, `expander_icon`

**Display Scale Colors (`scales`):**
- 19 color ramps, each with 10 shades (0-9): `auburn`, `blue`, `brown`, `coral`, `cyan`, `gray`, `green`, `indigo`, `lemon`, `lime`, `olive`, `orange`, `pine`, `pink`, `plum`, `purple`, `red`, `teal`, `yellow`

**ANSI Terminal Colors (`ansi`):**
- Standard: `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, `white`, `gray`
- Bright: `bright_black`, `bright_red`, `bright_green`, `bright_yellow`, `bright_blue`, `bright_magenta`, `bright_cyan`, `bright_white`

**Base Scale (`scale`):**
- `black`, `white`

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
| `fg.disabled` | `fgColor-disabled` |
| `fg.link` | `fgColor-link` |
| `canvas.default` | `bgColor-default` |
| `canvas.inset` | `bgColor-inset` |
| `canvas.emphasis` | `bgColor-emphasis` |
| `border.default` | `borderColor-default` |
| `border.emphasis` | `borderColor-emphasis` |
| `accent.fg` | `fgColor-accent` |
| `accent.emphasis` | `bgColor-accent-emphasis` |
| `accent.muted` | `bgColor-accent-muted` (blended) |
| `accent.border_emphasis` | `borderColor-accent-emphasis` |
| `accent.border_muted` | `borderColor-accent-muted` (blended) |
| `syntax.comment` | `color-prettylights-syntax-comment` |
| `syntax.markup_*` | `color-prettylights-syntax-markup-*` |
| `codemirror.*` | `codeMirror-*` |
| `diff.*` | `diffBlob-*` |
| `scales.<color>[n]` | `display-<color>-scale-<n>` |
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

## Terminal Extras

The build process generates theme files for terminal emulators in the `extras/` directory.

### Ghostty

Copy the theme file to your Ghostty themes directory:

```bash
cp extras/ghostty/primer_dark ~/.config/ghostty/themes/
```

Then add to your Ghostty config:

```
theme = primer_dark
```

### iTerm2

1. Open iTerm2 Preferences (Cmd+,)
2. Go to Profiles > Colors
3. Click "Color Presets..." dropdown
4. Select "Import..." and choose `extras/iterm/primer_dark.itermcolors`
5. Select "primer_dark" from the presets

### tmux

Source the theme in your tmux.conf:

```bash
source-file /path/to/extras/tmux/primer_dark.tmux
```

Or copy the settings directly into your tmux.conf.
