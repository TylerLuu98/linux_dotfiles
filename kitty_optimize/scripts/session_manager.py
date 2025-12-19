#!/usr/bin/env python3
import os
import sys
import subprocess
from pathlib import Path
import json
from typing import List, Dict, Any

KITTY_CONFIG_DIR = os.path.expanduser("~/.config/kitty")
SESSIONS_DIR = os.path.join(KITTY_CONFIG_DIR, "sessions")

def ensure_directories():
    """Đảm bảo các thư mục tồn tại."""
    Path(SESSIONS_DIR).mkdir(parents=True, exist_ok=True)

def list_sessions() -> List[str]:
    """Liệt kê tất cả session đã lưu."""
    ensure_directories()
    return [f.stem for f in Path(SESSIONS_DIR).glob("*.conf")]

def save_session(name: str):
    """Lưu trạng thái hiện tại của kitty thành session."""
    ensure_directories()
    session_path = os.path.join(SESSIONS_DIR, f"{name}.conf")
    
    # Sử dụng kitty remote control để lấy dữ liệu 
    result = subprocess.run(
        ["kitty", "@", "ls"],
        capture_output=True, text=True
    )
    
    if result.returncode != 0:
        print(f"Lỗi khi lấy thông tin session: {result.stderr}")
        return False
    
    # Parse JSON output
    try:
        kitty_state = json.loads(result.stdout)
    except json.JSONDecodeError:
        print("Lỗi khi phân tích dữ liệu session")
        return False
    
    # Chuyển đổi trạng thái thành cấu hình session
    with open(session_path, "w") as f:
        f.write("# Kitty Session Configuration\n\n")
        
        for os_window in kitty_state:
            for tab in os_window["tabs"]:
                f.write(f"new_tab {tab.get('title', 'Tab')}\n")
                f.write("cd {}\n".format(os.environ.get("HOME", "")))
                
                for window in tab["windows"]:
                    cwd = window.get("cwd", os.environ.get("HOME", ""))
                    f.write(f"cd {cwd}\n")
                    f.write("launch\n")
                
                # Thiết lập layout cho tab
                f.write(f"layout {tab.get('layout', 'stack')}\n\n")
    
    print(f"Đã lưu session: {name}")
    return True

def load_session(name: str):
    """Tải một session đã lưu."""
    session_path = os.path.join(SESSIONS_DIR, f"{name}.conf")
    if not os.path.exists(session_path):
        print(f"Session không tồn tại: {name}")
        return False
    
    subprocess.run(["kitty", "@", "start-session", "--match", "all", session_path])
    print(f"Đã tải session: {name}")
    return True

def delete_session(name: str):
    """Xóa một session đã lưu."""
    session_path = os.path.join(SESSIONS_DIR, f"{name}.conf")
    if not os.path.exists(session_path):
        print(f"Session không tồn tại: {name}")
        return False
    
    os.remove(session_path)
    print(f"Đã xóa session: {name}")
    return True

def show_menu():
    """Hiển thị menu tương tác."""
    sessions = list_sessions()
    
    print("\n=== KITTY SESSION MANAGER ===")
    print("1. Lưu session hiện tại")
    print("2. Tải session đã lưu")
    print("3. Xóa session")
    print("4. Thoát")
    
    choice = input("\nChọn tùy chọn (1-4): ")
    
    if choice == "1":
        name = input("Tên session: ")
        save_session(name)
    elif choice == "2":
        if not sessions:
            print("Không có session nào đã lưu")
            return
        
        print("\nCác session đã lưu:")
        for i, session in enumerate(sessions, 1):
            print(f"{i}. {session}")
        
        try:
            idx = int(input("\nChọn session (số): ")) - 1
            if 0 <= idx < len(sessions):
                load_session(sessions[idx])
            else:
                print("Lựa chọn không hợp lệ")
        except ValueError:
            print("Vui lòng nhập một số")
    elif choice == "3":
        if not sessions:
            print("Không có session nào đã lưu")
            return
        
        print("\nCác session đã lưu:")
        for i, session in enumerate(sessions, 1):
            print(f"{i}. {session}")
        
        try:
            idx = int(input("\nChọn session để xóa (số): ")) - 1
            if 0 <= idx < len(sessions):
                delete_session(sessions[idx])
            else:
                print("Lựa chọn không hợp lệ")
        except ValueError:
            print("Vui lòng nhập một số")
    elif choice == "4":
        return
    else:
        print("Lựa chọn không hợp lệ")

if __name__ == "__main__":
    show_menu()

