# GitHub Pages 配置说明

## 已完成的工作

✅ 创建了 `docs/` 目录，包含以下文件：
- `index.html` - 主页/目录页
- `chapter-1.html` - 第一章：装置上的名字
- `chapter-2.html` - 第二章：五百九十五年
- `chapter-3.html` - 第三章：去夏利亚的最后一班车
- `chapter-4.html` - 第四章：去夏利亚的夜班车（初稿）

✅ 所有文件已提交并推送到 GitHub main 分支

---

## 在GitHub上启用Pages的步骤

### 方法一：通过网页界面（推荐）

1. 打开浏览器，访问：https://github.com/sqy098/noval_base

2. 点击仓库顶部的 **Settings** 标签

3. 在左侧菜单中找到 **Pages** 选项

4. 在 "Source" 部分：
   - Branch: 选择 `main`
   - Folder: 选择 `/docs`
   - 点击 **Save** 按钮

5. 等待几分钟后，页面会显示：
   ```
   Your site is live at https://sqy098.github.io/noval_base/
   ```

### 方法二：通过命令行（备用）

如果您已经配置了 `gh` CLI：

```bash
gh repo edit --enable-pages --pages-branch main --pages-path /docs
```

---

## 访问地址

启用后，小说展示页面的访问地址为：

- **主页：** https://sqy098.github.io/noval_base/
- **第一章：** https://sqy098.github.io/noval_base/chapter-1.html
- **第二章：** https://sqy098.github.io/noval_base/chapter-2.html
- **第三章：** https://sqy098.github.io/noval_base/chapter-3.html
- **第四章：** https://sqy098.github.io/noval_base/chapter-4.html

---

## 页面特性

### 设计特点
- ✅ 响应式设计，支持PC和移动端
- ✅ 优雅的渐变背景和阴影效果
- ✅ 舒适的阅读字体和行距
- ✅ 章节间导航（上一章/下一章）
- ✅ 返回目录功能

### 内容加载
- 章节内容通过 JavaScript 从 GitHub raw 动态加载
- 直接读取 `main` 分支中的 markdown 文件
- 自动转换为 HTML 格式展示

### 更新方式
当您修改 `noval-result/archives/` 或 `chapters/` 中的章节文件后：
1. 提交并推送到 GitHub
2. 页面会自动加载最新内容（可能有几分钟缓存）
3. **无需修改 HTML 文件**

---

## 文件结构

```
noval_base/
├── docs/                           # GitHub Pages 目录
│   ├── index.html                  # 主页
│   ├── chapter-1.html              # 第1章页面
│   ├── chapter-2.html              # 第2章页面
│   ├── chapter-3.html              # 第3章页面
│   └── chapter-4.html              # 第4章页面
├── noval-result/
│   ├── archives/                   # 章节源文件
│   │   ├── vol-1-ch-1.md
│   │   ├── vol-1-ch-2.md
│   │   └── vol-1-ch-4-draft.md
│   └── chapters/                   # 正式章节
│       └── vol-1-ch-3.md
└── README.md
```

---

## 后续添加新章节

当您写完新章节后：

1. 创建新的 HTML 文件（例如 `chapter-5.html`）
2. 复制 `chapter-4.html` 的内容
3. 修改以下部分：
   - 标题：`<title>第五章 XXX - 昨日之后</title>`
   - 章节标题：`<h1 class="chapter-title">第五章　XXX</h1>`
   - fetch URL：`'https://raw.githubusercontent.com/.../vol-1-ch-5.md'`
   - 导航链接：上一章/下一章
4. 在 `index.html` 中添加新章节链接
5. 提交推送即可

---

## 自定义样式

如果需要调整样式，可以修改 HTML 文件中的 `<style>` 部分：

- **字体大小：** `.chapter-content { font-size: 1.1em; }`
- **行距：** `.chapter-content { line-height: 2; }`
- **背景色：** `body { background: ... }`
- **内容宽度：** `.container { max-width: 900px; }`

---

## 注意事项

1. **首次访问可能需要等待几分钟**，GitHub Pages 需要构建时间
2. **内容更新有缓存**，修改章节后可能需要几分钟才能看到更新
3. **章节文件路径必须正确**，确保 fetch 的 URL 对应实际文件路径
4. **第4章标记为初稿**，页面上会显示提示

---

## 排查问题

如果页面显示"加载失败"：

1. 检查浏览器控制台（F12）的错误信息
2. 确认 GitHub 仓库是 public（私有仓库需要配置 token）
3. 确认章节文件路径正确
4. 尝试直接访问 raw URL，例如：
   ```
   https://raw.githubusercontent.com/sqy098/noval_base/main/noval-result/archives/vol-1-ch-1.md
   ```

---

## 总结

✅ **所有文件已准备就绪**  
✅ **已推送到 GitHub**  
⏳ **等待您在 GitHub Settings → Pages 中启用**  

启用后，您就可以通过浏览器访问小说展示页面了！
