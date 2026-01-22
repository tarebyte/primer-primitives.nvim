-- Primer Dark colorscheme
-- Based on Primer Primitives (https://primer.style/primitives)

vim.opt.background = "dark"
vim.g.colors_name = "primer_dark"

-- Clear lua cache for live reloading during development
package.loaded["lush_theme.primer_dark"] = nil

-- Apply the theme
require("lush")(require("lush_theme.primer_dark"))
