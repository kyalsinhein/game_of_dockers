# 🐳 Docker File Processor

"**game_of_dockers**" is a Bash script that automates multi-container file processing using Docker. It creates three Ubuntu containers, distributes text files among them, and implements a round-robin scheduling algorithm to process files in balanced batches.
## 🚀 3 Steps to Run

### **1. Create test files**
```bash
mkdir -p ~/docker-test/Docker{1,2,3}
echo "Test from Container 1" > ~/docker-test/Docker1/file1.txt
echo "Test from Container 2" > ~/docker-test/Docker2/file2.txt
echo "Test from Container 3" > ~/docker-test/Docker3/file3.txt
```

### **2. Update 3 lines in script
Open gameofdockers.sh and change lines 6-8:

```bash
FILES_CONTAINER1="/home/YOUR_USERNAME/docker-test/Docker1"
FILES_CONTAINER2="/home/YOUR_USERNAME/docker-test/Docker2"
FILES_CONTAINER3="/home/YOUR_USERNAME/docker-test/Docker3"
```
Replace YOUR_USERNAME with your username (run whoami to check)

###  **3. Run the script
```bash
chmod +x gameofdockers.sh
sudo ./gameofdockers.sh
```

## 📋 What Happens
1. Creates 3 Docker containers
2. Copies your files to each container
3. Processes files in round-robin order (2 files/container/round)
4. Creates GAME_OF_DOCKERS.txt output
5. Shows menu to view/edit the file

## 🛠️ Requirements
- Docker installed (docker --version to check)
- Linux/macOS/WSL
- Sudo permissions

## 🔧 Fix Problems
- Docker not found? sudo apt install docker.io
- Permission denied? sudo usermod -aG docker $USER (then logout/login)
- Path errors? Check Step 2 paths are correct

👤 Author
Kyal Sin Hein 
