-- Primer Light colorscheme
-- Based on Primer Primitives (https://primer.style/primitives)

vim.opt.background = "light"
vim.g.colors_name = "primer_light"

-- Clear lua cache for live reloading during development
package.loaded["lush_theme.primer_light"] = nil

-- Apply the theme
require("lush")(require("lush_theme.primer_light"))
