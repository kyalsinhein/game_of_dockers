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
## Step 1: Clone Repository
```bash
cd ~
git clone https://github.com/kyalsinhein/game_of_dockers.git
# Creates: ~/game_of_dockers/ folder
```

## Step 2: Navigate to Project
```bash
cd ~/game_of_dockers
```

## Step 3:  Create Project Directory Structure
```bash
mkdir -p ~/game_of_dockers/docker-test/Docker{1,2,3}
```

## Step 4: Create the Literary Files.
Make file creating script executable (This script file already included inside the project folder.)
```bash
chmod +x create_literary_files.sh
```
Then, run it
```bash
./create_literary_files.sh
```
## Step 5: Run the "game_of_dockers.sh"
To run the script the current path need to be like this "/home/YOUR_USERNAME/game_of_dockers"
(type "pwd" to look current location).Then, type
```bash
# Make script executable
chmod +x game_of_dockers.sh

# Run from project folder
sudo ./game_of_dockers.sh
```

## 📋 What Happens When You Run The Script
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

## EXPECTED FINAL OUTPUT IN GAME_OF_DOCKERS.txt:
```bash
The most important things are the hardest to say. They are the things you get ashamed of, because words diminish them — words shrink things that seemed limitless when they were in your head to no more than living size when they're brought out.
The most important things lie too close to wherever your secret heart is buried, like landmarks to a treasure your enemies would love to steal away.
That's the worst, I think. When the secret stays locked within not for want of a teller but for want of an understanding ear.
That's why it's a sin to kill a mockingbird.
"Your father's right," she said. "Mockingbirds don't do one thing except make music for us to enjoy.
That was the only time I ever heard Atticus say it was a sin to do something, and I asked Miss Maudie about it. They don't eat up people's gardens, don't nest in corn cribs, they don't do one thing but sing their hearts out for us.
Atticus said to Jem one day, "I'd rather you shot at tin cans in the backyard, but I know you'll go after birds.
Shoot all the blue jays you want, if you can hit 'em, but remember it's a sin to kill a mockingbird.
But it's more than that, isn't it? But one thing is certain. When you come out of the storm you won't be the same person who walked in. That's what this storm's all about.
Why? Because this storm isn't something that blew in from far away, something that has nothing to do with you. This storm is you. Something inside of you. And once the storm is over you won't remember how you made it through, how you managed to survive. You won't even be sure, in fact, whether the storm is really over.
"Sometimes fate is like a small sandstorm that keeps changing directions. You change direction but the sandstorm chases you. You turn again, but the storm adjusts. Over and over you play this out, like some ominous dance with death just before dawn."
So all you can do is give in to it, step right inside the storm, closing your eyes and plugging up your ears so the sand doesn't get in, and walk through it, step by step. There's no sun there, no moon, no direction, no sense of time. Just fine white sand swirling up into the sky like pulverized bones. That's the kind of sandstorm you need to imagine.
And you really will have to make it through that violent, metaphysical, symbolic storm. No matter how metaphysical or symbolic it might be, make no mistake about it: it will cut through flesh like a thousand razor blades.
Mockingbirds don't do one thing but sing their hearts out for us.
The storm is you. Something inside of you.
Words shrink things that seemed limitless.
It's a sin to kill a mockingbird.
Walk through the storm, step by step.
People will bleed there, and you will bleed too. Hot, red blood. You'll catch that blood in your hands, your own blood and the blood of others.
And you may make revelations that cost you dearly only to have people look at you in a funny way, not understanding what you've said at all, or why you thought it was so important that you almost cried while you were saying it.
```

## 🛠️ Requirements
- Docker installed (docker --version to check)
- Linux/macOS/WSL
- Sudo permissions

## 🔧 Fix Problems
- Docker not found? sudo apt install docker.io
- Permission denied? sudo usermod -aG docker $USER (then logout/login)
- Path errors? Check Step 2 paths are correct

## 🧹 Cleanup
# Remove Docker containers and Project Folder
```bash
# Go to project folder
cd ~/game_of_dockers

# 1. Remove Docker containers
docker rm -f first_container second_container third_container 2>/dev/null

# 2. Remove output file (in project folder)
rm -f GAME_OF_DOCKERS.txt

# 3. Remove test files (IN PROJECT FOLDER)
rm -rf docker-test

# 4. Optional: Clean Docker system
docker system prune -a -f 2>/dev/null

# 5. Remove project folder
cd ~
rm -rf ~/game_of_dockers

```

### 👤 Author
Kyal Sin Hein 
