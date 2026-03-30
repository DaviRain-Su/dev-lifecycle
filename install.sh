#!/usr/bin/env bash
# Dev Lifecycle — Install agent convention files into your project
#
# Usage:
#   cd your-project
#   bash /path/to/dev-lifecycle/install.sh
#
# Or with submodule:
#   bash docs/methodology/install.sh
#
# This creates convention files for ALL known Code Agents,
# all pointing to docs/methodology/README.md

set -euo pipefail

METHODOLOGY_PATH="docs/methodology/README.md"
TEMPLATES_PATH="docs/methodology/templates/"

echo "📦 Installing dev-lifecycle convention files..."
echo ""

# --- AGENTS.md (Codex, OpenCode, Amp, generic) ---
cat > AGENTS.md << 'AGENTSEOF'
# Agent Instructions

> Read by: OpenAI Codex, OpenCode, Amp (Sourcegraph), and other AGENTS.md-compatible tools.

## Mandatory Development Lifecycle

This project enforces a strict **7-phase development lifecycle**.
No phase may be skipped. No code without a Technical Spec.

**Full specification:** [docs/methodology/README.md](docs/methodology/README.md)
**Templates:** `docs/methodology/templates/`

### The 7 Phases

```
1. PRD → 2. Architecture → 3. Technical Spec → 4. Task Breakdown
→ 5. Test Spec → 6. Implementation → 7. Review & Deploy
```

### Key Rules

1. No code without a Technical Spec (Phase 3). Create it first.
2. No implementation without tests (Phase 5). Write test skeletons before code.
3. Code must match the Technical Spec exactly. Spec wrong? Fix spec first.
4. All phase docs go in `<project>/docs/01-prd.md` through `07-review-report.md`.
AGENTSEOF
echo "  ✅ AGENTS.md"

# --- CLAUDE.md (Claude Code) ---
cat > CLAUDE.md << 'CLAUDEEOF'
# Claude Code Instructions

## ⚠️ Mandatory: Read Before Any Work

This project enforces a strict 7-phase development lifecycle.
**You MUST follow it. No exceptions.**

→ Read: [docs/methodology/README.md](docs/methodology/README.md)
→ Templates: `docs/methodology/templates/`

### The Rule

If someone asks you to write code and there is no Technical Spec (Phase 3):
1. Stop.
2. Check if Phase 1-2 docs exist. If not, create them.
3. Create the Technical Spec (Phase 3).
4. Create the Test Spec (Phase 5).
5. Only THEN write implementation code.

### 7 Phases

PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review & Deploy
CLAUDEEOF
echo "  ✅ CLAUDE.md"

# --- GEMINI.md (Gemini CLI, Droid, Google AI Studio) ---
cat > GEMINI.md << 'GEMINIEOF'
# Gemini Instructions

This project enforces a strict 7-phase development lifecycle.
Read: docs/methodology/README.md

Phases: PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review & Deploy

Rules:
- No code without a Technical Spec (Phase 3). Create it first.
- No implementation without tests (Phase 5). Write test skeletons before code.
- Code must match the Technical Spec exactly. Spec wrong? Fix spec first.
- Templates are in docs/methodology/templates/
GEMINIEOF
echo "  ✅ GEMINI.md"

# --- CONVENTIONS.md (Aider and general convention) ---
cat > CONVENTIONS.md << 'CONVEOF'
# Project Conventions

## Development Lifecycle

This project uses a mandatory 7-phase development lifecycle.
Full specification: docs/methodology/README.md

Phases: PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review & Deploy

Rules:
- No code without a Technical Spec (Phase 3)
- No implementation without tests (Phase 5)
- Code must match the Technical Spec exactly
- Templates: docs/methodology/templates/
CONVEOF
echo "  ✅ CONVENTIONS.md"

# --- .cursor/rules (Cursor) ---
mkdir -p .cursor
cat > .cursor/rules << 'CURSOREOF'
This project enforces a strict 7-phase development lifecycle.
Read: docs/methodology/README.md
Templates: docs/methodology/templates/

Phases: PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review & Deploy

Rules:
- No code without a Technical Spec (Phase 3)
- No implementation without tests (Phase 5)
- Code must match the Technical Spec exactly
- Spec wrong? Fix spec first, then fix code
CURSOREOF
echo "  ✅ .cursor/rules"

# --- .clinerules (Cline / VS Code) ---
cat > .clinerules << 'CLINEEOF'
This project enforces a strict 7-phase development lifecycle.
Read: docs/methodology/README.md
Templates: docs/methodology/templates/

Phases: PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review & Deploy

Rules:
- No code without a Technical Spec (Phase 3)
- No implementation without tests (Phase 5)
- Code must match the Technical Spec exactly
CLINEEOF
echo "  ✅ .clinerules"

# --- .windsurfrules (Windsurf / Codeium) ---
cat > .windsurfrules << 'WINDEOF'
This project enforces a strict 7-phase development lifecycle.
Read: docs/methodology/README.md
Templates: docs/methodology/templates/

Phases: PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review & Deploy

Rules:
- No code without a Technical Spec (Phase 3)
- No implementation without tests (Phase 5)
- Code must match the Technical Spec exactly
WINDEOF
echo "  ✅ .windsurfrules"

# --- .github/copilot-instructions.md (GitHub Copilot) ---
mkdir -p .github
cat > .github/copilot-instructions.md << 'COPILOTEOF'
# GitHub Copilot Instructions

This project enforces a strict 7-phase development lifecycle.
Read: docs/methodology/README.md
Templates: docs/methodology/templates/

Phases: PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review & Deploy

Rules:
- No code without a Technical Spec (Phase 3)
- No implementation without tests (Phase 5)
- Code must match the Technical Spec exactly
COPILOTEOF
echo "  ✅ .github/copilot-instructions.md"

echo ""
echo "✅ Done! Convention files installed for:"
echo "   Claude Code, Codex, Cursor, Gemini CLI, Droid,"
echo "   Aider, Cline, Windsurf, GitHub Copilot, OpenCode, Amp"
echo ""
echo "⚠️  Make sure docs/methodology/ exists (git submodule or copy):"
echo "   git submodule add <dev-lifecycle-repo-url> docs/methodology"
