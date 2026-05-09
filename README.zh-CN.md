# Personal API

> 把你的 Obsidian vault 变成 AI 可以读取的“个人身份层”。任何 AI 助手只要先读 `ME.md` 和 `AGENT.md`，就能快速理解你是谁、你怎么思考、你希望它怎么和你协作。

[![version](https://img.shields.io/badge/version-2.0.0-blue)](./SKILL.md)
[![license](https://img.shields.io/badge/license-MIT-green)](./LICENSE)
[![category](https://img.shields.io/badge/category-identity-purple)](#)
[![platform](https://img.shields.io/badge/platform-macOS%20%7C%20Linux%20%7C%20WSL-lightgrey)](#)

---

## 这个 Skill 解决什么问题

每换一个 AI 工具、每开一个新会话、每进入一个新项目，你都要重复解释：

- 你是谁、你现在在做什么
- 你的技术栈和工作方式
- 你喜欢怎样的回答风格
- 哪些内容 AI 可以改，哪些内容必须只读
- 你的知识库应该怎样被整理

`personal-api` 的思路是：**把“你自己”写成一套 AI 可读的接口文档。**

它会在 Obsidian vault 中建立两个核心文件：

| 文件 | 作用 |
|---|---|
| `ME.md` | 你的身份说明书。AI 先读它，就知道你是谁、你的背景、目标、偏好和原则。 |
| `AGENT.md` | AI 行为规范。定义语言风格、输出格式、工具使用方式、边界和协作规则。 |

这样 AI 不需要每次从零理解你，而是可以从一份稳定、可维护、可版本化的个人上下文开始工作。

---

## 适合谁使用

这个 Skill 适合：

- 使用 Obsidian 做长期知识管理的人
- 经常使用 Claude Code、Codex、Cursor、ChatGPT、Gemini 等 AI 工具的人
- 想让不同 AI 工具保持同一套个人上下文和协作风格的人
- 想搭建“第二大脑”或“个人知识系统”的人
- 希望 AI 能更像长期协作者，而不是每次都重新认识你的用户

---

## 你会得到什么

运行安装脚本后，它会帮你生成一套 Knowledge Palace v2 结构：

```text
your-vault/
├── ME.md
├── AGENT.md
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
| 身份档案轨道 | `ME.md`、`00.context/`、`10.identity/`、`20.skills/` 等 | 默认只读，AI 可以建议但不应随意改写 |
| 知识生产轨道 | `30.knowledge/` 下的资料、笔记、研究、输出 | AI 可以辅助整理、编译、归档，但需要用户复核 |

---

## 快速开始

```bash
# 1. 指定你的 Obsidian vault 路径
export OBSIDIAN_VAULT_PATH="/path/to/your/vault"

# 2. 运行安装脚本
bash scripts/setup.sh

# 3. 打开 Obsidian，填写 ME.md 和 AGENT.md 里的占位内容
```

如果只想生成最小身份层，不创建完整 `30.knowledge/` 结构，可以运行：

```bash
bash scripts/setup.sh --minimal
```

---

## 标准使用方式

安装完成后，你可以对任何 AI 助手说：

> 先读取我的 `ME.md` 和 `AGENT.md`，理解我的背景、偏好和协作规则，然后再继续处理任务。

如果 AI 需要更深入的上下文，再让它按顺序读取：

1. `ME.md`
2. `AGENT.md`
3. `00.context/now.md`
4. `50.maps/index.md`
5. `30.knowledge/00.system/methodology.md`

---

## 方法论来源

`personal-api` 不是简单的两个 Markdown 模板，而是把几套成熟知识管理方法组合成一个 AI 可执行的 vault 结构：

| 方法 | 在本系统中的作用 |
|---|---|
| PARA | 按信息生命周期组织目录 |
| Johnny.Decimal | 用编号保持目录位置稳定 |
| Zettelkasten | 沉淀原子化永久笔记 |
| MOC / LYT | 用索引页管理主题关系 |
| LLM Wiki | 区分原始资料和编译后知识 |
| Memory Palace | 用空间隐喻降低查找成本 |

一句话总结：

> 文件夹负责生命周期，MOC 负责主题归属，双链负责知识关系。

---

## 隐私提醒

这个 Skill 发布的只是模板和安装脚本，不包含你的真实个人数据。

但你填写后的 `ME.md` 和 `AGENT.md` 会包含大量个人上下文。请注意：

- 不要把填写后的真实 `ME.md` / `AGENT.md` 提交到公开仓库
- 如果你的 Obsidian vault 使用 Git 管理，请把真实个人文件加入 `.gitignore`
- AI 可以读取身份档案，但不应在未经明确授权时改写核心身份内容

---

## 项目文件

| 文件 | 说明 |
|---|---|
| `SKILL.md` | Skill 主说明与元数据 |
| `scripts/setup.sh` | 安装脚本 |
| `templates/ME.md` | 身份模板 |
| `templates/AGENT.md` | AI 行为规范模板 |
| `templates/methodology.md` | 知识管理操作手册 |

---

## 开源协议

MIT License。

项目作者：[@beiyuii](https://github.com/beiyuii)
