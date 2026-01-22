#!/usr/bin/env -S nvim -l
-- Generate standalone colorscheme files
-- Usage: nvim -l scripts/generate.lua
-- Or: chmod +x scripts/generate.lua && ./scripts/generate.lua

-- Get the script's directory to find the repo root
local script_path = debug.getinfo(1, 'S').source:sub(2)
local script_dir = script_path:match('(.*/)')
local repo_root = script_dir and script_dir:match('(.*)scripts/') or './'

-- Add the repo's lua directory to package.path
package.path = repo_root .. 'lua/?.lua;' .. repo_root .. 'lua/?/init.lua;' .. package.path

local generator = require('primer-primitives.generator')
local output_dir = repo_root .. 'colors'

print('Generating primer-primitives colorscheme files...')
print('Output directory: ' .. output_dir)
print('')

local results = generator.generate_all(output_dir)

for _, result in ipairs(results) do
  if result.success then
    print('✓ Generated: ' .. result.file)
  else
    print('✗ Failed: ' .. result.file .. ' - ' .. (result.error or 'unknown error'))
  end
end

print('')
print('Done! Generated ' .. #results .. ' colorscheme files.')
