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
 * Extract display scale colors (0-9) for a given color name
 */
function extractDisplayScale(theme, colorName, bgDefault) {
  const scale = [];
  for (let i = 0; i <= 9; i++) {
    const token = `display-${colorName}-scale-${i}`;
    scale.push(getTokenBlended(theme, token, bgDefault));
  }
  return scale;
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
      on_inverse: getTokenNormalized(theme, 'fgColor-onInverse'),
      disabled: getTokenNormalized(theme, 'fgColor-disabled'),
      link: getTokenNormalized(theme, 'fgColor-link'),
      neutral: getTokenNormalized(theme, 'fgColor-neutral'),
      black: getTokenNormalized(theme, 'fgColor-black'),
      white: getTokenNormalized(theme, 'fgColor-white'),
    },

    // Canvas (backgrounds)
    canvas: {
      default: bgDefault,
      inset: getTokenNormalized(theme, 'bgColor-inset'),
      subtle: getTokenNormalized(theme, 'bgColor-muted'),
      overlay: getTokenBlended(theme, 'overlay-bgColor', bgDefault),
      disabled: getTokenNormalized(theme, 'bgColor-disabled'),
      emphasis: getTokenNormalized(theme, 'bgColor-emphasis'),
      inverse: getTokenNormalized(theme, 'bgColor-inverse'),
    },

    // Border (blend alpha borders with background)
    border: {
      default: getTokenNormalized(theme, 'borderColor-default'),
      muted: getTokenBlended(theme, 'borderColor-muted', bgDefault),
      emphasis: getTokenNormalized(theme, 'borderColor-emphasis'),
      disabled: getTokenBlended(theme, 'borderColor-disabled', bgDefault),
      translucent: getTokenBlended(theme, 'borderColor-translucent', bgDefault),
    },

    // Accent (blend muted with background)
    accent: {
      fg: getTokenNormalized(theme, 'fgColor-accent'),
      emphasis: getTokenNormalized(theme, 'bgColor-accent-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-accent-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-accent-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-accent-muted', bgDefault),
    },

    // Semantic: Danger (blend muted with background)
    danger: {
      fg: getTokenNormalized(theme, 'fgColor-danger'),
      emphasis: getTokenNormalized(theme, 'bgColor-danger-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-danger-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-danger-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-danger-muted', bgDefault),
    },

    // Semantic: Success (blend muted with background)
    success: {
      fg: getTokenNormalized(theme, 'fgColor-success'),
      emphasis: getTokenNormalized(theme, 'bgColor-success-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-success-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-success-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-success-muted', bgDefault),
    },

    // Semantic: Attention/Warning (blend muted with background)
    attention: {
      fg: getTokenNormalized(theme, 'fgColor-attention'),
      emphasis: getTokenNormalized(theme, 'bgColor-attention-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-attention-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-attention-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-attention-muted', bgDefault),
    },

    // Semantic: Severe (blend muted with background)
    severe: {
      fg: getTokenNormalized(theme, 'fgColor-severe'),
      emphasis: getTokenNormalized(theme, 'bgColor-severe-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-severe-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-severe-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-severe-muted', bgDefault),
    },

    // Semantic: Done (blend muted with background)
    done: {
      fg: getTokenNormalized(theme, 'fgColor-done'),
      emphasis: getTokenNormalized(theme, 'bgColor-done-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-done-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-done-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-done-muted', bgDefault),
    },

    // Semantic: Open
    open: {
      fg: getTokenNormalized(theme, 'fgColor-open'),
      emphasis: getTokenNormalized(theme, 'bgColor-open-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-open-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-open-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-open-muted', bgDefault),
    },

    // Semantic: Closed
    closed: {
      fg: getTokenNormalized(theme, 'fgColor-closed'),
      emphasis: getTokenNormalized(theme, 'bgColor-closed-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-closed-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-closed-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-closed-muted', bgDefault),
    },

    // Semantic: Draft
    draft: {
      fg: getTokenNormalized(theme, 'fgColor-draft'),
      emphasis: getTokenNormalized(theme, 'bgColor-draft-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-draft-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-draft-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-draft-muted', bgDefault),
    },

    // Semantic: Neutral
    neutral: {
      fg: getTokenNormalized(theme, 'fgColor-neutral'),
      emphasis: getTokenNormalized(theme, 'bgColor-neutral-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-neutral-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-neutral-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-neutral-muted', bgDefault),
    },

    // Semantic: Sponsors
    sponsors: {
      fg: getTokenNormalized(theme, 'fgColor-sponsors'),
      emphasis: getTokenNormalized(theme, 'bgColor-sponsors-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-sponsors-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-sponsors-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-sponsors-muted', bgDefault),
    },

    // Semantic: Upsell
    upsell: {
      fg: getTokenNormalized(theme, 'fgColor-upsell'),
      emphasis: getTokenNormalized(theme, 'bgColor-upsell-emphasis'),
      muted: getTokenBlended(theme, 'bgColor-upsell-muted', bgDefault),
      border_emphasis: getTokenNormalized(theme, 'borderColor-upsell-emphasis'),
      border_muted: getTokenBlended(theme, 'borderColor-upsell-muted', bgDefault),
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
      constant_other_reference_link: getTokenNormalized(theme, 'color-prettylights-syntax-constant-other-reference-link'),
      entity: getTokenNormalized(theme, 'color-prettylights-syntax-entity'),
      keyword: getTokenNormalized(theme, 'color-prettylights-syntax-keyword'),
      string: getTokenNormalized(theme, 'color-prettylights-syntax-string'),
      string_regexp: getTokenNormalized(theme, 'color-prettylights-syntax-string-regexp'),
      variable: getTokenNormalized(theme, 'color-prettylights-syntax-variable'),
      func: getTokenNormalized(theme, 'color-prettylights-syntax-entity'), // Functions use entity color
      tag: getTokenNormalized(theme, 'color-prettylights-syntax-entity-tag'),
      storage_modifier_import: getTokenNormalized(theme, 'color-prettylights-syntax-storage-modifier-import'),
      bracket_highlighter_angle: getTokenNormalized(theme, 'color-prettylights-syntax-brackethighlighter-angle'),
      bracket_highlighter_unmatched: getTokenNormalized(theme, 'color-prettylights-syntax-brackethighlighter-unmatched'),
      carriage_return_bg: getTokenNormalized(theme, 'color-prettylights-syntax-carriage-return-bg'),
      carriage_return_text: getTokenNormalized(theme, 'color-prettylights-syntax-carriage-return-text'),
      invalid_illegal_bg: getTokenBlended(theme, 'color-prettylights-syntax-invalid-illegal-bg', bgDefault),
      invalid_illegal_text: getTokenNormalized(theme, 'color-prettylights-syntax-invalid-illegal-text'),
      markup_bold: getTokenNormalized(theme, 'color-prettylights-syntax-markup-bold'),
      markup_italic: getTokenNormalized(theme, 'color-prettylights-syntax-markup-italic'),
      markup_heading: getTokenNormalized(theme, 'color-prettylights-syntax-markup-heading'),
      markup_list: getTokenNormalized(theme, 'color-prettylights-syntax-markup-list'),
      markup_inserted_bg: getTokenNormalized(theme, 'color-prettylights-syntax-markup-inserted-bg'),
      markup_inserted_text: getTokenNormalized(theme, 'color-prettylights-syntax-markup-inserted-text'),
      markup_deleted_bg: getTokenNormalized(theme, 'color-prettylights-syntax-markup-deleted-bg'),
      markup_deleted_text: getTokenNormalized(theme, 'color-prettylights-syntax-markup-deleted-text'),
      markup_changed_bg: getTokenNormalized(theme, 'color-prettylights-syntax-markup-changed-bg'),
      markup_changed_text: getTokenNormalized(theme, 'color-prettylights-syntax-markup-changed-text'),
      markup_ignored_bg: getTokenNormalized(theme, 'color-prettylights-syntax-markup-ignored-bg'),
      markup_ignored_text: getTokenNormalized(theme, 'color-prettylights-syntax-markup-ignored-text'),
      meta_diff_range: getTokenNormalized(theme, 'color-prettylights-syntax-meta-diff-range'),
      sublimelinter_gutter_mark: getTokenNormalized(theme, 'color-prettylights-syntax-sublimelinter-gutter-mark'),
    },

    // CodeMirror editor colors
    codemirror: {
      bg: getTokenNormalized(theme, 'codeMirror-bgColor'),
      fg: getTokenNormalized(theme, 'codeMirror-fgColor'),
      cursor: getTokenNormalized(theme, 'codeMirror-cursor-fgColor'),
      selection_bg: getTokenBlended(theme, 'codeMirror-selection-bgColor', bgDefault),
      activeline_bg: getTokenBlended(theme, 'codeMirror-activeline-bgColor', bgDefault),
      matching_bracket: getTokenNormalized(theme, 'codeMirror-matchingBracket-fgColor'),
      gutters_bg: getTokenNormalized(theme, 'codeMirror-gutters-bgColor'),
      line_number: getTokenNormalized(theme, 'codeMirror-lineNumber-fgColor'),
      gutter_marker_default: getTokenNormalized(theme, 'codeMirror-gutterMarker-fgColor-default'),
      gutter_marker_muted: getTokenNormalized(theme, 'codeMirror-gutterMarker-fgColor-muted'),
      syntax_comment: getTokenNormalized(theme, 'codeMirror-syntax-fgColor-comment'),
      syntax_constant: getTokenNormalized(theme, 'codeMirror-syntax-fgColor-constant'),
      syntax_entity: getTokenNormalized(theme, 'codeMirror-syntax-fgColor-entity'),
      syntax_keyword: getTokenNormalized(theme, 'codeMirror-syntax-fgColor-keyword'),
      syntax_storage: getTokenNormalized(theme, 'codeMirror-syntax-fgColor-storage'),
      syntax_string: getTokenNormalized(theme, 'codeMirror-syntax-fgColor-string'),
      syntax_support: getTokenNormalized(theme, 'codeMirror-syntax-fgColor-support'),
      syntax_variable: getTokenNormalized(theme, 'codeMirror-syntax-fgColor-variable'),
    },

    // Diff colors
    diff: {
      addition_line_bg: getTokenBlended(theme, 'diffBlob-additionLine-bgColor', bgDefault),
      addition_line_fg: getTokenNormalized(theme, 'diffBlob-additionLine-fgColor'),
      addition_num_bg: getTokenBlended(theme, 'diffBlob-additionNum-bgColor', bgDefault),
      addition_num_fg: getTokenNormalized(theme, 'diffBlob-additionNum-fgColor'),
      addition_word_bg: getTokenBlended(theme, 'diffBlob-additionWord-bgColor', bgDefault),
      addition_word_fg: getTokenNormalized(theme, 'diffBlob-additionWord-fgColor'),
      deletion_line_bg: getTokenBlended(theme, 'diffBlob-deletionLine-bgColor', bgDefault),
      deletion_line_fg: getTokenNormalized(theme, 'diffBlob-deletionLine-fgColor'),
      deletion_num_bg: getTokenBlended(theme, 'diffBlob-deletionNum-bgColor', bgDefault),
      deletion_num_fg: getTokenNormalized(theme, 'diffBlob-deletionNum-fgColor'),
      deletion_word_bg: getTokenBlended(theme, 'diffBlob-deletionWord-bgColor', bgDefault),
      deletion_word_fg: getTokenNormalized(theme, 'diffBlob-deletionWord-fgColor'),
      hunk_line_bg: getTokenBlended(theme, 'diffBlob-hunkLine-bgColor', bgDefault),
      hunk_line_fg: getTokenNormalized(theme, 'diffBlob-hunkLine-fgColor'),
      hunk_num_bg: getTokenNormalized(theme, 'diffBlob-hunkNum-bgColor-rest'),
      hunk_num_fg: getTokenNormalized(theme, 'diffBlob-hunkNum-fgColor-rest'),
      hunk_num_bg_hover: getTokenNormalized(theme, 'diffBlob-hunkNum-bgColor-hover'),
      hunk_num_fg_hover: getTokenNormalized(theme, 'diffBlob-hunkNum-fgColor-hover'),
      empty_line_bg: getTokenNormalized(theme, 'diffBlob-emptyLine-bgColor'),
      empty_num_bg: getTokenNormalized(theme, 'diffBlob-emptyNum-bgColor'),
      expander_icon: getTokenNormalized(theme, 'diffBlob-expander-iconColor'),
    },

    // Display scale colors (0-9 for each color)
    scales: {
      auburn: extractDisplayScale(theme, 'auburn', bgDefault),
      blue: extractDisplayScale(theme, 'blue', bgDefault),
      brown: extractDisplayScale(theme, 'brown', bgDefault),
      coral: extractDisplayScale(theme, 'coral', bgDefault),
      cyan: extractDisplayScale(theme, 'cyan', bgDefault),
      gray: extractDisplayScale(theme, 'gray', bgDefault),
      green: extractDisplayScale(theme, 'green', bgDefault),
      indigo: extractDisplayScale(theme, 'indigo', bgDefault),
      lemon: extractDisplayScale(theme, 'lemon', bgDefault),
      lime: extractDisplayScale(theme, 'lime', bgDefault),
      olive: extractDisplayScale(theme, 'olive', bgDefault),
      orange: extractDisplayScale(theme, 'orange', bgDefault),
      pine: extractDisplayScale(theme, 'pine', bgDefault),
      pink: extractDisplayScale(theme, 'pink', bgDefault),
      plum: extractDisplayScale(theme, 'plum', bgDefault),
      purple: extractDisplayScale(theme, 'purple', bgDefault),
      red: extractDisplayScale(theme, 'red', bgDefault),
      teal: extractDisplayScale(theme, 'teal', bgDefault),
      yellow: extractDisplayScale(theme, 'yellow', bgDefault),
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
      gray: getTokenNormalized(theme, 'color-ansi-gray'),
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
