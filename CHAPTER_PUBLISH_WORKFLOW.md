# 章节发布流程与当前状态

## 📊 当前各章节状态

### 第1章《装置上的名字》
- **执行卡：** `chapters/vol-1-ch-1.md` ✅
- **评审通过正文：** `archives/vol-1-ch-1.md` ✅
- **GitHub Pages读取：** `archives/vol-1-ch-1.md` ✅
- **状态：** 已完成，已发布

### 第2章《五百九十五年》
- **执行卡：** `chapters/vol-1-ch-2.md` ✅
- **评审通过正文：** `archives/vol-1-ch-2.md` ✅
- **GitHub Pages读取：** `archives/vol-1-ch-2.md` ✅
- **状态：** 已完成，已发布

### 第3章《去夏利亚的最后一班车》
- **执行卡：** `chapters/vol-1-ch-3.md` ✅
- **评审通过正文：** `archives/vol-1-ch-3-20260826.anti-ai.md` ✅（爱夏记忆重写版）
- **GitHub Pages读取：** `archives/vol-1-ch-3.md` ❌ **错误！应该读取anti-ai版本**
- **状态：** 正文已完成，但Pages读取的是旧版本

### 第4章《去夏利亚的夜班车》
- **执行卡：** `chapters/vol-1-ch-4.md` ✅
- **最新正文：** `archives/vol-1-ch-4-draft.md`（2026-08-28初稿，15K）
- **GitHub Pages读取：** `archives/vol-1-ch-4-draft.md` ✅
- **状态：** 初稿完成，待anti-ai处理和最终评审

---

## 🔴 立即需要修正的问题

### 问题1：第3章Pages读取错误版本

**当前：** `docs/chapter-3.html` 读取 `archives/vol-1-ch-3.md`（6.6K，旧版）
**应该：** 读取 `archives/vol-1-ch-3-20260826.anti-ai.md`（8.6K，评审通过版）

**修正命令：**
```bash
sed -i 's|archives/vol-1-ch-3.md|archives/vol-1-ch-3-20260826.anti-ai.md|g' docs/chapter-3.html
```

---

## 📋 标准发布流程

### 阶段1：章纲（执行卡）
**位置：** `chapters/vol-N-ch-M.md`
**内容：** 本章任务、开篇三问、人物欲望、事件顺序
**状态标记：** `status: writing`

### 阶段2：初稿写作
**位置：** `archives/vol-N-ch-M-YYYYMMDD.draft.md`
**要求：** 按执行卡完成正文
**状态标记：** 更新执行卡 `status: draft-complete`

### 阶段3：Anti-AI处理（可选）
**位置：** `archives/vol-N-ch-M-YYYYMMDD.anti-ai.md`
**要求：** 去除AI痕迹，增加自然感
**状态标记：** 更新执行卡 `status: anti-ai-complete`

### 阶段4：评审
**评审报告：** `.agent/review/vol-N-ch-M.md`
**评审结果：**
- ✅ **通过** → 进入阶段5
- ⚠️ **需修订** → 返回阶段2，创建revised版本

### 阶段5：归档为正式版本
**操作：** 将评审通过的版本确认为正式版
**位置：** 最新的anti-ai版本或revised版本
**状态标记：** 更新执行卡 `status: archived`

### 阶段6：GitHub Pages发布
**操作：** 更新HTML指向评审通过的版本
**验证：** 访问网站确认显示正确

---

## 📁 文件命名规范

### archives/ 目录

```
vol-N-ch-M.md                    # 第一版正文（可能已过时）
vol-N-ch-M-YYYYMMDD.draft.md    # 带日期的草稿
vol-N-ch-M-YYYYMMDD.anti-ai.md  # anti-ai处理后版本
vol-N-ch-M-revised-v2.md         # 修订版本（如果需要）
vol-N-ch-M-revised-v3.md         # 更多修订版本
```

### 当前正式版本确认方法

1. 查看评审报告 `.agent/review/`
2. 查看执行卡 `chapters/vol-N-ch-M.md` 中的status
3. 查看归档标记 `.agent/archiving/` （如果有）
4. **优先顺序：** 最新anti-ai版本 > 最新revised版本 > vol-N-ch-M.md

---

## ✅ 当前需要执行的操作

### 1. 修正第3章HTML指向
```bash
sed -i 's|archives/vol-1-ch-3.md|archives/vol-1-ch-3-20260826.anti-ai.md|g' docs/chapter-3.html
```

### 2. 确认第4章状态
- 第4章目前是初稿
- 需要anti-ai处理
- 需要最终评审
- 完成后才能标记为archived

### 3. 清理archives/中的过时文件
**建议保留：**
- `vol-1-ch-1.md` - 第1章正式版
- `vol-1-ch-2.md` - 第2章正式版
- `vol-1-ch-3-20260826.anti-ai.md` - 第3章正式版
- `vol-1-ch-4-draft.md` - 第4章当前版本

**可以删除或移动到backup/：**
- `*-old-publish.md` - 旧的执行卡备份
- `*-revised-vX.md` - 废弃的实验版本（如果确认不再使用）

---

## 🔄 未来章节发布检查清单

写完新章节后，执行以下检查：

- [ ] 执行卡在 `chapters/` 中存在且状态正确
- [ ] 正文在 `archives/` 中且文件名规范
- [ ] 评审报告在 `.agent/review/` 中且结论明确
- [ ] 如需anti-ai处理，已完成并保存
- [ ] HTML文件指向评审通过的版本
- [ ] 访问GitHub Pages确认显示正确
- [ ] 更新执行卡status为`archived`

---

## 📝 HTML更新命令模板

```bash
# 更新某章HTML指向新版本
sed -i 's|archives/vol-1-ch-X.md|archives/vol-1-ch-X-YYYYMMDD.anti-ai.md|g' docs/chapter-X.html

# 提交并推送
git add docs/chapter-X.html
git commit -m "更新第X章为评审通过版本"
git push
```

---

**创建时间：** 2026-08-28  
**最后更新：** 2026-08-28  
**维护者：** 参考此文档确保每章发布流程规范
