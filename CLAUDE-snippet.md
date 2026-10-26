# Using the builtbyjosef standard in Claude Code

Pick one or more. Method A is the one that works in cloud sessions.

## A. Every repo (recommended)

Run this in the project root, in the VS Code terminal or an Ubuntu/WSL terminal (anything with bash and git):

    curl -fsSL https://raw.githubusercontent.com/16JoeTheCoder/builtbyjosef-designsystem/v1/scripts/install.sh | bash

It copies the system into `design/builtbyjosef/`, copies the check script into `scripts/`, and writes the standard into `CLAUDE.md` between two markers. Re-run it any time to update; it replaces only its own block. Commit `design/`, `scripts/` and `CLAUDE.md`. Or just tell a Claude Code session: "Run the builtbyjosef installer."

## B. Every local session

Append the contents of `CLAUDE-snippet.block.md` to your user-level CLAUDE.md (`%USERPROFILE%\.claude\CLAUDE.md` on Windows, `~/.claude/CLAUDE.md` in Ubuntu/WSL). The block tells any session to clone the repo itself when the local folder is missing. This does not reach cloud sessions, which do not read your computer's home folder.

## C. As a plugin

Add this to a project's `.claude/settings.json`. The skill then loads whenever visual work starts.

    {
      "extraKnownMarketplaces": {
        "builtbyjosef": { "source": { "source": "github", "repo": "16JoeTheCoder/builtbyjosef-designsystem" } }
      },
      "enabledPlugins": { "builtbyjosef-design@builtbyjosef": true }
    }

## Claude.ai projects

Paste the contents of `CLAUDE-snippet.block.md` into the project instructions and attach `DESIGN.md`.
