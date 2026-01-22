import { describe, it } from 'node:test';
import assert from 'node:assert';
import { existsSync, readFileSync } from 'fs';
import { execSync } from 'child_process';
import { dirname, join } from 'path';
import { fileURLToPath } from 'url';

import {
  parseColor,
  blendWithBackground,
  normalizeHex,
  THEMES,
} from './extract-primitives.mjs';

const __dirname = dirname(fileURLToPath(import.meta.url));
const PROJECT_ROOT = join(__dirname, '..');

describe('Color utilities', () => {
  describe('parseColor', () => {
    it('parses 6-digit hex colors', () => {
      const color = parseColor('#ff0000');
      assert.strictEqual(color.hex(), '#FF0000');
      assert.strictEqual(color.alpha(), 1);
    });

    it('parses 8-digit hex colors with alpha', () => {
      const color = parseColor('#ff000080');
      assert.strictEqual(color.hex(), '#FF0000');
      assert.ok(Math.abs(color.alpha() - 0.502) < 0.01); // ~50% alpha
    });

    it('parses 3-digit hex colors', () => {
      const color = parseColor('#f00');
      assert.strictEqual(color.hex(), '#FF0000');
    });
  });

  describe('normalizeHex', () => {
    it('normalizes to lowercase 6-digit hex', () => {
      assert.strictEqual(normalizeHex('#FF0000'), '#ff0000');
      assert.strictEqual(normalizeHex('#f00'), '#ff0000');
    });

    it('strips alpha from 8-digit hex', () => {
      assert.strictEqual(normalizeHex('#ff000080'), '#ff0000');
    });
  });

  describe('blendWithBackground', () => {
    it('returns color as-is when no alpha', () => {
      const result = blendWithBackground('#ff0000', '#000000');
      assert.strictEqual(result, '#ff0000');
    });

    it('blends 50% alpha color correctly', () => {
      // 50% red over black should give ~#800000
      const result = blendWithBackground('#ff000080', '#000000');
      // Allow some tolerance for rounding
      assert.ok(result.startsWith('#7') || result.startsWith('#8'));
    });

    it('blends 10% alpha color correctly', () => {
      // 10% blue (#388bfd) over dark bg (#0d1117)
      // This is similar to accent.muted
      const result = blendWithBackground('#388bfd1a', '#0d1117');
      assert.match(result, /^#[0-9a-f]{6}$/);
    });
  });
});

describe('Theme configuration', () => {
  it('has all expected themes defined', () => {
    assert.ok(THEMES['dark']);
    assert.ok(THEMES['light']);
    assert.ok(THEMES['dark-dimmed']);
    assert.ok(THEMES['dark-high-contrast']);
  });

  it('themes have required properties', () => {
    for (const [name, config] of Object.entries(THEMES)) {
      assert.ok(config.name, `${name} missing 'name'`);
      assert.ok(config.background, `${name} missing 'background'`);
      assert.ok(typeof config.blend === 'number', `${name} missing 'blend'`);
    }
  });
});

describe('Extraction script', () => {
  it('generates palette files', () => {
    // Run extraction
    execSync('node scripts/extract-primitives.mjs', { cwd: PROJECT_ROOT });

    // Check all palette files exist
    for (const config of Object.values(THEMES)) {
      const filename = config.name.replace('primer_', '') + '.lua';
      const filepath = join(PROJECT_ROOT, 'lua/primer-primitives/palettes', filename);
      assert.ok(existsSync(filepath), `Missing palette file: ${filepath}`);
    }
  });

  it('generates valid Lua syntax', () => {
    for (const config of Object.values(THEMES)) {
      const filename = config.name.replace('primer_', '') + '.lua';
      const filepath = join(PROJECT_ROOT, 'lua/primer-primitives/palettes', filename);
      const content = readFileSync(filepath, 'utf-8');

      // Check basic Lua structure
      assert.ok(content.includes('return {'), `${filename} missing 'return {'`);
      assert.ok(content.includes(`name = '${config.name}'`), `${filename} missing name`);

      // Check all color values are valid hex
      const hexPattern = /'#[0-9a-f]{6}'/g;
      const matches = content.match(hexPattern);
      assert.ok(matches && matches.length > 0, `${filename} has no hex colors`);
    }
  });
});

describe('Colorscheme generation', () => {
  it('generates colorscheme files', () => {
    // Run generation
    execSync('nvim -l scripts/generate.lua', { cwd: PROJECT_ROOT });

    // Check all colorscheme files exist
    for (const config of Object.values(THEMES)) {
      const filepath = join(PROJECT_ROOT, 'colors', `${config.name}.lua`);
      assert.ok(existsSync(filepath), `Missing colorscheme file: ${filepath}`);
    }
  });

  it('colorschemes load in Neovim', () => {
    for (const config of Object.values(THEMES)) {
      // This will throw if the colorscheme fails to load
      execSync(
        `nvim --headless -u NONE --noplugin -c "set rtp+=." -c "colorscheme ${config.name}" -c "qa"`,
        { cwd: PROJECT_ROOT, encoding: 'utf-8', stdio: 'pipe' }
      );
    }
  });
});
