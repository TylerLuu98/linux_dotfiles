# Dotfiles

## 🇻🇳 Tiếng Việt

### Giới thiệu

Đây là tập hợp các file cấu hình cá nhân (dotfiles) của tôi để thiết lập môi trường làm việc. Repository này bao gồm cấu hình cho Neovim, Zsh, Bash và các công cụ khác.

### Cấu trúc

```
dotfiles/
├── zshrc/                  # Cấu hình cho Zsh
│   ├── custom/             # Thư mục cho cấu hình tùy chỉnh Zsh
│   └── 20-customization    # File cấu hình chính cho Zsh
├── bashrc/                 # Cấu hình cho Bash
│   └── custom/             # Thư mục cho cấu hình tùy chỉnh Bash
├── nvim/                   # Cấu hình cho Neovim
│   ├── lua/                # Modules Lua cho Neovim
│   │   └── config/         # Cấu hình cốt lõi
│   │       ├── options.lua # Tùy chọn Neovim
│   │       └── lazy.lua    # Quản lý plugin
│   └── lazyvim.json        # Cấu hình LazyVim
├── .zshrc                  # File tải cấu hình Zsh
└── .bashrc                 # File tải cấu hình Bash
```

### Tính năng

#### Neovim

- Sử dụng LazyVim làm nền tảng
- Quản lý plugin hiện đại với lazy.nvim
- Hỗ trợ LSP (Language Server Protocol)
- Code completion và snippets
- Tìm kiếm mờ (Fuzzy finding)
- Tích hợp Git
- Làm nổi bật cú pháp với treesitter
- Hỗ trợ các ngôn ngữ: TypeScript, JSON, Markdown, Tailwind, TOML
- Tích hợp Copilot

#### Zsh

- Sử dụng Oh My Zsh với theme "refined"
- Các plugins: git, sudo, web-search, archlinux, zsh-autosuggestions, zsh-syntax-highlighting, copyfile, copybuffer, dirhistory, z
- Cấu hình lịch sử Zsh nâng cao
- FZF key bindings

### Cài đặt

1. Clone repository:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.config/dotfiles
```

2. Tạo symlinks cho các file cấu hình:

```bash
ln -s ~/.config/dotfiles/.zshrc ~/.zshrc
ln -s ~/.config/dotfiles/.bashrc ~/.bashrc
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
```

3. Khởi động lại shell hoặc chạy:

```bash
source ~/.zshrc
```

## 🇺🇸 English

### Introduction

This is my collection of personal configuration files (dotfiles) to set up my working environment. This repository includes configurations for Neovim, Zsh, Bash, and other tools.

### Structure

```
dotfiles/
├── zshrc/                  # Zsh configuration
│   ├── custom/             # Directory for custom Zsh configurations
│   └── 20-customization    # Main Zsh configuration file
├── bashrc/                 # Bash configuration
│   └── custom/             # Directory for custom Bash configurations
├── nvim/                   # Neovim configuration
│   ├── lua/                # Lua modules for Neovim
│   │   └── config/         # Core configuration
│   │       ├── options.lua # Neovim options
│   │       └── lazy.lua    # Plugin management
│   └── lazyvim.json        # LazyVim configuration
├── .zshrc                  # Zsh loader file
└── .bashrc                 # Bash loader file
```

### Features

#### Neovim

- Using LazyVim as the foundation
- Modern plugin management with lazy.nvim
- LSP (Language Server Protocol) support
- Code completion and snippets
- Fuzzy finding capabilities
- Git integration
- Syntax highlighting with treesitter
- Language support: TypeScript, JSON, Markdown, Tailwind, TOML
- Copilot integration

#### Zsh

- Oh My Zsh with "refined" theme
- Plugins: git, sudo, web-search, archlinux, zsh-autosuggestions, zsh-syntax-highlighting, copyfile, copybuffer, dirhistory, z
- Advanced Zsh history configuration
- FZF key bindings

### Installation

1. Clone the repository:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.config/dotfiles
```

2. Create symlinks for configuration files:

```bash
ln -s ~/.config/dotfiles/.zshrc ~/.zshrc
ln -s ~/.config/dotfiles/.bashrc ~/.bashrc
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
```

3. Restart your shell or run:

```bash
source ~/.zshrc
```
