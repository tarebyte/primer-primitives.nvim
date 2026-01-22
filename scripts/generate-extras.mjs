#!/usr/bin/env node

/**
 * Generate terminal emulator theme files (extras) from palette data.
 *
 * Supported formats:
 * - Ghostty (plain config file)
 * - iTerm2 (.itermcolors XML plist)
 * - tmux (.tmux config)
 *
 * Usage: import { generateExtras } from './generate-extras.mjs'
 */

import { readFileSync, writeFileSync, mkdirSync } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';
import Color from 'color';
import ejs from 'ejs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const PROJECT_ROOT = join(__dirname, '..');
const EXTRAS_OUTPUT = join(PROJECT_ROOT, 'extras');
const TEMPLATES_PATH = join(__dirname, 'templates');

/**
 * Convert a hex color to RGB components (0.0-1.0 range for iTerm2)
 */
export function hexToRgb(hex) {
  const color = Color(hex);
  return {
    r: color.red() / 255,
    g: color.green() / 255,
    b: color.blue() / 255,
  };
}

/**
 * Convert all hex colors in a palette to RGB format for iTerm2
 */
export function paletteToRgb(palette) {
  const rgb = {};

  // Foreground colors
  rgb.fg = {
    default: hexToRgb(palette.fg.default),
    muted: hexToRgb(palette.fg.muted),
    on_emphasis: hexToRgb(palette.fg.on_emphasis),
  };

  // Canvas colors
  rgb.canvas = {
    default: hexToRgb(palette.canvas.default),
    inset: hexToRgb(palette.canvas.inset),
    subtle: hexToRgb(palette.canvas.subtle),
    overlay: hexToRgb(palette.canvas.overlay),
  };

  // Accent colors
  rgb.accent = {
    fg: hexToRgb(palette.accent.fg),
    emphasis: hexToRgb(palette.accent.emphasis),
    muted: hexToRgb(palette.accent.muted),
  };

  // ANSI colors
  rgb.ansi = {};
  for (const [key, value] of Object.entries(palette.ansi)) {
    rgb.ansi[key] = hexToRgb(value);
  }

  return rgb;
}

/**
 * Generate Ghostty theme file
 */
export function generateGhostty(palette) {
  const templatePath = join(TEMPLATES_PATH, 'ghostty.ejs');
  const template = readFileSync(templatePath, 'utf-8');
  const title = palette.name.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());

  return ejs.render(template, { ...palette, title });
}

/**
 * Generate iTerm2 .itermcolors file
 */
export function generateIterm(palette) {
  const templatePath = join(TEMPLATES_PATH, 'iterm.itermcolors.ejs');
  const template = readFileSync(templatePath, 'utf-8');
  const title = palette.name.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
  const rgb = paletteToRgb(palette);

  return ejs.render(template, { ...palette, rgb, title });
}

/**
 * Generate tmux theme file
 */
export function generateTmux(palette) {
  const templatePath = join(TEMPLATES_PATH, 'tmux.tmux.ejs');
  const template = readFileSync(templatePath, 'utf-8');
  const title = palette.name.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());

  return ejs.render(template, { ...palette, title });
}

/**
 * Generate all extras for a palette and write to disk
 */
export function generateExtras(palette) {
  const results = [];

  // Ensure output directories exist
  const ghosttyDir = join(EXTRAS_OUTPUT, 'ghostty');
  const itermDir = join(EXTRAS_OUTPUT, 'iterm');
  const tmuxDir = join(EXTRAS_OUTPUT, 'tmux');

  mkdirSync(ghosttyDir, { recursive: true });
  mkdirSync(itermDir, { recursive: true });
  mkdirSync(tmuxDir, { recursive: true });

  // Generate Ghostty theme (no extension)
  const ghosttyPath = join(ghosttyDir, palette.name);
  const ghosttyContent = generateGhostty(palette);
  writeFileSync(ghosttyPath, ghosttyContent);
  results.push({ type: 'ghostty', path: ghosttyPath });

  // Generate iTerm2 theme (.itermcolors)
  const itermPath = join(itermDir, `${palette.name}.itermcolors`);
  const itermContent = generateIterm(palette);
  writeFileSync(itermPath, itermContent);
  results.push({ type: 'iterm', path: itermPath });

  // Generate tmux theme (.tmux)
  const tmuxPath = join(tmuxDir, `${palette.name}.tmux`);
  const tmuxContent = generateTmux(palette);
  writeFileSync(tmuxPath, tmuxContent);
  results.push({ type: 'tmux', path: tmuxPath });

  return results;
}

/**
 * Generate extras for all themes (standalone entry point)
 */
export async function main() {
  // Dynamic import to avoid circular dependency issues
  const { THEMES } = await import('./extract-primitives.mjs');
  const { readFileSync } = await import('fs');
  const { join } = await import('path');

  console.log('Generating extras...\n');

  const palettesDir = join(PROJECT_ROOT, 'lua/primer-primitives/palettes');

  for (const [themeName, config] of Object.entries(THEMES)) {
    const filename = themeName.replace(/-/g, '_') + '.lua';
    const palettePath = join(palettesDir, filename);

    // Parse Lua palette file to extract colors
    // This is a simple parser that extracts key-value pairs
    const content = readFileSync(palettePath, 'utf-8');
    const palette = parseLuaPalette(content, config);

    console.log(`Processing: ${config.name}`);
    const results = generateExtras(palette);
    for (const result of results) {
      console.log(`  ✓ Generated: ${result.path}`);
    }
  }

  console.log('\nDone!');
}

/**
 * Simple Lua palette parser (extracts hex colors from our palette format)
 */
function parseLuaPalette(content, config) {
  const palette = {
    name: config.name,
    background: config.background,
    blend: config.blend,
    fg: {},
    canvas: {},
    border: {},
    accent: {},
    danger: {},
    success: {},
    attention: {},
    severe: {},
    done: {},
    scale: {},
    syntax: {},
    ansi: {},
  };

  // Extract all hex color assignments
  const hexPattern = /(\w+(?:\.\w+)?)\s*=\s*'(#[0-9a-fA-F]{6})'/g;
  let match;

  while ((match = hexPattern.exec(content)) !== null) {
    const [, path, value] = match;
    const parts = path.split('.');

    if (parts.length === 1 && palette[parts[0]] !== undefined) {
      palette[parts[0]] = value;
    } else if (parts.length === 2 && palette[parts[0]]) {
      palette[parts[0]][parts[1]] = value;
    }
  }

  return palette;
}

// Run main() only when executed directly
const isMainModule = import.meta.url === `file://${process.argv[1]}`;
if (isMainModule) {
  main().catch(console.error);
}
