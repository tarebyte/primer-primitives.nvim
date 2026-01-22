# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2026-01-22

### Added

- Initial release
- Four theme variants: `primer_dark`, `primer_light`, `primer_dark_dimmed`, `primer_dark_high_contrast`
- Colors extracted directly from `@primer/primitives` npm package
- Comprehensive highlight group support for Neovim's built-in features:
  - Treesitter captures
  - LSP semantic tokens
  - Diagnostics
  - Diff mode
  - Spell checking
- Plugin support for:
  - nvim-cmp
  - blink.cmp
  - Telescope
  - fzf-lua
  - nvim-tree
  - Neo-tree
  - GitSigns
  - Lazy.nvim
  - Which-key
  - Indent Blankline
  - noice.nvim
  - snacks.nvim
  - aerial.nvim
  - nvim-navic
  - flash.nvim
  - nvim-treesitter-context
  - mason.nvim
  - trouble.nvim
  - todo-comments.nvim
  - grug-far.nvim
- Built-in lualine themes for all variants
- Terminal extras for Ghostty, iTerm2, and tmux
- Generator-based architecture producing standalone, dependency-free colorscheme files

[1.0.0]: https://github.com/tarebyte/primer-primitives.nvim/releases/tag/v1.0.0
