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
~/docker-test/
├── Docker1/file1.txt
├── Docker2/file2.txt
└── Docker3/file3.txt

## 🚀 Quick Start

### 1. Clone or Download
```bash
git clone <your-repo-url>
cd <repo-folder>
```

### **2. Create test files**
```bash
mkdir -p ~/docker-test/Docker{1,2,3}
echo "Test from Container 1" > ~/docker-test/Docker1/file1.txt
echo "Test from Container 2" > ~/docker-test/Docker2/file2.txt
echo "Test from Container 3" > ~/docker-test/Docker3/file3.txt
```

### **3. Update 3 lines in script**
Open gameofdockers.sh and change lines 6-8:

```bash
FILES_CONTAINER1="/home/YOUR_USERNAME/docker-test/Docker1"
FILES_CONTAINER2="/home/YOUR_USERNAME/docker-test/Docker2"
FILES_CONTAINER3="/home/YOUR_USERNAME/docker-test/Docker3"
```
Replace YOUR_USERNAME with your username (run whoami to check)

###  **4. Run the script**
```bash
chmod +x gameofdockers.sh
sudo ./gameofdockers.sh
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
To remove containers and files created by the script:
```bash
docker rm -f first_container second_container third_container
rm -f GAME_OF_DOCKERS.txt
```

### 👤 Author
Kyal Sin Hein 
