import { describe, it } from 'node:test';
import assert from 'node:assert';
import { existsSync, readFileSync } from 'fs';
import { execSync } from 'child_process';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';

import {
  hexToRgb,
  paletteToRgb,
  generateGhostty,
  generateIterm,
  generateTmux,
} from './generate-extras.mjs';
import { THEMES } from './extract-primitives.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const PROJECT_ROOT = join(__dirname, '..');

// Sample palette for testing
const samplePalette = {
  name: 'primer_dark',
  background: 'dark',
  blend: 85,
  fg: {
    default: '#e6edf3',
    muted: '#8d96a0',
    subtle: '#8d96a0',
    on_emphasis: '#ffffff',
  },
  canvas: {
    default: '#0d1117',
    inset: '#010409',
    subtle: '#161b22',
    overlay: '#1c2128',
  },
  border: {
    default: '#30363d',
    muted: '#21262d',
  },
  accent: {
    fg: '#4493f8',
    emphasis: '#1f6feb',
    muted: '#121d2f',
  },
  danger: {
    fg: '#f85149',
    emphasis: '#da3633',
    muted: '#311a1a',
  },
  success: {
    fg: '#3fb950',
    emphasis: '#238636',
    muted: '#122117',
  },
  attention: {
    fg: '#d29922',
    emphasis: '#9e6a03',
    muted: '#272115',
  },
  severe: {
    fg: '#db6d28',
    emphasis: '#bd561d',
    muted: '#2a1a10',
  },
  done: {
    fg: '#a371f7',
    emphasis: '#8957e5',
    muted: '#211f3b',
  },
  scale: {
    black: '#010409',
    white: '#ffffff',
  },
  syntax: {
    comment: '#8b949e',
    constant: '#79c0ff',
    entity: '#d2a8ff',
    keyword: '#ff7b72',
    string: '#a5d6ff',
    variable: '#ffa657',
    func: '#d2a8ff',
    tag: '#7ee787',
  },
  ansi: {
    black: '#484f58',
    red: '#ff7b72',
    green: '#3fb950',
    yellow: '#d29922',
    blue: '#58a6ff',
    magenta: '#bc8cff',
    cyan: '#39c5cf',
    white: '#b1bac4',
    bright_black: '#6e7681',
    bright_red: '#ffa198',
    bright_green: '#56d364',
    bright_yellow: '#e3b341',
    bright_blue: '#79c0ff',
    bright_magenta: '#d2a8ff',
    bright_cyan: '#56d4dd',
    bright_white: '#f0f6fc',
  },
};

describe('Color conversion utilities', () => {
  describe('hexToRgb', () => {
    it('converts hex to RGB components (0.0-1.0)', () => {
      const result = hexToRgb('#ff0000');
      assert.strictEqual(result.r, 1);
      assert.strictEqual(result.g, 0);
      assert.strictEqual(result.b, 0);
    });

    it('handles lowercase hex', () => {
      const result = hexToRgb('#00ff00');
      assert.strictEqual(result.r, 0);
      assert.strictEqual(result.g, 1);
      assert.strictEqual(result.b, 0);
    });

    it('converts mid-range colors correctly', () => {
      const result = hexToRgb('#808080');
      assert.ok(Math.abs(result.r - 0.502) < 0.01);
      assert.ok(Math.abs(result.g - 0.502) < 0.01);
      assert.ok(Math.abs(result.b - 0.502) < 0.01);
    });
  });

  describe('paletteToRgb', () => {
    it('converts all palette colors to RGB', () => {
      const rgb = paletteToRgb(samplePalette);

      assert.ok(rgb.fg);
      assert.ok(rgb.fg.default);
      assert.ok(typeof rgb.fg.default.r === 'number');

      assert.ok(rgb.canvas);
      assert.ok(rgb.accent);
      assert.ok(rgb.ansi);
      assert.ok(rgb.ansi.black);
    });
  });
});

