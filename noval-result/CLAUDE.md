# 《昨日之后》Claude Code 指引

这是一个已有小说工程，正文、设定、卷纲与历史归档均已存在。禁止重新初始化或用模板覆盖现有内容。

## 正式入口

在本目录启动 Claude Code 后，使用 `@novel-agent` 进入写作循环。恢复进度时，以当前本地工作区为唯一数据源：结合 `.agent/status.md`、`.agent/task/`、本地章节、正文、设定和提示词判断断点，未提交及未跟踪文件同样属于本地进度。项目专属约束、权威层级和人物红线见 `AGENTS.md`。

当前 Claude Code 代理定义位于 `.claude/agents/`：`novel-agent`、`volume-planner`、`chapter-planner`、`prompt-crafter`、`writer`、`anti-ai`、`reader`、`updater`。

## 项目边界

- 仅在本目录内读写小说工程文件。
- 除非作者明确要求比较旧稿，不得读取相邻 `../noval/`。
- `.agent/orders/` 是旧流程历史记录；新流程的 order 文件写入 `.agent/task/`。
- 不得把酒馆聊天记录或 Bridge 的角色记忆直接当作 canon；只有经过当前工作流写入并归档的内容才是正式版本。
- Git 历史和 `origin/main` 只用于版本回溯与云端备份，不得把 `HEAD` 或远端分支当作当前写作进度，也不得因此忽略较新的本地文件。
- 未经作者明确要求，不执行 Git commit 或 GitHub push；提交只是本地快照，推送只是把快照保存到云仓库。汇报时必须区分工作区修改、本地提交与远端推送。
- 未经作者明确要求并确认影响文件，禁止用 `git pull`、`git reset`、`git checkout`、`git restore`、`git clean`、rebase 或远端内容覆盖、回退本地小说进度。
- 若本地状态文件与本地正文/任务文件不一致，必须保留双方并报告冲突，不得自行选择 Git 版本覆盖。
