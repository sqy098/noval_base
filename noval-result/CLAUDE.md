# 《昨日之后》Claude Code 指引

这是一个已有小说工程，正文、设定、卷纲与历史归档均已存在。禁止重新初始化或用模板覆盖现有内容。

## 正式入口

在本目录启动 Claude Code 后，使用 `@novel-agent` 进入写作循环。当前持久断点以 `.agent/status.md` 为准；项目专属约束、权威层级和人物红线见 `AGENTS.md`。

当前 Claude Code 代理定义位于 `.claude/agents/`：`novel-agent`、`volume-planner`、`chapter-planner`、`prompt-crafter`、`writer`、`anti-ai`、`reader`、`updater`。

## 项目边界

- 仅在本目录内读写小说工程文件。
- 除非作者明确要求比较旧稿，不得读取相邻 `../noval/`。
- `.agent/orders/` 是旧流程历史记录；新流程的 order 文件写入 `.agent/task/`。
- 不得把酒馆聊天记录或 Bridge 的角色记忆直接当作 canon；只有经过当前工作流写入并归档的内容才是正式版本。
- 未经作者明确要求，不执行 Git commit 或 GitHub push；汇报时必须区分工作区修改、本地提交与远端推送。

