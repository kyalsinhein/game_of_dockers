# 🐳 Docker Container Orchestration System

A Bash script demonstrating multi-container Docker orchestration with round-robin file processing.

## 🚀 Quick Start

### Prerequisites
- Docker installed and running
- Linux/macOS/WSL2 environment
- Sudo/Docker permissions

### Setup Instructions

**Step 1: Update paths in the script**
Edit `gameofdockers.sh` and change these lines at the top:

```bash
FILES_CONTAINER1="/path/to/your/Docker1/files"  # Change this
FILES_CONTAINER2="/path/to/your/Docker2/files"  # Change this  
FILES_CONTAINER3="/path/to/your/Docker3/files"  # Change this