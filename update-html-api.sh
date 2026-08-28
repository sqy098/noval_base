#!/bin/bash
# 批量更新所有章节HTML，使用GitHub API绕过CDN缓存

for i in 1 2 3 4; do
    file="docs/chapter-$i.html"

    # 根据章节号确定文件路径
    chapter_path="noval-result/chapters/vol-1-ch-$i.md"

    # 使用sed替换fetch URL为GitHub API
    sed -i "s|const response = await fetch('https://raw.githubusercontent.com/sqy098/noval_base/main/.*\.md');|const response = await fetch('https://api.github.com/repos/sqy098/noval_base/contents/${chapter_path}');|g" "$file"

    # 替换text解析为base64解码
    sed -i 's|const text = await response.text();|const data = await response.json();\n                const text = atob(data.content);|g' "$file"

    echo "✅ 已更新 chapter-$i.html"
done

echo ""
echo "所有章节HTML已更新为使用GitHub API（无缓存）"
