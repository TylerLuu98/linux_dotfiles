#!/usr/bin/env python3
import os
import subprocess
import json
from pathlib import Path

# Đường dẫn đến các dự án 
PROJECT_DIRS = [
    os.path.expanduser("~/projects"),
    os.path.expanduser("~/work"),
    os.path.expanduser("~/github"),
    os.path.expanduser("~/dev")
]

# Cấu hình cho các loại dự án
PROJECT_TYPES = {
    "node": {
        "detect": ["package.json"],
        "layout": [
            {"title": "Editor", "command": "nvim", "layout": "main-vertical"},
            {"title": "Terminal", "command": "bash"},
            {"title": "Server", "command": "npm run dev", "if_exists": "package.json"},
        ]
    },
    "python": {
        "detect": ["requirements.txt", "setup.py", "pyproject.toml"],
        "layout": [
            {"title": "Editor", "command": "nvim", "layout": "main-vertical"},
            {"title": "Terminal", "command": "bash"},
            {"title": "Venv", "command": "if [ -d venv ]; then source venv/bin/activate; elif [ -d .venv ]; then source .venv/bin/activate; fi", "if_exists": "venv,.venv"},
        ]
    },
    "go": {
        "detect": ["go.mod"],
        "layout": [
            {"title": "Editor", "command": "nvim", "layout": "main-vertical"},
            {"title": "Terminal", "command": "bash"},
            {"title": "Go Run", "command": "echo 'Run with: go run .'", "layout": "horizontal"},
        ]
    },
    "docker": {
        "detect": ["docker-compose.yml", "docker-compose.yaml"],
        "layout": [
            {"title": "Editor", "command": "nvim", "layout": "main-vertical"},
            {"title": "Docker", "command": "echo 'Run with: docker-compose up'"},
            {"title": "Logs", "command": "echo 'View logs with: docker-compose logs -f'"},
        ]
    },
    "rust": {
        "detect": ["Cargo.toml"],
        "layout": [
            {"title": "Editor", "command": "nvim", "layout": "main-vertical"},
            {"title": "Terminal", "command": "bash"},
            {"title": "Cargo", "command": "echo 'Build with: cargo build'"},
        ]
    }
}

def find_projects():
    """Tìm tất cả các dự án trong các thư mục được cấu hình."""
    projects = []
    
    for project_dir in PROJECT_DIRS:
        if not os.path.exists(project_dir):
            continue
        
        for item in os.listdir(project_dir):
            path = os.path.join(project_dir, item)
            if os.path.isdir(path) and not item.startswith('.'):
                projects.append(path)
    
    return projects

def detect_project_type(project_path):
    """Phát hiện loại dự án dựa trên các file signature."""
    for project_type, config in PROJECT_TYPES.items():
        for signature in config["detect"]:
            if os.path.exists(os.path.join(project_path, signature)):
                return project_type
    
    return "generic"

def launch_project(project_path):
    """Khởi chạy dự án với cấu hình phù hợp."""
    project_type = detect_project_type(project_path)
    project_config = PROJECT_TYPES.get(project_type, {
        "layout": [
            {"title": "Editor", "command": "nvim", "layout": "main-vertical"},
            {"title": "Terminal", "command": "bash"}
        ]
    })
    
    print(f"Khởi chạy dự án: {os.path.basename(project_path)} (loại: {project_type})")
    
    # Tạo tab mới với tên dự án
    subprocess.run(["kitty", "@", "launch", "--type=tab", "--tab-title", os.path.basename(project_path)])
    
    # Đi đến thư mục dự án
    subprocess.run(["kitty", "@", "send-text", f"cd {project_path} && clear\n"])
    
    # Thiết lập layout nếu được cấu hình
    if "layout" in project_config and len(project_config["layout"]) > 0:
        first_config = project_config["layout"][0]
        if "layout" in first_config:
            subprocess.run(["kitty", "@", "goto-layout", first_config["layout"]])
        
        # Tạo cửa sổ và chạy lệnh cho các layout tiếp theo
        for i, layout_config in enumerate(project_config["layout"][1:], 1):
            # Kiểm tra điều kiện if_exists
            if "if_exists" in layout_config:
                exists = False
                for condition in layout_config["if_exists"].split(","):
                    if os.path.exists(os.path.join(project_path, condition.strip())):
                        exists = True
                        break
                if not exists:
                    continue
            
            # Tạo cửa sổ mới
            subprocess.run(["kitty", "@", "launch", "--location=vsplit", "--title", layout_config["title"]])
            
            # Đi đến thư mục dự án trong cửa sổ mới
            subprocess.run(["kitty", "@", "send-text", f"cd {project_path} && clear\n"])
            
            # Chạy lệnh được cấu hình
            if "command" in layout_config:
                subprocess.run(["kitty", "@", "send-text", f"{layout_config['command']}\n"])

def show_menu():
    """Hiển thị menu tương tác để chọn dự án."""
    projects = find_projects()
    
    if not projects:
        print("Không tìm thấy dự án nào trong các thư mục đã cấu hình.")
        return
    
    print("\n=== KITTY PROJECT LAUNCHER ===")
    print("Các dự án đã tìm thấy:")
    
    projects.sort(key=lambda p: os.path.basename(p).lower())
    for i, project in enumerate(projects, 1):
        project_type = detect_project_type(project)
        print(f"{i}. {os.path.basename(project)} [{project_type}]")
    
    try:
        idx = int(input("\nChọn dự án (số): ")) - 1
        if 0 <= idx < len(projects):
            launch_project(projects[idx])
        else:
            print("Lựa chọn không hợp lệ")
    except ValueError:
        print("Vui lòng nhập một số")

if __name__ == "__main__":
    show_menu()

