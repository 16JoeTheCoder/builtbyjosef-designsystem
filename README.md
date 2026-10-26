<picture>
  <source media="(prefers-color-scheme: dark)" srcset="logos/tab-lockup-dark.svg">
  <img src="logos/tab-lockup-light.svg" alt="builtbyjosef" height="64">
</picture>

**Cool head. Hot point.**

Built to a standard. Built to move.

## What this is

The single source of truth for how everything Josef Yang makes looks, moves and sounds: tokens, components, an ignition layer for motion, logos, fonts, a design lint and a Claude Code plugin. Plain CSS, one small JS file, two shell scripts. No build step. The full standard is [DESIGN.md](DESIGN.md); the visual proof is [examples/index.html](examples/index.html).

## Wire it into a project

**A. Every repo (recommended, works in cloud sessions).** In the project root, in the VS Code terminal or an Ubuntu/WSL terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/16JoeTheCoder/builtbyjosef-designsystem/v1/scripts/install.sh | bash
```

It copies the system into `design/builtbyjosef/`, copies the check script into `scripts/`, and writes the standard into `CLAUDE.md` between two markers. Re-run it to update; it replaces only its own block. Commit `design/`, `scripts/` and `CLAUDE.md`.

**B. Every local session.** Append `CLAUDE-snippet.block.md` to your user-level CLAUDE.md (`%USERPROFILE%\.claude\CLAUDE.md` on Windows, `~/.claude/CLAUDE.md` in Ubuntu/WSL). Sessions clone this repo themselves when the local folder is missing. Does not reach cloud sessions.

**C. As a plugin.** Add to a project's `.claude/settings.json`:

```json
{
  "extraKnownMarketplaces": {
    "builtbyjosef": { "source": { "source": "github", "repo": "16JoeTheCoder/builtbyjosef-designsystem" } }
  },
  "enabledPlugins": { "builtbyjosef-design@builtbyjosef": true }
}
```

For Claude.ai projects, paste `CLAUDE-snippet.block.md` into the project instructions and attach `DESIGN.md`. Details in [CLAUDE-snippet.md](CLAUDE-snippet.md).

## What is in the repo

- `DESIGN.md`: the standard (aura, heat doctrine, colour, type, motion, recipes, decision log).
- `index.css`: imports the three stylesheets below; import this one.
- `tokens.css`, `tokens.json`: colour, type, space and motion tokens, light and dark.
- `bundle.css`: components (`jy-btn`, `jy-panel`, `jy-field`, `jy-badge`, `jy-stat`, `jy-code`, `jy-table`, `jy-chart`).
- `ignite.css`: the ignition layer (hero, burn bar, flare, stage, Stair, fuse rule, heat legend, pulse, live dot, reveal).
- `jy.js`: scroll reveal, counter roll, theme toggle. No dependencies.
- `builtbyjosef.mplstyle`: matplotlib style.
- `fonts/`: Space Grotesk and JetBrains Mono (woff2) with their OFL texts.
- `logos/`: the Tab in 11 SVG variants plus `tab-variations.pdf`.
- `examples/index.html`: the visual proof of the system, both themes.
- `scripts/install.sh`: the project installer. `scripts/jy-check.sh`: the design lint.
- `skills/`, `.claude-plugin/`: the Claude Code plugin and its marketplace entry.
- `CLAUDE-snippet.block.md`, `CLAUDE-snippet.md`: the always-loaded block and how to use it.

## Updating

Edit, bump the version in `.claude-plugin/plugin.json` and the `DESIGN.md` title, commit, tag `vX.Y.Z`, then move the floating major tag (`git tag -f v1` and `git push --force origin v1`, the only force-push this repo sees). Projects re-run the installer to pick it up.

## Notes

- Japanese copy: `--font-sans` falls back to Zen Kaku Gothic New, which is not shipped. Load it from Google Fonts where Japanese text appears.
- Matplotlib cannot read woff2. Install Space Grotesk as a static TTF/OTF (for example from Google Fonts) for `builtbyjosef.mplstyle`; avoid the variable TTF, which renders bold unreliably in matplotlib.

## Licence

Code (CSS, JS, scripts, tokens) is MIT. Fonts are SIL OFL 1.1, unchanged. Logos, the builtbyjosef name and the JY monogram are all rights reserved. See [LICENSE.md](LICENSE.md).
