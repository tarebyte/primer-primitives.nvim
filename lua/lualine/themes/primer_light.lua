-- Lualine theme for primer_light
-- https://github.com/nvim-lualine/lualine.nvim

local p = require('primer-primitives.palettes.light')

return {
  normal = {
    a = { fg = p.fg.on_emphasis, bg = p.accent.emphasis, gui = 'bold' },
    b = { fg = p.fg.default, bg = p.canvas.subtle },
    c = { fg = p.fg.muted, bg = p.canvas.inset },
  },
  insert = {
    a = { fg = p.fg.on_emphasis, bg = p.success.emphasis, gui = 'bold' },
    b = { fg = p.fg.default, bg = p.canvas.subtle },
    c = { fg = p.fg.muted, bg = p.canvas.inset },
  },
  visual = {
    a = { fg = p.fg.on_emphasis, bg = p.done.emphasis, gui = 'bold' },
    b = { fg = p.fg.default, bg = p.canvas.subtle },
    c = { fg = p.fg.muted, bg = p.canvas.inset },
  },
  replace = {
    a = { fg = p.fg.on_emphasis, bg = p.danger.emphasis, gui = 'bold' },
    b = { fg = p.fg.default, bg = p.canvas.subtle },
    c = { fg = p.fg.muted, bg = p.canvas.inset },
  },
  command = {
    a = { fg = p.fg.on_emphasis, bg = p.attention.emphasis, gui = 'bold' },
    b = { fg = p.fg.default, bg = p.canvas.subtle },
    c = { fg = p.fg.muted, bg = p.canvas.inset },
  },
  inactive = {
    a = { fg = p.fg.muted, bg = p.canvas.inset },
    b = { fg = p.fg.muted, bg = p.canvas.inset },
    c = { fg = p.fg.muted, bg = p.canvas.inset },
  },
}
