# Dev Lifecycle — AI 时代的结构化开发方法论

> **7 个阶段，从需求到部署。不可跳过。**
> **适用于任何 Code Agent（pi、Claude Code、Codex、Cursor）和人类开发者。**

---

## 为什么需要这个

AI 写代码很快。但如果规格模糊，AI 会按自己的理解写——结果就是返工。

```
没有规格的 AI 开发:
  "帮我写个合约" → AI 自己决定数据结构 → 自己决定错误码 → 自己决定接口
  → 换个 AI 或换个人继续开发 → 全部不一致 → 返工

有规格的 AI 开发:
  技术规格定义了每个字段、每个接口、每个错误码
  → 任何 AI 或人拿到规格都写出一样的代码
  → 零返工
```

**规格越精确，AI 输出越准确。** 这套方法论的核心就是：在写代码之前，把该定义的全定义清楚。

---

## 7 个阶段

```
Phase 1: PRD（需求定义）          → 定义「做什么」和「不做什么」
Phase 2: Architecture（架构设计） → 定义「怎么组织」
Phase 3: Technical Spec（技术规格）→ 定义「每个字节怎么做」  ← 最关键
Phase 4: Task Breakdown（任务拆解）→ 拆成 ≤4h 的可执行任务
Phase 5: Test Spec（测试规格）     → TDD：先定义「什么是对的」
Phase 6: Implementation（实现）    → 写代码，让测试通过
Phase 7: Review & Deploy（审查）   → 确认质量，部署上线
```

每个阶段有**明确的输入、输出和验收标准**。当前阶段验收通过后，才能进入下一阶段。

---

## 快速开始

### 方法 1：直接复制模板

```bash
# 在你的项目中创建 docs/ 目录
mkdir -p your-project/docs

# 复制需要的模板
cp templates/01-prd.md your-project/docs/01-prd.md
# 按顺序填写...
```

### 方法 2：Git Submodule（推荐）

```bash
cd your-project
git submodule add https://github.com/YOUR_ORG/dev-lifecycle.git docs/methodology
```

然后在项目的 `AGENTS.md` 中引用：

```markdown
## Mandatory Development Lifecycle
→ Read: docs/methodology/README.md
```

### 方法 3：直接引用（最轻量）

在项目的 `AGENTS.md` / `CLAUDE.md` / `.cursor/rules` 中写：

```
This project follows the dev-lifecycle methodology.
Full spec: https://github.com/YOUR_ORG/dev-lifecycle
Templates: https://github.com/YOUR_ORG/dev-lifecycle/tree/main/templates
```

---

## 模板清单

| Phase | 模板 | 说明 |
|-------|------|------|
| 1 | [templates/01-prd.md](templates/01-prd.md) | 需求定义：问题、用户故事、范围、成功标准 |
| 2 | [templates/02-architecture.md](templates/02-architecture.md) | 架构设计：组件、数据流、依赖、状态管理 |
| 3 | [templates/03-technical-spec.md](templates/03-technical-spec.md) | **技术规格：数据结构(字节级)、接口、错误码、状态机** |
| 4 | [templates/04-task-breakdown.md](templates/04-task-breakdown.md) | 任务拆解：≤4h 任务列表、依赖图、里程碑 |
| 5 | [templates/05-test-spec.md](templates/05-test-spec.md) | 测试规格：Happy/Boundary/Error 用例、TDD 骨架 |
| 6 | [templates/06-implementation.md](templates/06-implementation.md) | 实现检查清单：编码前/中/后检查、偏差记录 |
| 7 | [templates/07-review-deploy.md](templates/07-review-deploy.md) | 审查部署：安全审查、部署清单、版本记录 |

---

## 5 条强制规则

### 1. 不可跳过阶段
即使某个阶段看似"显而易见"，也必须产出对应文档。

### 2. 技术规格是代码的契约
代码必须与技术规格（Phase 3）100% 一致。规格有误时，**先改规格，再改代码**。

### 3. TDD 不可商量
测试先于实现。Phase 5 的测试骨架必须在 Phase 6 实现代码之前完成。

### 4. 输入完整才能开始
每个阶段的输入是上一阶段的输出。输入不完整时，不得开始当前阶段。

### 5. 模板必填项不可省略
模板中「必填」部分不可省略。「可选」部分根据项目规模决定。

---

## 适配 Code Agent

### 一键安装（推荐）

```bash
# 1. 在你的项目中添加 submodule
git submodule add <this-repo-url> docs/methodology

# 2. 运行安装脚本，自动生成所有 Agent 入口文件
bash docs/methodology/install.sh
```

### 支持的 Agent

`install.sh` 会自动生成以下所有入口文件：

| Agent | 入口文件 | 备注 |
|-------|---------|------|
| **Codex / OpenCode / Amp** | `AGENTS.md` | OpenAI 标准 |
| **Claude Code** | `CLAUDE.md` | Anthropic |
| **Gemini CLI / Droid** | `GEMINI.md` | Google |
| **Cursor** | `.cursor/rules` | Cursor |
| **Cline** | `.clinerules` | VS Code 插件 |
| **Windsurf** | `.windsurfrules` | Codeium |
| **GitHub Copilot** | `.github/copilot-instructions.md` | GitHub |
| **Aider** | `CONVENTIONS.md` | 通用约定 |
| **pi** | `~/.pi/agent/skills/dev-lifecycle/` | 用户级 skill，`/skill:dev-lifecycle` |

所有入口指向同一份 `docs/methodology/README.md`。**一处更新，处处生效。**

### pi 全局 Skill安装

pi 用户可以安装全局 skill，任何项目都能用 `/skill:dev-lifecycle`：

```bash
mkdir -p ~/.pi/agent/skills/dev-lifecycle
cp skill/SKILL.md ~/.pi/agent/skills/dev-lifecycle/
```

---

## 项目文档命名规范

```
your-project/docs/
├── 01-prd.md                 ← Phase 1
├── 02-architecture.md        ← Phase 2
├── 03-technical-spec.md      ← Phase 3（最重要）
├── 04-task-breakdown.md      ← Phase 4
├── 05-test-spec.md           ← Phase 5
├── 06-implementation-log.md  ← Phase 6
└── 07-review-report.md       ← Phase 7
```

---

## License

MIT

---

*规格即代码的蓝图。测试即代码的验收标准。两者都先于代码存在。*
