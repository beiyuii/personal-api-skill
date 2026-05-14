# Vault Layout

This is the expected full-mode scaffold created by `scripts/setup.sh`.

```text
your-vault/
├── ME.md
├── AGENT.md
├── CLAUDE.md
├── AGENTS.md
├── .gitignore
├── 00.context/
│   ├── now.md
│   ├── open-questions.md
│   └── projects/
│       ├── project-overview.md
│       ├── active/
│       └── archived/
├── 10.identity/
│   ├── values.md
│   ├── vision.md
│   ├── thinking-models.md
│   └── strengths-gaps.md
├── 20.skills/
├── 30.knowledge/
│   ├── 00.system/
│   │   └── methodology.md
│   ├── 10.capture/
│   │   ├── inbox/
│   │   └── raw/
│   ├── 20.intelligence/
│   │   ├── ai/
│   │   └── business/
│   ├── 30.research/
│   ├── 40.notes/
│   │   ├── literature/
│   │   ├── permanent/
│   │   └── moc/
│   ├── 50.frameworks/
│   │   ├── technical/
│   │   └── operation/
│   ├── 60.projects/
│   ├── 70.outputs/
│   └── 90.archive/
├── 40.memory-stream/
│   ├── daily/
│   ├── reflections/
│   └── milestones.md
└── 50.maps/
    ├── index.md
    └── skills-map.md
```

## Full vs Minimal

Full mode is the default:

```bash
bash scripts/setup.sh
```

Full mode creates both Track A and Track B, including the full `30.knowledge/` structure.

Minimal mode:

```bash
bash scripts/setup.sh --minimal
```

Minimal mode creates only the identity layer, thin agent adapters, and basic navigation files. It must not create `30.knowledge/`.

## Knowledge Flow

```text
capture -> intelligence/research -> literature notes -> permanent notes/frameworks -> projects/outputs -> archive
```

Raw material should enter `30.knowledge/10.capture/` first. Do not skip directly from raw input to permanent notes.
