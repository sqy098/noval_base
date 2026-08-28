# Claude Code 本地小说仓库入口

本目录 `E:\claude\noval_base` 是本地 Git 仓库根目录；当前小说工程位于 `noval-result\`。不要在仓库根目录重新初始化小说项目，也不要用模板覆盖现有工程。

## 进度权威

- 当前本地工作区是唯一写作进度基准，包括已修改但未提交的文件和未跟踪的新文件。
- 开始或继续写作前，先读取 `noval-result\.agent\status.md`、`noval-result\.agent\task\` 及相关本地章节、正文、设定和提示词，再判断断点。
- 进入小说工程后遵守 `noval-result\CLAUDE.md` 与 `noval-result\AGENTS.md`。
- Git commit 只是本地恢复快照；GitHub push 只是云端备份。`HEAD` 与 `origin/main` 都不能覆盖或取代更新的本地进度。
- 未经作者明确要求，不得 commit 或 push；未经作者明确指定操作并确认影响文件，不得 pull、reset、checkout、restore、clean、rebase，或用远端内容覆盖本地小说文件。
- 如果本地状态、任务文件和正文互相矛盾，保留全部内容并报告差异，不得擅自选用 Git 版本。

## 写作入口

小说相关任务在 `noval-result\` 内通过 `@novel-agent` 工作流执行。不得让其他模型或通用 OpenClaw agent 绕过该工作流直接改写正文。
