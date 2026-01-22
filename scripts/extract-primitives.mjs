#!/usr/bin/env node

/**
 * Extract colors from @primer/primitives and generate Lua palette files.
 *
 * Usage: node scripts/extract-primitives.mjs
 */

import { readFileSync, writeFileSync, mkdirSync } from 'fs';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';
import Color from 'color';
import ejs from 'ejs';
import { generateExtras } from './generate-extras.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const PROJECT_ROOT = join(__dirname, '..');
const PRIMITIVES_PATH = join(PROJECT_ROOT, 'node_modules/@primer/primitives/dist/docs/functional/themes');
const PALETTES_OUTPUT = join(PROJECT_ROOT, 'lua/primer-primitives/palettes');
const TEMPLATE_PATH = join(__dirname, 'templates/palette.lua.ejs');

/**
 * Parse a hex color, handling 8-digit hex with alpha (e.g., #RRGGBBAA).
 * Returns a Color object.
 */
export function parseColor(hex) {
  // Color library doesn't handle #RRGGBBAA format, so we need to parse it manually
  if (hex.length === 9 && hex.startsWith('#')) {
    const rgb = hex.slice(0, 7);
    const alpha = parseInt(hex.slice(7, 9), 16) / 255;
    return Color(rgb).alpha(alpha);
  }
  return Color(hex);
}

/**
 * Blend a foreground color with alpha over a background color.
 * Returns an opaque 6-digit hex color.
 */
export function blendWithBackground(fgHex, bgHex) {
  const fg = parseColor(fgHex);
  const bg = parseColor(bgHex);

  // If no alpha, return as-is
  if (fg.alpha() === 1) {
    return fg.hex().toLowerCase();
  }

  // Alpha compositing using the color library's mix function
  // mix(color, weight) blends toward the given color by weight
  // We want: result = fg * alpha + bg * (1 - alpha)
  const alpha = fg.alpha();
  const blended = bg.mix(fg.alpha(1), alpha);

  return blended.hex().toLowerCase();
}

/**
 * Normalize a hex color to 6-digit format, stripping alpha if present.
 */
export function normalizeHex(hex) {
  return parseColor(hex).hex().toLowerCase();
}

// Theme configurations: primer theme name -> our palette name and settings
export const THEMES = {
  'dark': {
    name: 'primer_dark',
    background: 'dark',
    blend: 85,
  },
  'light': {
    name: 'primer_light',
    background: 'light',
    blend: 60,
  },
  'dark-dimmed': {
    name: 'primer_dark_dimmed',
    background: 'dark',
    blend: 85,
  },
  'dark-high-contrast': {
    name: 'primer_dark_high_contrast',
    background: 'dark',
    blend: 85,
  },
};

/**
 * Load a primer primitives theme JSON file
 */
function loadTheme(themeName) {
  const filePath = join(PRIMITIVES_PATH, `${themeName}.json`);
  const content = readFileSync(filePath, 'utf-8');
  return JSON.parse(content);
}

/**
 * Get a token value from the theme, with optional fallback.
 * Returns the raw value (may include alpha).
 */
function getToken(theme, key, fallback = null) {
  const token = theme[key];
  if (token && token.value) {
    return token.value;
  }
  if (fallback !== null) {
    return fallback;
  }
  console.warn(`Warning: Missing token '${key}'`);
  return '#ff00ff'; // Bright magenta for missing colors
}

/**
 * Get a token value and normalize to 6-digit hex (strip alpha).
 */
function getTokenNormalized(theme, key, fallback = null) {
  const value = getToken(theme, key, fallback);
  return normalizeHex(value);
}

/**
 * Get a token value and blend with background if it has alpha.
 */
function getTokenBlended(theme, key, bgHex, fallback = null) {
  const value = getToken(theme, key, fallback);
  return blendWithBackground(value, bgHex);
}

/**
 * Extract our palette structure from a primer primitives theme
 */
