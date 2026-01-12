# =============================================================================
# 1. INIT & ENVIRONMENT VARIABLES
# =============================================================================

# --- Editor & Visual ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERM xterm-256color

# --- C++ / Dev Environment ---
set -gx USE_CCACHE 1
set -gx CCACHE_DIR "$HOME/.ccache"
# Thêm đường dẫn cho các tool cài cục bộ (nếu có)
# fish_add_path ~/.local/bin

# =============================================================================
# 2. INTERACTIVE SESSION
# =============================================================================
if status is-interactive
    starship init fish | source # Bỏ comment nếu muốn dùng Starship

    # --- Dọn dẹp file rác Zsh (Tối ưu tốc độ) ---
    # Dùng tính năng glob của Fish, không cần gọi lệnh 'find'
    if count $HOME/.zcompdump* >/dev/null
        rm -f $HOME/.zcompdump*
    end

    # --- Load CachyOS Defaults ---
    if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
        source /usr/share/cachyos-fish-config/cachyos-config.fish
    end

    fnm env --use-on-cd | source

    # --- Key Bindings ---
    fish_vi_key_bindings
    # Copy/Paste hệ thống (Hỗ trợ tốt cho Wayland/X11)
    bind -M visual y fish_clipboard_copy
    bind -M normal p fish_clipboard_paste

    # --- KHỞI ĐỘNG MODULES ---
    zoxide init fish | source

    # --- General Aliases ---
    # Dùng eza thay cho ls (CachyOS mặc định đã có eza)
    # alias ls='eza -a --icons=always --group-directories-first'
    # alias ll='eza -al --icons=always --group-directories-first'

    alias c='clear'
    alias shutdown='systemctl poweroff'
    alias nv='nvim'
    alias fconfig='nvim ~/.config/fish/config.fish'
    alias sf='source ~/.config/fish/config.fish'

    # --- GIT Abbreviations ---
    abbr -a g git
    abbr -a ga 'git add'
    abbr -a gaa 'git add .'
    abbr -a gb 'git branch'
    abbr -a gc 'git commit -m'
    abbr -a gca 'git commit --amend'
    abbr -a gco 'git checkout'
    abbr -a gd 'git diff'
    abbr -a gl 'git log --oneline --graph --all'
    abbr -a gp 'git pull'
    abbr -a gpu 'git push'
    abbr -a gst 'git status'
    abbr -a glzg lazygit

    # --- TMUX ---
    alias tm='tmux'
    alias ta='tmux attach -t'
end
