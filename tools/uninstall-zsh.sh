#!/bin/bash

# 检查是否具有 root 权限
if [[ $EUID -ne 0 ]]; then
    echo "请以 root 身份运行此脚本。" >&2
    exit 1
fi

echo "开始删除 Zsh 及其相关内容..."

# 卸载 Zsh
echo "卸载 Zsh..."
if command -v zsh >/dev/null 2>&1; then
    apt-get remove --purge -y zsh
    echo "Zsh 已卸载。"
else
    echo "Zsh 未安装，无需卸载。"
fi

# 删除 Oh-My-Zsh
echo "删除 Oh-My-Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
    echo "Oh-My-Zsh 已删除。"
else
    echo "未找到 Oh-My-Zsh 目录，无需删除。"
fi

# 删除 Zsh 配置文件
echo "删除 Zsh 配置文件..."
if [ -f "$HOME/.zshrc" ]; then
    rm -f "$HOME/.zshrc"
    echo ".zshrc 配置文件已删除。"
else
    echo "未找到 .zshrc 文件，无需删除。"
fi

# 删除其他可能的 Zsh 相关文件
echo "删除其他可能的 Zsh 相关文件..."
ZSH_FILES=("$HOME/.zlogin" "$HOME/.zlogout" "$HOME/.zshenv" "$HOME/.zprofile")
for file in "${ZSH_FILES[@]}"; do
    if [ -f "$file" ]; then
        rm -f "$file"
        echo "$file 已删除。"
    fi
done

# 恢复默认 Shell
echo "恢复默认 Shell..."
if [ "$SHELL" == "$(which zsh)" ]; then
    chsh -s "$(which bash)" "$USER"
    echo "默认 Shell 已恢复为 Bash。"
else
    echo "默认 Shell 未设置为 Zsh，无需更改。"
fi

echo "Zsh 及相关内容已删除完成！"
