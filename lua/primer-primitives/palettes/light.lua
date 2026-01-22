-- Primer Light palette from Primer Primitives
-- https://primer.style/primitives

return {
  name = 'primer_light',
  background = 'light',
  blend = 60,

  -- Foreground
  fg = {
    default = '#1f2328',
    muted = '#59636e',
    subtle = '#6e7781',
    on_emphasis = '#ffffff',
  },

  -- Canvas (backgrounds)
  canvas = {
    default = '#ffffff',
    inset = '#f6f8fa',
    subtle = '#f6f8fa',
    overlay = '#ffffff',
  },

  -- Border
  border = {
    default = '#d1d9e0',
    muted = '#d1d9e0',
  },

  -- Accent
  accent = {
    fg = '#0969da',
    emphasis = '#0969da',
    muted = '#54aeff',
  },

  -- Semantic: Danger
  danger = {
    fg = '#d1242f',
    emphasis = '#cf222e',
    muted = '#ffebe9',
  },

  -- Semantic: Success
  success = {
    fg = '#1a7f37',
    emphasis = '#1f883d',
    muted = '#dafbe1',
  },

  -- Semantic: Attention/Warning
  attention = {
    fg = '#9a6700',
    emphasis = '#9a6700',
    muted = '#fff8c5',
  },

  -- Semantic: Severe
  severe = {
    fg = '#bc4c00',
    emphasis = '#bc4c00',
    muted = '#fff1e5',
  },

  -- Semantic: Done
  done = {
    fg = '#8250df',
    emphasis = '#8250df',
    muted = '#fbefff',
  },

  -- Color scales
  scale = {
    black = '#1f2328',
    white = '#ffffff',
  },

  -- Syntax highlighting
  syntax = {
    comment = '#59636e',
    constant = '#0550ae',
    entity = '#6639ba',
    keyword = '#cf222e',
    string = '#0a3069',
    variable = '#953800',
    func = '#6639ba',
    tag = '#116329',
  },

  -- ANSI colors
  ansi = {
    black = '#24292f',
    red = '#cf222e',
    green = '#116329',
    yellow = '#4d2d00',
    blue = '#0969da',
    magenta = '#8250df',
    cyan = '#1b7c83',
    white = '#6e7781',
    bright_black = '#57606a',
    bright_red = '#a40e26',
    bright_green = '#1a7f37',
    bright_yellow = '#633c01',
    bright_blue = '#218bff',
    bright_magenta = '#a475f9',
    bright_cyan = '#3192aa',
    bright_white = '#8c959f',
  },
}