describe('Theme generators', () => {
  describe('generateGhostty', () => {
    it('generates valid Ghostty config', () => {
      const output = generateGhostty(samplePalette);

      // Check header
      assert.ok(output.includes('# Primer Dark'));
      assert.ok(output.includes('@primer/primitives'));

      // Check color assignments
      assert.ok(output.includes('background ='));
      assert.ok(output.includes('foreground ='));
      assert.ok(output.includes('cursor-color ='));
      assert.ok(output.includes('selection-background ='));

      // Check ANSI palette
      assert.ok(output.includes('palette = 0='));
      assert.ok(output.includes('palette = 15='));
    });

    it('includes installation instructions', () => {
      const output = generateGhostty(samplePalette);
      assert.ok(output.includes('Installation:'));
      assert.ok(output.includes('theme = primer_dark'));
    });
  });

  describe('generateIterm', () => {
    it('generates valid iTerm2 plist', () => {
      const output = generateIterm(samplePalette);

      // Check XML structure
      assert.ok(output.includes('<?xml version="1.0"'));
      assert.ok(output.includes('<!DOCTYPE plist'));
      assert.ok(output.includes('<plist version="1.0">'));
      assert.ok(output.includes('</plist>'));

      // Check color keys
      assert.ok(output.includes('Ansi 0 Color'));
      assert.ok(output.includes('Ansi 15 Color'));
      assert.ok(output.includes('Background Color'));
      assert.ok(output.includes('Foreground Color'));
      assert.ok(output.includes('Cursor Color'));
      assert.ok(output.includes('Selection Color'));
      assert.ok(output.includes('Link Color'));
      assert.ok(output.includes('Badge Color'));

      // Check RGB components are present
      assert.ok(output.includes('Red Component'));
      assert.ok(output.includes('Green Component'));
      assert.ok(output.includes('Blue Component'));
      assert.ok(output.includes('<real>'));
    });

    it('includes installation instructions', () => {
      const output = generateIterm(samplePalette);
      assert.ok(output.includes('Installation:'));
      assert.ok(output.includes('Color Presets'));
    });
  });

  describe('generateTmux', () => {
    it('generates valid tmux config', () => {
      const output = generateTmux(samplePalette);

      // Check header
      assert.ok(output.includes('# Primer Dark'));
      assert.ok(output.includes('@primer/primitives'));

      // Check status bar settings
      assert.ok(output.includes('status-style'));
      assert.ok(output.includes('status-left'));
      assert.ok(output.includes('status-right'));

      // Check window settings
      assert.ok(output.includes('window-status-format'));
      assert.ok(output.includes('window-status-current-format'));

      // Check pane settings
      assert.ok(output.includes('pane-border-style'));
      assert.ok(output.includes('pane-active-border-style'));

      // Check message and mode settings
      assert.ok(output.includes('message-style'));
      assert.ok(output.includes('mode-style'));
    });

    it('includes installation instructions', () => {
      const output = generateTmux(samplePalette);
      assert.ok(output.includes('Installation:'));
      assert.ok(output.includes('source-file'));
    });
  });
});

describe('Extras file generation', () => {
  it('generates extras files for all themes', () => {
    // Run extraction (which now includes extras generation)
    execSync('node scripts/extract-primitives.mjs', { cwd: PROJECT_ROOT });

    // Check all extras files exist
    for (const config of Object.values(THEMES)) {
      // Ghostty (no extension)
      const ghosttyPath = join(PROJECT_ROOT, 'extras/ghostty', config.name);
      assert.ok(existsSync(ghosttyPath), `Missing Ghostty file: ${ghosttyPath}`);

      // iTerm2 (.itermcolors)
      const itermPath = join(PROJECT_ROOT, 'extras/iterm', `${config.name}.itermcolors`);
      assert.ok(existsSync(itermPath), `Missing iTerm file: ${itermPath}`);

      // tmux (.tmux)
      const tmuxPath = join(PROJECT_ROOT, 'extras/tmux', `${config.name}.tmux`);
      assert.ok(existsSync(tmuxPath), `Missing tmux file: ${tmuxPath}`);
    }
  });

  it('Ghostty files have valid format', () => {
    for (const config of Object.values(THEMES)) {
      const filepath = join(PROJECT_ROOT, 'extras/ghostty', config.name);
      const content = readFileSync(filepath, 'utf-8');

      // Check for required Ghostty config keys
      assert.ok(content.includes('background ='), `${config.name} missing background`);
      assert.ok(content.includes('foreground ='), `${config.name} missing foreground`);
      assert.ok(content.includes('palette = 0='), `${config.name} missing palette`);

      // Check colors are valid hex (without #)
      const palettePattern = /palette = \d+=#[0-9a-f]{6}/g;
      const matches = content.match(palettePattern);
      assert.ok(matches && matches.length === 16, `${config.name} should have 16 palette colors`);
    }
  });

  it('iTerm files are valid XML', () => {
    for (const config of Object.values(THEMES)) {
      const filepath = join(PROJECT_ROOT, 'extras/iterm', `${config.name}.itermcolors`);
      const content = readFileSync(filepath, 'utf-8');

      // Check XML structure
      assert.ok(content.includes('<?xml'), `${config.name} missing XML declaration`);
      assert.ok(content.includes('<plist'), `${config.name} missing plist tag`);
      assert.ok(content.includes('</plist>'), `${config.name} missing closing plist`);

      // Check for required color keys
      assert.ok(content.includes('Background Color'), `${config.name} missing Background Color`);
      assert.ok(content.includes('Foreground Color'), `${config.name} missing Foreground Color`);
    }
  });

  it('tmux files have valid format', () => {
    for (const config of Object.values(THEMES)) {
      const filepath = join(PROJECT_ROOT, 'extras/tmux', `${config.name}.tmux`);
      const content = readFileSync(filepath, 'utf-8');

      // Check for required tmux settings
      assert.ok(content.includes('set -g status-style'), `${config.name} missing status-style`);
      assert.ok(content.includes('set -g pane-border-style'), `${config.name} missing pane-border-style`);

      // Check colors are valid hex
      const hexPattern = /#[0-9a-f]{6}/g;
      const matches = content.match(hexPattern);
      assert.ok(matches && matches.length > 0, `${config.name} should have hex colors`);
    }
  });
});
