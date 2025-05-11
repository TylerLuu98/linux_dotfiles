# Đường dẫn đến thư mục chứa các tệp zshrc
ZSHRC_DIR="$HOME/.config/dotfiles/zshrc"
ZSHRC_CUSTOM_DIR="$HOME/.config/dotfiles/zshrc/custom"

# Tải tất cả các tệp trong ZSHRC_DIR
for f in "$ZSHRC_DIR"/*; do
    if [ ! -d "$f" ]; then  # Chỉ xử lý tệp, không phải thư mục
        # Tạo đường dẫn tệp tùy chỉnh (nếu có trong custom/)
        c="${f/$ZSHRC_DIR/$ZSHRC_CUSTOM_DIR}"
        if [ -f "$c" ]; then
            source "$c"  # Tải tệp từ custom/ nếu tồn tại
        else
            source "$f"  # Nếu không, tải tệp gốc
        fi
    fi
done

# Tải tệp tùy chỉnh ~/.zshrc_custom nếu tồn tại
if [ -f ~/.zshrc_custom ]; then
    source ~/.zshrc_custom
fi


# pnpm
export PNPM_HOME="/home/tylerluu/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
