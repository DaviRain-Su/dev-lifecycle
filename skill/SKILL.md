---
name: dev-lifecycle
description: >
  Structured 7-phase development lifecycle for AI-assisted coding.
  Use when starting a new project, module, or feature that involves writing code.
  Enforces: PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review.
  Invoke with /skill:dev-lifecycle to start.
---

# Dev Lifecycle — 结构化开发流程

## 概述

7 个阶段，从需求到部署。不可跳过任何阶段。

```
Phase 1: PRD（需求定义）          → 做什么 / 不做什么
Phase 2: Architecture（架构设计） → 怎么组织
Phase 3: Technical Spec（技术规格）→ 每个字节怎么做（最关键）
Phase 4: Task Breakdown（任务拆解）→ ≤4h 的可执行任务
Phase 5: Test Spec（测试规格）     → TDD：先定义什么是对的
Phase 6: Implementation（实现）    → 写代码让测试通过
Phase 7: Review & Deploy（审查）   → 确认质量，部署上线
```

## 使用方法

### 启动新项目/模块

当用户说"开始开发 X"或"实现 X"时，执行以下流程：

1. **检查当前进度** — 查看 `<project>/docs/` 下已有哪些阶段文档
2. **从缺失的最早阶段开始** — 不可跳过
3. **使用模板** — 读取对应模板文件（见下方路径），按模板填写
4. **验收后再进入下一阶段** — 每个模板底部都有验收标准

### 如果用户说"直接写代码"

回复：

> 本项目遵循 dev-lifecycle 方法论。在写代码之前，需要先完成技术规格（Phase 3）和测试规格（Phase 5）。
> 我先帮你创建技术规格，可以吗？

### 如果已有架构文档但没有技术规格

直接从 Phase 3 开始。Phase 1/2 可以引用已有文档（白皮书、架构设计等），不需要重复编写。

## 模板

模板文件在 dev-lifecycle 仓库中，项目中通常位于 `docs/methodology/templates/`。

如果项目中没有 submodule，使用以下内联模板要点：

### Phase 3 技术规格（最关键的模板）核心要求

技术规格必须精确到：
- **数据结构**：每个字段名、类型、字节大小、约束
- **接口定义**：参数、返回值、错误码、前置/后置条件
- **状态机**：当前状态 + 触发动作 + 条件 → 新状态 + 副作用
- **常量**：所有硬编码值集中定义
- **算法**：非 trivial 计算的伪代码/公式
- **PDA/地址推导**：种子定义（Solana 项目）
- **边界条件**：至少列出 10 个特殊情况

### Phase 5 测试规格核心要求

每个接口/函数必须有三类测试：
- **Happy Path**：正常输入 → 正常输出
- **Boundary**：边界值（最小/最大/刚好等于阈值）
- **Error/Attack**：异常输入 → 预期错误码

测试代码骨架先于实现代码编写。

## 5 条强制规则

1. **不可跳过阶段**
2. **技术规格是代码的契约** — 代码必须与规格 100% 一致，不一致时先改规格
3. **TDD 不可商量** — 测试先于实现
4. **输入完整才能开始** — 上一阶段输出是下一阶段输入
5. **必填项不可省略**

## 文档命名

```
<project>/docs/
├── 01-prd.md
├── 02-architecture.md
├── 03-technical-spec.md      ← 最重要
├── 04-task-breakdown.md
├── 05-test-spec.md
├── 06-implementation-log.md
└── 07-review-report.md
```

## 完整模板

完整模板在 dev-lifecycle 仓库：https://codeberg.org/davirain/dev-lifecycle

如果项目有 submodule，路径为 `docs/methodology/templates/01-07.md`。
需要时用 `read` 工具读取对应模板文件。
