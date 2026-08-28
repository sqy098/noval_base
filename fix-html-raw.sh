#!/bin/bash
# 修改所有章节HTML：改用raw.githubusercontent.com绕过API速率限制

for i in 1 2 3 4; do
    file="docs/chapter-$i.html"

    # 根据章节确定文件路径
    case $i in
        1) path="noval-result/archives/vol-1-ch-1.md" ;;
        2) path="noval-result/archives/vol-1-ch-2.md" ;;
        3) path="noval-result/archives/vol-1-ch-3-20260826.anti-ai.md" ;;
        4) path="noval-result/archives/vol-1-ch-4-draft.md" ;;
    esac

    # 替换fetch URL为raw.githubusercontent.com，添加时间戳参数绕过缓存
    sed -i "s|const response = await fetch('https://api.github.com/repos/sqy098/noval_base/contents/${path}');|const response = await fetch('https://raw.githubusercontent.com/sqy098/noval_base/main/${path}?t=' + Date.now());|g" "$file"

    # 替换解析方式：从JSON+base64改回直接text()
    sed -i 's|const data = await response.json();\n                const text = atob(data.content);|const text = await response.text();|g' "$file"

    echo "✅ 已更新 chapter-$i.html"
done

echo ""
echo "所有HTML已改用raw.githubusercontent.com + 缓存破坏参数"
