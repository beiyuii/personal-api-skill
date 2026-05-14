# Operation Boundaries

Personal API separates what AI may actively manage from what should remain human-owned.

## Permission Matrix

| Action | Default |
|---|---|
| Read markdown files in the vault | Allowed |
| Create files under `30.knowledge/` | Allowed |
| Reorganize `30.knowledge/` content | Allowed with methodology rules |
| Update `50.maps/index.md` links | Allowed carefully |
| Update `00.context/now.md` with factual current-state changes | Allowed carefully |
| Modify `ME.md` core identity | Not allowed without explicit authorization |
| Modify `AGENT.md` behavior rules | Ask first unless the user explicitly requests it |
| Modify `10.identity/` values, vision, or deep identity files | Not allowed without explicit authorization |
| Bulk delete or destructive reorganize files | Requires explicit confirmation |
| Fill in the user's real identity placeholders | Not allowed; ask the user |

## Adapter Files

`CLAUDE.md` and `AGENTS.md` are thin adapter files. They should point agents to `ME.md`, `AGENT.md`, and this operating model rather than duplicating full rules.

This prevents rule drift across tools.

## Privacy

Filled-in `ME.md` and `AGENT.md` may contain sensitive personal context. Public repos should not include real personal vault output.

The setup script installs a vault `.gitignore` when one does not already exist. If a vault already has a `.gitignore`, the script preserves it.
