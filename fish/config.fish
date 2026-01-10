# =============================================================================
# 1. INIT & ENVIRONMENT VARIABLES
# =============================================================================

# --- Editor & Visual ---
set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx TERM xterm-256color

# --- Fcitx5 (Bộ gõ Tiếng Việt) ---
# set -gx GTK_IM_MODULE fcitx5
# set -gx QT_IM_MODULE fcitx5
# set -gx XMODIFIERS @im=fcitx5
# set -gx SDL_IM_MODULE fcitx5

# --- ManPage (Đọc man bằng Neovim) ---
set -gx MANPAGER "nvim +Man!"

# --- Locale ---
set -gx LANG en_US.UTF-8

# --- C++ / Dev Environment ---
# Dùng ccache để build nhanh hơn (C++ Dev cần cái này)
set -gx USE_CCACHE 1
set -gx CCACHE_DIR "$HOME/.ccache"

# --- Path Management (Thông minh hơn) ---
# Hàm thêm path nếu thư mục tồn tại
function add_path_if_exists
    if test -d $argv[1]
        fish_add_path $argv[1]
    end
end

add_path_if_exists /usr/lib/ccache/bin
add_path_if_exists $HOME/.local/bin
add_path_if_exists $HOME/.cargo/bin # Rust
add_path_if_exists $HOME/go/bin # Go
add_path_if_exists $HOME/.bun/bin # Bun

# --- FZF Configuration (Giao diện đẹp) ---
# Yêu cầu cài: fd (để tìm file) và bat (để preview)
set -gx FZF_DEFAULT_COMMAND "fd --type f --strip-cwd-prefix --hidden --follow --exclude .git"
set -gx FZF_DEFAULT_OPTS "--height 40% --layout=reverse --border --prompt='🔍 ' --pointer='▶' --marker='✓'"
set -gx FZF_CTRL_T_OPTS "--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# =============================================================================
# 2. INTERACTIVE SESSIONS
# =============================================================================
if status is-interactive
    # Tắt lời chào
    set fish_greeting

    # --- VI MODE SUPERCHARGED (Nâng cấp quan trọng) ---
    fish_vi_key_bindings

    # Thay đổi hình dạng con trỏ theo Mode (Block: Normal, Line: Insert)
    set fish_cursor_default block blink
    set fish_cursor_insert line blink
    set fish_cursor_replace_one underscore blink
    set fish_cursor_visual block

    # Copy/Paste vào System Clipboard
    bind -M visual y fish_clipboard_copy
    bind -M normal p fish_clipboard_paste

    # --- KHỞI ĐỘNG MODULES ---
    starship init fish | source
    zoxide init fish | source
    # Nếu chưa cài fzf.fish thì dòng này vô hại, nếu cài rồi thì load keybindings
    if type -q fzf_configure_bindings
        fzf_configure_bindings --directory=\cf --git_log=\cg --git_status=\cs --history=\cr
    end

    # --- "BANG BANG" HISTORY (Sudo !!) ---
    function __history_previous_command
        switch (commandline -t)
            case "!"
                commandline -t $history[1]
                commandline -f repaint
            case "*"
                commandline -i !
        end
    end
    bind ! __history_previous_command

    # =========================================================================
    # 3. ALIASES & ABBREVIATIONS (Pro Version)
    # =========================================================================

    # --- General ---
    alias c='clear'
    alias shutdown='systemctl poweroff'
    alias nv='nvim'
    alias vi='nvim'
    alias vim='nvim'
    alias zshconfig='nvim ~/.zshrc'
    alias fconfig='nvim ~/.config/fish/config.fish'
    alias sourcefish='source ~/.config/fish/config.fish'

    # --- Safety First (Tránh xóa nhầm code) ---
    abbr -a rm 'rm -I' # Hỏi 1 lần nếu xóa >3 file. Dùng -i nếu muốn hỏi từng file.
    abbr -a cp 'cp -i'
    abbr -a mv 'mv -i'

    # --- Arch Linux (Paru/Pacman) ---
    # Cập nhật hệ thống nhanh
    abbr -a upd 'paru -Syu'
    # Cài đặt gói
    abbr -a in 'paru -S'
    # Gỡ cài đặt + dọn rác dependency
    abbr -a un 'paru -Rns'
    # Dọn cache pacman (giải phóng ổ cứng)
    abbr -a cleanpac 'paru -Sc'

    # --- EZA (Better LS) ---
    alias ls="eza -a --icons=always --sort='type' --group-directories-first"
    alias ll="eza -al --icons=always --sort='type' --group-directories-first"
    alias lt="eza -a --tree --level=2 --icons=always --sort='type'"

    # --- System Monitoring ---
    alias du1='sudo du -hxd 1 | sort -h'
    alias du2='sudo du -sh --exclude=/mnt /* --total | sort --human-numeric-sort'

    # --- GIT Abbreviations ---
    abbr -a g git
    abbr -a ga 'git add'
    abbr -a gaa 'git add .'
    abbr -a gb 'git branch'
    abbr -a gc 'git commit -m'
    abbr -a gca 'git commit --amend'
    abbr -a gco 'git checkout'
    abbr -a gcl 'git clone'
    abbr -a gd 'git diff'
    abbr -a gl 'git log --oneline --graph --all' # Log đẹp hơn
    abbr -a gm 'git merge'
    abbr -a gp 'git pull'
    abbr -a gpu 'git push'
    abbr -a gst 'git status'
    abbr -a glzg lazygit

    # --- TMUX ---
    alias tm='tmux'
    alias ta='tmux attach -t'
    alias tn='tmux new-session -s'
    alias tl='tmux list-sessions'

    # =========================================================================
    # 4. UTILITY FUNCTIONS
    # =========================================================================

    # --- Yazi Wrapper (CD on exit) ---
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

end
alias gdb-pwn='gdb -x ~/.gdbinit-pwn'