function extractPalette(themeName, config) {
  const theme = loadTheme(themeName);

  // Get the background color first, as we need it for blending
  const bgDefault = getTokenNormalized(theme, 'bgColor-default');

  return {
    name: config.name,
    background: config.background,
    blend: config.blend,

    // Foreground
    fg: {
      default: getTokenNormalized(theme, 'fgColor-default'),
      muted: getTokenNormalized(theme, 'fgColor-muted'),
      subtle: getTokenNormalized(theme, 'fgColor-muted'), // Use muted as subtle fallback
      on_emphasis: getTokenNormalized(theme, 'fgColor-onEmphasis'),
    },

    // Canvas (backgrounds)
    canvas: {
      default: bgDefault,
      inset: getTokenNormalized(theme, 'bgColor-inset'),
      subtle: getTokenNormalized(theme, 'bgColor-muted'),
      overlay: getTokenBlended(theme, 'overlay-bgColor', bgDefault),
    },

    // Border (blend alpha borders with background)
    border: {
      default: getTokenNormalized(theme, 'borderColor-default'),
      muted: getTokenBlended(theme, 'borderColor-muted', bgDefault),
    },

    // Accent (blend muted with background)
    accent: {
      fg: getTokenNormalized(theme, 'fgColor-accent'),
      emphasis: getTokenNormalized(theme, 'bgColor-accent-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-accent-muted', bgDefault),
    },

    // Semantic: Danger (blend muted with background)
    danger: {
      fg: getTokenNormalized(theme, 'fgColor-danger'),
      emphasis: getTokenNormalized(theme, 'bgColor-danger-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-danger-muted', bgDefault),
    },

    // Semantic: Success (blend muted with background)
    success: {
      fg: getTokenNormalized(theme, 'fgColor-success'),
      emphasis: getTokenNormalized(theme, 'bgColor-success-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-success-muted', bgDefault),
    },

    // Semantic: Attention/Warning (blend muted with background)
    attention: {
      fg: getTokenNormalized(theme, 'fgColor-attention'),
      emphasis: getTokenNormalized(theme, 'bgColor-attention-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-attention-muted', bgDefault),
    },

    // Semantic: Severe (blend muted with background)
    severe: {
      fg: getTokenNormalized(theme, 'fgColor-severe'),
      emphasis: getTokenNormalized(theme, 'bgColor-severe-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-severe-muted', bgDefault),
    },

    // Semantic: Done (blend muted with background)
    done: {
      fg: getTokenNormalized(theme, 'fgColor-done'),
      emphasis: getTokenNormalized(theme, 'bgColor-done-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-done-muted', bgDefault),
    },

    // Color scales
    scale: {
      black: getTokenNormalized(theme, 'bgColor-black', '#010409'),
      white: getTokenNormalized(theme, 'bgColor-white', '#ffffff'),
    },

    // Syntax highlighting (prettylights tokens, used for GitHub's rendered code)
    syntax: {
      comment: getTokenNormalized(theme, 'color-prettylights-syntax-comment'),
      constant: getTokenNormalized(theme, 'color-prettylights-syntax-constant'),
      entity: getTokenNormalized(theme, 'color-prettylights-syntax-entity'),
      keyword: getTokenNormalized(theme, 'color-prettylights-syntax-keyword'),
      string: getTokenNormalized(theme, 'color-prettylights-syntax-string'),
      variable: getTokenNormalized(theme, 'color-prettylights-syntax-variable'),
      func: getTokenNormalized(theme, 'color-prettylights-syntax-entity'), // Functions use entity color
      tag: getTokenNormalized(theme, 'color-prettylights-syntax-entity-tag'),
    },

    // ANSI colors
    ansi: {
      black: getTokenNormalized(theme, 'color-ansi-black'),
      red: getTokenNormalized(theme, 'color-ansi-red'),
      green: getTokenNormalized(theme, 'color-ansi-green'),
      yellow: getTokenNormalized(theme, 'color-ansi-yellow'),
      blue: getTokenNormalized(theme, 'color-ansi-blue'),
      magenta: getTokenNormalized(theme, 'color-ansi-magenta'),
      cyan: getTokenNormalized(theme, 'color-ansi-cyan'),
      white: getTokenNormalized(theme, 'color-ansi-white'),
      bright_black: getTokenNormalized(theme, 'color-ansi-black-bright'),
      bright_red: getTokenNormalized(theme, 'color-ansi-red-bright'),
      bright_green: getTokenNormalized(theme, 'color-ansi-green-bright'),
      bright_yellow: getTokenNormalized(theme, 'color-ansi-yellow-bright'),
      bright_blue: getTokenNormalized(theme, 'color-ansi-blue-bright'),
      bright_magenta: getTokenNormalized(theme, 'color-ansi-magenta-bright'),
      bright_cyan: getTokenNormalized(theme, 'color-ansi-cyan-bright'),
      bright_white: getTokenNormalized(theme, 'color-ansi-white-bright'),
    },
  };
}

/**
 * Convert a palette object to Lua source code using EJS template
 */
function paletteToLua(palette) {
  const template = readFileSync(TEMPLATE_PATH, 'utf-8');
  const title = palette.name.replace(/_/g, ' ').replace(/\b\w/g, c => c.toUpperCase());
  return ejs.render(template, { ...palette, title });
}

/**
 * Get the output filename for a theme
 */
function getOutputFilename(themeName) {
  // Convert theme name to filename: dark-dimmed -> dark_dimmed.lua
  return themeName.replace(/-/g, '_') + '.lua';
}

/**
 * Main entry point
 */
export function main() {
  console.log('Extracting colors from @primer/primitives...\n');

  // Ensure output directory exists
  mkdirSync(PALETTES_OUTPUT, { recursive: true });

  for (const [themeName, config] of Object.entries(THEMES)) {
    console.log(`Processing: ${themeName} -> ${config.name}`);

    try {
      const palette = extractPalette(themeName, config);
      const lua = paletteToLua(palette);
      const outputPath = join(PALETTES_OUTPUT, getOutputFilename(themeName));

      writeFileSync(outputPath, lua + '\n');
      console.log(`  ✓ Generated: ${outputPath}`);

      // Generate extras (Ghostty, iTerm2, tmux)
      const extrasResults = generateExtras(palette);
      for (const result of extrasResults) {
        console.log(`  ✓ Generated: ${result.path}`);
      }
    } catch (error) {
      console.error(`  ✗ Error processing ${themeName}:`, error.message);
    }
  }

  console.log('\nDone! Run `nvim -l scripts/generate.lua` to regenerate colorscheme files.');
}

// Run main() only when executed directly (not when imported)
const isMainModule = import.meta.url === `file://${process.argv[1]}`;
if (isMainModule) {
  main();
}
