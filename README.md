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

```text
/home/YOUR_USERNAME/
├── game_of_dockers.sh        # Main script file
├── docker-test/              # Test files directory
│   ├── Docker1/              # Files for first container
│   │   ├── file1.txt        # Sorted by size (smallest first)
│   │   └── file2.txt
│   ├── Docker2/              # Files for second container
│   │   ├── file3.txt        # First-come-first-served order
│   │   └── file4.txt
│   └── Docker3/              # Files for third container
│       ├── file5.txt        # Sorted by size (smallest first)
│       └── file6.txt
└── GAME_OF_DOCKERS.txt      # Output file (created by script)
```

## 🚀 Quick Start

### 1. Clone or Download
```bash
cd ~
# Make sure you're in home: pwd should show /home/YOUR_USERNAME
git clone <your-repo-url>
```
### **2. Navigate to Project Folder**
```bash
cd ~/game_of_dockers
```

### **3. Update 3 lines in script**

```bash
nano ~/game_of_dockers.sh
# Change lines 6-8 to:
FILES_CONTAINER1="./docker-test/Docker1"
FILES_CONTAINER2="./docker-test/Docker2"
FILES_CONTAINER3="./docker-test/Docker3"
```

### **4. Create Test Filest**
```bash
echo "Text from Container 1 - File 1" > ~/docker-test/Docker1/file1.txt
echo "Text from Container 1 - File 2" > ~/docker-test/Docker1/file2.txt
echo "Text from Container 2 - File 1" > ~/docker-test/Docker2/file3.txt
echo "Text from Container 2 - File 2" > ~/docker-test/Docker2/file4.txt
echo "Text from Container 3 - File 1" > ~/docker-test/Docker3/file5.txt
echo "Text from Container 3 - File 2" > ~/docker-test/Docker3/file6.txt
```

###  **4. Run the script**
```bash
# Make sure you're in project folder
cd ~/game_of_dockers
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
