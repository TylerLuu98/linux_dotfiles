# Đường dẫn đến thư mục chứa các tệp zshrc
BASHRC_DIR="$HOME/.config/dotfiles/bashrc"
BASHRC_CUSTOM_DIR="$HOME/.config/dotfiles/bashrc/custom"

# Tải tất cả các tệp trong ZSHRC_DIR
for f in "$BASHRC_DIR"/*; do
  if [ ! -d "$f" ]; then # Chỉ xử lý tệp, không phải thư mục
    # Tạo đường dẫn tệp tùy chỉnh (nếu có trong custom/)
    c="${f/$ZSHRC_DIR/$BASHRC_CUSTOM_DIR}"
    if [ -f "$c" ]; then
      source "$c" # Tải tệp từ custom/ nếu tồn tại
    else
      source "$f" # Nếu không, tải tệp gốc
    fi
  fi
done

# Tải tệp tùy chỉnh ~/.zshrc_custom nếu tồn tại
if [ -f ~/.zshrc_custom ]; then
  source ~/.bashrc_custom
fi
