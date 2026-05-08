# Personal API

> **Turn your Obsidian vault into an AI identity layer.** Any AI agent reads `ME.md` + `AGENT.md` and instantly knows who you are, how you think, and how to work with you — built on Knowledge Palace v2 (PARA + Johnny.Decimal + Zettelkasten + MOC + LLM Wiki + Memory Palace).

[![version](https://img.shields.io/badge/version-2.0.0-blue)](./SKILL.md)
[![license](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
[![category](https://img.shields.io/badge/category-identity-purple)](#)
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey)](#)
[![agents](https://img.shields.io/badge/agents-Claude%20%7C%20Codex%20%7C%20Cursor%20%7C%20ChatGPT%20%7C%20Gemini-orange)](#)

---

## Why

Every new chat, every new project, every new AI tool — you start from zero. You re-explain your tech stack, your communication style, your preferences. Personal API ends that loop:

- **`ME.md`** — your single-page identity contract
- **`AGENT.md`** — your behavior contract
- **A vault navigation layer** — for when AI needs depth

Read `ME.md` once → AI is calibrated for the entire session.

> **Agent-agnostic by design.** This is a folder convention plus two markdown contracts. It doesn't depend on any specific AI runtime — Claude Code, Codex, Cursor, ChatGPT, Gemini, or your custom agent all read the same files the same way.

---

## Quick Start

```bash
# 1. Set your vault path
export OBSIDIAN_VAULT_PATH="/path/to/your/vault"

# 2. Run the scaffolder (full Knowledge Palace v2 structure)
bash scripts/setup.sh

# 3. Open your vault and fill in the [PLACEHOLDER]s
```

Want a lighter footprint? Use `bash scripts/setup.sh --minimal` — only creates the identity layer, skips the `30.knowledge/` tree.

---

## What You Get

| File | Role |
|---|---|
| `templates/ME.md` | Identity contract — your "About Me" page for AI |
| `templates/AGENT.md` | Behavior contract — language, tone, output format, tool rules |
| `templates/methodology.md` | Knowledge management operating manual (placed at `30.knowledge/00.system/`) |
| `scripts/setup.sh` | One-command vault scaffolder (full or `--minimal`) |
| `SKILL.md` | Skill manifest with metadata, examples, use cases |

---

## Architecture

### 1. Vault overall structure (dual-track)

`ME.md` is the entry point. The vault splits into two tracks: **Track A — Identity Archive** (human-curated, read-only for AI) and **Track B — Knowledge Production** (AI-led with human review).

```mermaid
flowchart TB
    Root["🎯 ME.md<br/>核心身份入口 · Layer 0"]
    Ctx["⚡ 00.context<br/>now.md / open-questions / projects<br/>当前状态"]

    Root --> Ctx

    subgraph TrackA["🔵 Track A — 身份档案馆 (Human-curated)"]
        direction TB
        Identity["10.identity<br/>价值观 · 愿景 · 思维模型 · 优势短板"]
        Skills["20.skills<br/>能力图谱"]
        Memory["40.memory-stream<br/>日记 · 周报 · 反思 · 里程碑"]
        Maps["50.maps<br/>全局导航 · 技能图 · 主题 MOC"]
    end

    subgraph TrackB["💖 Track B — 知识生产区 (AI-led)"]
        direction TB
        K00["00.system — 中控室"]
        K10["10.capture — 收件台"]
        K20["20.intelligence — 情报室"]
        K30["30.research — 研究室"]
        K40["40.notes — 卡片柜"]
        K50["50.frameworks — 工具墙"]
        K60["60.projects — 项目室"]
        K70["70.outputs — 发布厅"]
        K90["90.archive — 档案库"]
    end

    Ctx --> TrackA
    Ctx --> TrackB

    classDef root fill:#dbeafe,stroke:#2563eb,stroke-width:2px,color:#000
    classDef ctx fill:#dcfce7,stroke:#16a34a,color:#000
    class Root root
    class Ctx ctx
```

> **The contract:** Identity is yours (Track A is read-only for AI). Knowledge production scales with AI (Track B is fair game for AI to compile, link, archive).

### 2. Knowledge Palace v2 — knowledge flow

The Knowledge Production track is a lifecycle pipeline. Material flows in from the left, gets routed through rooms based on its current life stage, and exits as an output or archive.

```mermaid
flowchart TB
    Input["📥 输入源<br/>文章 · 论文 · 闪念 · 灵感<br/>读书笔记 · 行业新闻"]

    subgraph Methods["🧱 融合方法论"]
        Mtxt["PARA · Johnny.Decimal · Zettelkasten<br/>MOC/LYT · Karpathy LLM Wiki · Memory Palace"]
    end

    Sys["🏛️ 00.system — 中控室<br/>方法论 · 目录边界 · Agent 操作指南"]

    subgraph Row1["第一层 · 入口与情报"]
        direction LR
        Cap["📥 10.capture<br/>收件台<br/>inbox · raw · 摘录"]
        Intel["📡 20.intelligence<br/>情报室<br/>AI 日报 · 趋势 · 信号"]
    end

    subgraph Row2["第二层 · 加工与沉淀"]
        direction LR
        Res["🔬 30.research<br/>研究室<br/>PKM · AI Agent · OPC"]
        Notes["🗃️ 40.notes ⭐<br/>卡片柜（核心资产）<br/>literature · permanent · MOC"]
        Frame["🔧 50.frameworks<br/>工具墙<br/>SOP · 技术框架 · 思维模型"]
    end

    subgraph Row3["第三层 · 项目与产出"]
        direction LR
        Proj["📁 60.projects<br/>项目室<br/>项目复盘 · 决策日志"]
        Out["📢 70.outputs<br/>发布厅<br/>脚本 · 文章 · 演讲稿"]
        Arch["🗄️ 90.archive<br/>档案库<br/>冻结资料 · 仅供追溯"]
    end

    Methods -.规范.-> Sys
    Sys -.规则.-> Row1
    Sys -.规则.-> Row2
    Sys -.规则.-> Row3

    Input --> Cap
    Cap --> Intel
    Cap --> Res
    Intel --> Notes
    Res --> Notes
    Notes --> Frame
    Notes --> Proj
    Frame --> Proj
    Proj --> Out
    Out --> Arch

    classDef input fill:#dcfce7,stroke:#16a34a,color:#000
    classDef sys fill:#e0e7ff,stroke:#6366f1,color:#000
    classDef methods fill:#fef3c7,stroke:#d97706,color:#000
    class Input input
    class Sys sys
    class Methods,Mtxt methods
```

> **Core formula:** Folders solve **lifecycle**. MOCs solve **topic membership**. Wikilinks solve **relationships**.
>
> Lifecycle: `capture → intelligence/research → notes → frameworks/projects → outputs → archive`

---

## Use Cases

- **New project onboarding** — drop AI into a fresh repo, it reads `ME.md` and matches your style immediately
- **Cross-tool consistency** — Claude Code, Codex, Cursor, ChatGPT, Gemini all use the same identity contract
- **Persistent context** — stop re-explaining your preferences every session
- **Identity-grounded outputs** — AI writes/decides in your voice, not generic boilerplate
- **Knowledge-grounded decisions** — AI references your accumulated notes instead of hallucinating

---

## Methodology

Personal API is the entry point to a knowledge architecture that fuses six well-established methodologies:

| Method | Contribution |
|---|---|
| PARA (Tiago Forte) | Lifecycle-based directory layout |
| Johnny.Decimal | Numbered prefixes for stable locations |
| Zettelkasten (Luhmann) | Atomic permanent notes |
| MOC / LYT (Nick Milo) | Semantic maps over deep folders |
| LLM Wiki (Karpathy) | Strict raw vs compiled separation |
| Memory Palace | Spatial metaphor for low-cost lookup |

See [`SKILL.md`](./SKILL.md) for the full architecture, AI operation boundaries, frontmatter spec, FAQ, and maintenance routines.

---

## Agent Compatibility

Tested with:

- **Claude Code** — auto-loads `CLAUDE.md` at vault root for hard rules
- **Codex / OpenAI Agents** — auto-loads `AGENTS.md` at vault root
- **Cursor** — point its rules at `ME.md` + `AGENT.md`
- **ChatGPT / Gemini / Custom LLM** — paste the standard prompt: `"Read ME.md and AGENT.md to understand my context."`

The protocol is just markdown. Any agent that can read files can use this skill.

---

## Privacy

Your filled-in `ME.md` and `AGENT.md` contain personal context. **Do not commit them to public repositories.** A `.gitignore` is included to help. This skill ships only templates — never your data.

---

## Related

- `personal-knowledge-vault` — cross-project entry skill that pulls context from this vault
- `knowledge-palace-builder` — full step-by-step vault construction guide

---

## Credits

Designed and battle-tested daily by [@beiyuii](https://github.com/beiyuii).
Methodology synthesizes work from Tiago Forte, Niklas Luhmann, Nick Milo, Andrej Karpathy, and Johnny Decimal.

License: MIT.
