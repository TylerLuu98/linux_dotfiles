#!/usr/bin/env python3
import os
import sys
import subprocess
from pathlib import Path

KITTY_CONFIG_DIR = os.path.expanduser("~/.config/kitty")
THEMES_DIR = os.path.join(KITTY_CONFIG_DIR, "themes")

def ensure_themes_directory():
    """Đảm bảo thư mục themes tồn tại."""
    Path(THEMES_DIR).mkdir(parents=True, exist_ok=True)

def list_themes():
    """Liệt kê tất cả themes có sẵn."""
    ensure_themes_directory()
    return [f.stem for f in Path(THEMES_DIR).glob("*.conf")]

def apply_theme(theme_name):
    """Áp dụng theme đã chọn."""
    theme_path = os.path.join(THEMES_DIR, f"{theme_name}.conf")
    if not os.path.exists(theme_path):
        print(f"Theme không tồn tại: {theme_name}")
        return False
    
    # Tạo symlink đến theme đã chọn
    theme_link = os.path.join(KITTY_CONFIG_DIR, "theme.conf")
    if os.path.exists(theme_link):
        os.remove(theme_link)
    
    os.symlink(theme_path, theme_link)
    
    # Reload cấu hình kitty
    subprocess.run(["kitty", "@", "set-colors", "--all", theme_path])
    print(f"Đã áp dụng theme: {theme_name}")
    return True

def show_menu():
    """Hiển thị menu tương tác để chọn theme."""
    themes = list_themes()
    
    if not themes:
        print("Không tìm thấy theme nào. Vui lòng thêm theme vào ~/.config/kitty/themes/")
        return
    
    print("\n=== KITTY THEME SWITCHER ===")
    print("Các theme có sẵn:")
    
    for i, theme in enumerate(themes, 1):
        print(f"{i}. {theme}")
    
    try:
        idx = int(input("\nChọn theme (số): ")) - 1
        if 0 <= idx < len(themes):
            apply_theme(themes[idx])
        else:
            print("Lựa chọn không hợp lệ")
    except ValueError:
        print("Vui lòng nhập một số")

if __name__ == "__main__":
    show_menu()

