# Personal API

> 把你的 Obsidian vault 变成 AI 可以读取的“个人身份层”。任何 AI 助手只要先读 `ME.md` 和 `AGENT.md`，就能理解你是谁、你怎么思考、你希望它怎么协作。

[![version](https://img.shields.io/badge/version-2.0.3-blue)](./SKILL.md)
[![license](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
[![category](https://img.shields.io/badge/category-identity-purple)](#)
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey)](#)

---

## 这个 Skill 解决什么问题

每换一个 AI 工具、每开一个新会话、每进入一个新项目，你都要重复解释：

- 你是谁、现在在做什么；
- 你的技术栈和工作方式；
- 你喜欢怎样的回答风格；
- 哪些内容 AI 可以改，哪些必须只读；
- 你的知识库应该怎样被整理。

`personal-api` 的思路是：**把“你自己”和“你的知识系统”写成一套 AI 可读的接口文档。**

核心文件：

| 文件 | 作用 |
|---|---|
| `ME.md` | 身份说明书，AI 先读它来理解你是谁 |
| `AGENT.md` | 行为规范，定义语言风格、输出格式、工具规则和协作边界 |
| `CLAUDE.md` | Claude Code 薄适配器 |
| `AGENTS.md` | Codex / OpenAI Agents 薄适配器 |
| `30.knowledge/00.system/methodology.md` | Knowledge Palace v2 知识生产操作手册 |

---

## 快速开始

默认安装完整 Knowledge Palace v2 结构，包括 `30.knowledge/`：

```bash
export OBSIDIAN_VAULT_PATH="/path/to/your/vault"
bash scripts/setup.sh
```

如果只想生成轻量身份层，不创建 `30.knowledge/`：

```bash
bash scripts/setup.sh --minimal
```

`--minimal` 只创建身份层、薄适配器和基础导航，不代表产品主路径。

---

## 你会得到什么

full 模式会生成：

```text
your-vault/
├── ME.md
├── AGENT.md
├── CLAUDE.md
├── AGENTS.md
├── .gitignore
├── 00.context/
├── 10.identity/
├── 20.skills/
├── 30.knowledge/
│   ├── 00.system/
│   ├── 10.capture/
│   ├── 20.intelligence/
│   ├── 30.research/
│   ├── 40.notes/
│   ├── 50.frameworks/
│   ├── 60.projects/
│   ├── 70.outputs/
│   └── 90.archive/
├── 40.memory-stream/
└── 50.maps/
```

核心思想是“双轨设计”：

| 轨道 | 内容 | AI 权限 |
|---|---|---|
| 身份档案轨道 | `ME.md`、`AGENT.md`、`00.context/`、`10.identity/` 等 | 默认只读，AI 可以建议但不应随意改写 |
| 知识生产轨道 | `30.knowledge/` 下的资料、笔记、研究、输出 | AI 可以辅助整理、编译、归档，但需要用户复核 |

---

## 标准使用方式

安装完成后，你可以对任何 AI 助手说：

> 先读取我的 `ME.md` 和 `AGENT.md`，理解我的背景、偏好和协作规则，然后再继续处理任务。

如果 AI 要处理 `30.knowledge/`，应先读取：

```text
30.knowledge/00.system/methodology.md
```

---

## 项目文件

| 文件 | 说明 |
|---|---|
| `SKILL.md` | 轻量路由入口 |
| `references/` | 架构、目录、边界和维护说明 |
| `scripts/setup.sh` | 安装脚本 |
| `scripts/validate_skill.py` | 工程校验脚本 |
| `scripts/package_skillhub.sh` | SkillHub 打包脚本 |
| `templates/` | vault 内生成文件模板 |
| `agents/openai.yaml` | SkillHub/OpenAI 展示元数据 |

---

## 验证与发布

```bash
bash -n scripts/setup.sh
python scripts/validate_skill.py
bash scripts/package_skillhub.sh
python scripts/validate_skill.py --dist dist/skillhub/personal-api-2.0.3-skillhub.zip
```

---

## 隐私提醒

这个 Skill 发布的是模板和安装脚本，不包含你的真实个人数据。填写后的 `ME.md` 和 `AGENT.md` 会包含个人上下文，默认不要提交到公开仓库。

项目作者：[@beiyuii](https://github.com/beiyuii)

MIT License。
