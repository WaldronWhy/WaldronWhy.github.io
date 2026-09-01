#!/usr/bin/env bash
# 本机部署脚本：构建 Hugo 站点并把产物推送到 GitHub Pages
# 仅在本机（Windows + Git Bash）使用，需要已配置好 git 推送凭证
set -e
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
HUGO="$(dirname "$REPO_DIR")/hugo_tmp/hugo.exe"

cd "$REPO_DIR"
"$HUGO" -s source -d source/public
cp -r source/public/. .
git add -A
git commit -m "update site ($(date +%F))"
git push
echo "部署完成 ✅"
