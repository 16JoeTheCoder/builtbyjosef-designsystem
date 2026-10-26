---
name: builtbyjosef-design
description: Apply the builtbyjosef design standard (Tab logo, ink/paper/orange, Space Grotesk, cool head hot point) to any UI, site, app, dashboard, document, slide, chart, study sheet, README or artifact. Use before writing or restyling any visual output, unless another brand is named.
---

# builtbyjosef design standard

Before you write any visual output:

1. Read `DESIGN.md` at the repository or plugin root (two folders up from this file). It is short enough to read in full. The aura is "cool head, hot point": calm ink and paper everywhere, one exact orange point, fast motion that settles.
2. In a project, make sure `design/builtbyjosef/` exists. If not, run the installer from the repo's `scripts/install.sh`, or copy `tokens.css bundle.css ignite.css index.css jy.js fonts logos` there, and import `design/builtbyjosef/index.css`.
3. Use `var(--token)` for every colour, space, radius, duration and easing. Never raw hex.
4. Choose the surface recipe in DESIGN.md that matches the output (landing page, app, slides, document, study sheet, chart, README, social image).
5. Spend orange by the heat doctrine: one spark per view, ember where it carries meaning, at most one flare per page.
6. Carry the signature (`logos/tab-small.svg` or a lockup).
7. Finish by running `bash scripts/jy-check.sh` and fix every `x`. Look at both light and dark.
