---
name: dev-lifecycle
description: >
  Structured 8-phase development lifecycle for AI-assisted coding.
  Use when starting a new project, module, or feature that involves writing code.
  Enforces: PRD → Architecture → Technical Spec → Task Breakdown → Test Spec → Implementation → Review → Evolution.
  Invoke with /skill:dev-lifecycle to start.
---

# Dev Lifecycle — 结构化开发流程

## 概述

8 个阶段，从需求到长期治理。不可跳过任何阶段。

```
Phase 1: PRD（需求定义）          → 对齐锚点 + 做什么 / 不做什么
Phase 2: Architecture（架构设计） → 怎么组织 + 代理可读性设计 + 机械强制规则
Phase 3: Technical Spec（技术规格）→ 增量生成 + 每个字节怎么做（最关键）
Phase 4: Task Breakdown（任务拆解）→ ≤4h 的可执行任务（区分探索型/承诺型）
Phase 5: Test Spec（测试规格）     → TDD：先定义什么是对的
Phase 6: Implementation（实现）    → 代理熵检查 + 写代码让测试通过
Phase 7: Review & Deploy（审查）   → Agent/Human 审查分工 + 确认质量，部署上线
Phase 8: Evolution（演化治理）     → 决策日志 + ADR + 复杂度预算 + 交接地图
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

## 分形应用

本方法论适用于**所有粒度级别**：

- **项目级**：整个项目完整经历 7 个阶段
- **模块级**：每个子模块（如 agent-arena、chain-hub、indexer、SDK 等）**独立**经历各自的 7 个阶段
- **Phase 1/2 可引用**：子模块可以引用项目级的 PRD/架构文档，无需重写
- **Phase 3 必须重写**：每个子模块的**技术规格必须独立编写**，这是不可妥协的硬性要求

**启动子模块时的检查清单**：
1. 查看项目级 `docs/` 中已有的阶段文档
2. 判断哪些可以引用、哪些必须重写
3. Phase 3 永远重新编写，即使项目级已有技术规格

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

## 6 条强制规则

1. **不可跳过阶段**
2. **技术规格是代码的契约** — 代码必须与规格 100% 一致，不一致时先改规格
3. **TDD 不可商量** — 测试先于实现
4. **输入完整才能开始** — 上一阶段输出是下一阶段输入
5. **必填项不可省略**
6. **摩擦即判断力** — 代理审查通过 ≠ 人类可跳过；高风险变更（DB/auth/API/不可逆操作）必须人类判断

## 关键概念：探索型 vs 承诺型任务

Phase 4 任务拆解时，每个任务必须标注性质：
- **探索型 (Explore)**: 验证方向，可跳过 Phase 3/5，代码不合入 main，分支用 `explore/` 或 `prototype/`
- **承诺型 (Commit)**: 生产代码，必须走完整 7 阶段
- 探索成果要进生产 → 必须从 Phase 3 重新走承诺型流程

## 代理熵管理

实现前检查代码库健康度（Phase 6.0.1），每完成 3 个任务暂停监控代理漂移。
如果发现 bare catch、默认值 fallback、重复函数等代理漂移模式 ≥ 2 项，立即停止实现，先清理。

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
