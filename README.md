# 🐳 Game of Dockers – Multi-Container File Processor

A Bash script that demonstrates **round-robin file processing across multiple Docker containers**.  
It creates three Ubuntu containers, distributes text files among them, and merges their contents into a single file using a balanced scheduling algorithm.

## 🎯 Purpose

This script simulates a **distributed file processing system** where:
- Files are stored across multiple containers
- Processing happens in **round-robin batches** (2 files per container per round)
- Final output is merged into `GAME_OF_DOCKERS.txt`
- Interactive menu allows real-time text editing

## 📁 Project Structure

After cloning, your structure will look like:
```text
/home/YOUR_USERNAME/
└── game_of_dockers/         # Project folder (created by git clone)
    ├── game_of_dockers.sh   # Main script file
    ├── docker-test/         # Test files directory (create this)
    │   ├── Docker1/         # Files for first container
    │   │   ├── file1.txt   # Sorted by size (smallest first)
    │   │   └── file2.txt
    │   ├── Docker2/         # Files for second container
    │   │   ├── file3.txt   # First-come-first-served order
    │   │   └── file4.txt
    │   └── Docker3/         # Files for third container
    │       ├── file5.txt   # Sorted by size (smallest first)
    │       └── file6.txt
    ├── README.md           # This documentation
    └── GAME_OF_DOCKERS.txt # Output file (created when run)
```
## 🚀 Quick Start
# Step 1: Clone Repository
```bash
cd ~
git clone <your-repo-url>
# Creates: ~/game_of_dockers/ folder
```

# Step 2: Navigate to Project
```bash
cd ~/game_of_dockers
```

# Step 3: Configure Script Paths
```bash
# Edit the script
nano game_of_dockers.sh

# Change lines 6-8 to USE RELATIVE PATHS:
FILES_CONTAINER1="./docker-test/Docker1"
FILES_CONTAINER2="./docker-test/Docker2"
FILES_CONTAINER3="./docker-test/Docker3"

# Save: Ctrl+X, Y, Enter
```

## Step 4: Create Test Files INSIDE Project Folder
```bash
# Create folder structure INSIDE project folder
mkdir -p docker-test/Docker{1,2,3}

# Create test files (minimum 2 per container)
echo "Text from Container 1 - File 1" > docker-test/Docker1/file1.txt
echo "Text from Container 1 - File 2" > docker-test/Docker1/file2.txt
echo "Text from Container 2 - File 1" > docker-test/Docker2/file3.txt
echo "Text from Container 2 - File 2" > docker-test/Docker2/file4.txt
echo "Text from Container 3 - File 1" > docker-test/Docker3/file5.txt
echo "Text from Container 3 - File 2" > docker-test/Docker3/file6.txt
```

## Step 5: Run the Script
```bash
# Make script executable
chmod +x game_of_dockers.sh

# Run from project folder
sudo ./game_of_dockers.sh
```

## 📋 What Happens
1. Countdown – Script starts after 3 seconds
2. Containers Created – Three Ubuntu containers named:
   - first_container
   - second_container
   - third_container

3. Files Copied – Your local files are copied into each container
4. File Listing – Displays files from each container (sorted by size)
5. Round-Robin Processing – Writes 2 files from each container in turns to GAME_OF_DOCKERS.txt
6. Interactive Menu – You can:
   - View the merged file
   - Remove text from the file
   - Add text to the file
   - Exit with countdown

## 🛠️ Requirements
- Docker installed (docker --version to check)
- Linux/macOS/WSL
- Sudo permissions

## 🔧 Fix Problems
- Docker not found? sudo apt install docker.io
- Permission denied? sudo usermod -aG docker $USER (then logout/login)
- Path errors? Check Step 2 paths are correct

## 🧹 Cleanup
# Remove Docker containers
```bash
# Remove Docker containers
docker rm -f first_container second_container third_container

# Remove output file
rm -f GAME_OF_DOCKERS.txt

# Remove test files (optional)
rm -rf ~/docker-test

# Clean Docker system (optional)
docker system prune -a -f
```

### 👤 Author
Kyal Sin Hein 
