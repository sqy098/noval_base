# 章节版本管理与发布流程

## 目录结构说明

```
noval-result/
├── archives/                           # 存档目录（所有历史版本）
│   ├── vol-1-ch-1.md                  # 第1章原始版本
│   ├── vol-1-ch-1-revised-v2.md       # 第1章修订版v2
│   ├── vol-1-ch-1-revised-v3.md       # 第1章修订版v3（最新评审通过版）
│   ├── vol-1-ch-3-20260826.anti-ai.md # 第3章anti-ai处理后版本
│   └── vol-1-ch-4-draft.md            # 第4章初稿
├── chapters/                           # 正式发布目录（GitHub Pages读取）
│   ├── vol-1-ch-1.md                  # 第1章当前正式版
│   ├── vol-1-ch-2.md                  # 第2章当前正式版
│   └── vol-1-ch-3.md                  # 第3章当前正式版
└── .agent/
    └── review/                         # 评审报告
```

---

## 版本命名规范

### archives/ 目录

- `vol-X-ch-Y.md` - 原始版本
- `vol-X-ch-Y-revised-vN.md` - 修订版本（v2, v3...）
- `vol-X-ch-Y-YYYYMMDD.draft.md` - 带日期的草稿
- `vol-X-ch-Y-YYYYMMDD.anti-ai.md` - anti-ai处理后版本
- `vol-X-ch-Y-draft.md` - 最新草稿（无日期）

### chapters/ 目录

- `vol-X-ch-Y.md` - 当前正式发布版本（唯一文件名）

---

## 标准流程

### 1. 写作阶段

```bash
# 创建初稿
archives/vol-1-ch-4-draft.md

# 状态更新
.agent/status.md: phase = draft, current_step = writing
```

### 2. Anti-AI处理阶段

```bash
# 执行anti-ai处理
archives/vol-1-ch-4-YYYYMMDD.draft.md       # 保留原始draft
archives/vol-1-ch-4-YYYYMMDD.anti-ai.md     # 生成anti-ai版本

# 状态更新
.agent/status.md: phase = anti-ai, current_step = processing
```

### 3. 评审阶段

```bash
# 创建评审报告
.agent/review/vol-1-ch-4.md

# 状态更新
.agent/status.md: phase = review, current_step = reviewing
```

#### 评审结果

**✅ 通过 →** 进入第4步（发布）  
**⚠️ 需修订 →** 返回第1步，创建 `revised-vN` 版本

### 4. 发布阶段（关键步骤）

```bash
# 将评审通过的版本复制到chapters/（覆盖旧版）
cp archives/vol-1-ch-4-YYYYMMDD.anti-ai.md chapters/vol-1-ch-4.md

# 或者对于修订版本
cp archives/vol-1-ch-4-revised-v3.md chapters/vol-1-ch-4.md

# 状态更新
.agent/status.md: phase = archive, current_step = published
.agent/status.md: last_archived = vol-1-ch-4
```

### 5. 归档标记

```bash
# 创建归档标记文件
.agent/archiving/vol-1-ch-4.done

# 内容记录发布信息
published_version: archives/vol-1-ch-4-20260828.anti-ai.md
published_to: chapters/vol-1-ch-4.md
published_date: 2026-08-28
```

---

## 自动化脚本

### 发布章节脚本

```bash
#!/bin/bash
# publish-chapter.sh <source-file> <chapter-number>

SOURCE_FILE=$1
CHAPTER_NUM=$2

# 复制到正式目录
cp "$SOURCE_FILE" "chapters/vol-1-ch-${CHAPTER_NUM}.md"

# 提交
git add "chapters/vol-1-ch-${CHAPTER_NUM}.md"
git commit -m "发布第${CHAPTER_NUM}章正式版本

Source: $(basename $SOURCE_FILE)

Co-Authored-By: Claude <noreply@anthropic.com>"
git push

echo "✅ 第${CHAPTER_NUM}章已发布到GitHub Pages"
```

使用方法：
```bash
./publish-chapter.sh archives/vol-1-ch-3-20260826.anti-ai.md 3
```

---

## 当前需要执行的操作

### 第1章
```bash
# 当前正式版：chapters/vol-1-ch-1.md (4.1K - 旧版)
# 最新评审通过版：archives/vol-1-ch-1-revised-v3.md (13K)
# 操作：需要更新
cp archives/vol-1-ch-1-revised-v3.md chapters/vol-1-ch-1.md
```

### 第2章
```bash
# 当前正式版：chapters/vol-1-ch-2.md (4.3K - 旧版)
# 最新评审通过版：archives/vol-1-ch-2-revised-v3.md (12K)
# 操作：需要更新
cp archives/vol-1-ch-2-revised-v3.md chapters/vol-1-ch-2.md
```

### 第3章
```bash
# 当前正式版：chapters/vol-1-ch-3.md (8.6K - 已更新为anti-ai版本)
# 最新评审通过版：archives/vol-1-ch-3-20260826.anti-ai.md (8.6K)
# 操作：已是最新版，无需更新
```

### 第4章
```bash
# 当前正式版：不存在
# 最新版本：archives/vol-1-ch-4-draft.md (15K - 初稿)
# 操作：等待评审和anti-ai处理后再发布
```

---

## GitHub Pages HTML文件映射

```
docs/chapter-1.html → fetch from chapters/vol-1-ch-1.md
docs/chapter-2.html → fetch from chapters/vol-1-ch-2.md
docs/chapter-3.html → fetch from chapters/vol-1-ch-3.md
docs/chapter-4.html → fetch from archives/vol-1-ch-4-draft.md (临时，待正式版发布后改为chapters/)
```

---

## 检查清单

在发布新章节前，确认：

- [ ] 章节已通过reader评审
- [ ] 章节已完成anti-ai处理（如需要）
- [ ] 评审报告已生成（.agent/review/）
- [ ] 将最新版本复制到 `chapters/` 目录
- [ ] 更新 `.agent/status.md` 中的 `last_archived`
- [ ] 创建归档标记文件 `.agent/archiving/vol-X-ch-Y.done`
- [ ] 提交并推送到GitHub
- [ ] 等待GitHub Actions自动部署
- [ ] 访问 https://sqy098.github.io/noval_base/chapter-X.html 确认更新

---

## 紧急回滚

如果发布版本有问题，可以快速回滚：

```bash
# 回滚到之前的版本
git log chapters/vol-1-ch-3.md  # 查看历史
git checkout <commit-hash> chapters/vol-1-ch-3.md
git commit -m "回滚第3章到之前版本"
git push
```

---

## 维护者注意事项

1. **archives/ 不要删除** - 保留所有历史版本
2. **chapters/ 只放正式版** - 评审通过后才能放入
3. **一章一文件** - chapters/ 中每章只有一个文件
4. **文件名固定** - chapters/ 中文件名不带版本号
5. **定期备份** - archives/ 是唯一的版本历史记录

---

**维护日期：** 2026-08-28  
**当前版本：** v1.0
