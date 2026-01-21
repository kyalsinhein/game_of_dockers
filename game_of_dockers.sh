#!/bin/bash

# ============================================================
# USER CONFIGURATION - CHANGE THESE PATHS BEFORE RUNNING
# ============================================================
# Replace these paths with your actual file locations
FILES_CONTAINER1="/home/YOUR_USERNAME/docker-test/Docker1"  # <-- CHANGE THIS
FILES_CONTAINER2="/home/YOUR_USERNAME/docker-test/Docker2"  # <-- CHANGE THIS  
FILES_CONTAINER3="/home/YOUR_USERNAME/docker-test/Docker3"  # <-- CHANGE THIS
# ============================================================

echo
echo
echo " ██     ██ ███████ ██       ██████   ██████  ███    ███ ███████  "
echo " ██     ██ ██      ██      ██       ██    ██ ████  ████ ██       "
echo " ██  █  ██ █████   ██      ██       ██    ██ ██ ████ ██ █████    "
echo " ██ ███ ██ ██      ██      ██       ██    ██ ██  ██  ██ ██       "
echo "  ███ ███  ███████ ███████  ██████   ██████  ██      ██ ███████  "
echo
echo
# Number of seconds to wait before starting the script
countdown=3

# Initial message
echo -n "The program will start in "

# Countdown loop
for (( i=countdown; i>0; i-- )); do
    echo -n "$i"
    sleep 1
    # Erase the current number by backspacing and using carriage return
    echo -ne "\rThe program will start in "
done

# Print the final message without a trailing backspace
echo "0"
echo "Starting the script now!"
echo
# Create and run conatiners
echo "Creating and Running Containers"
echo "==============================="
sudo docker container run -itd --name=first_container ubuntu
echo "First container created and run!"
sudo docker container run -itd --name=second_container ubuntu
echo "Second container created and run!"
sudo docker container run -itd --name=third_container ubuntu
echo "Third container created and run!"
echo

#Copy files to each containers - FIXED PATHS
echo "Copying Files To Each Container"
echo "==============================="
echo "Copying files from: $FILES_CONTAINER1"
sudo docker cp "$FILES_CONTAINER1" first_container:/root/Docker1/
echo "Copying files from: $FILES_CONTAINER2"
sudo docker cp "$FILES_CONTAINER2" second_container:/root/Docker2/
echo "Copying files from: $FILES_CONTAINER3"
sudo docker cp "$FILES_CONTAINER3" third_container:/root/Docker3/
echo

#Display Sorted Files - FIXED PATHS
echo "Files From First Container (Sorted By Smaller to Larger)"
echo "========================================================"
sudo docker exec first_container sh -c "cd /root/Docker1/ && find . -maxdepth 1 -type f -exec du -b {} + | sort -n"
echo
echo "Files From Second Container (First Come First Served)"
echo "====================================================="
sudo docker exec second_container sh -c "cd /root/Docker2/ && ls -l --block-size=1 | awk '{if (NR>1) printf \"%s\\t./%s\\n\", \$5, \$9}'"
echo
echo "Files From Third Container (Sorted By Smaller to Larger)"
echo "========================================================"
sudo docker exec third_container sh -c "cd /root/Docker3/ && find . -maxdepth 1 -type f -exec du -b {} + | sort -n"
echo

# Define and populate the array for first_container - FIXED PATHS
readarray -t container1 < <(sudo docker exec first_container sh -c "cd /root/Docker1/ && find . -maxdepth 1 -type f -exec du -b {} + | sort -n | awk -F/ '{print \$NF}'")

# Define and populate the array for second_container - FIXED PATHS
readarray -t container2 < <(sudo docker exec second_container sh -c "cd /root/Docker2/ && ls -1")

# Define and populate the array for third_container - FIXED PATHS
readarray -t container3 < <(sudo docker exec third_container sh -c "cd /root/Docker3/ && find . -maxdepth 1 -type f -exec du -b {} + | sort -n | awk -F/ '{print \$NF}'")

# Declare final file name
final_file="GAME_OF_DOCKERS.txt"

# Initialize counters for each container
flag1=0
flag2=0
flag3=0

# Write file contents in a round-robin 
echo "Writing Files From Each Container To '$final_file'"
echo "========================================================"

while (( $flag1 < "${#container1[@]}" ||  $flag2 < "${#container2[@]}" || $flag3 < "${#container3[@]}" )); do

        for (( i = 0; i < 2 && flag1 < "${#container1[@]}";)); do
            file_name="${container1[$flag1]}"
            sudo docker exec first_container sh -c "cat /root/Docker1/$file_name" >> "${final_file}"
            echo "Just finished writing '${file_name}' from first container to ${final_file}!"
            ((i++))
            ((flag1++))
        done
    
        for (( i = 0; i < 2 && flag2 < "${#container2[@]}";)); do
            file_name="${container2[$flag2]}"
            sudo docker exec second_container sh -c "cat /root/Docker2/$file_name" >> "${final_file}"
            echo "Just finished writing '${file_name}' from second container to ${final_file}!"
            ((i++))
            ((flag2++))
        done
   
        for (( i = 0; i < 2 && flag3 < "${#container3[@]}";)); do
            file_name="${container3[$flag3]}"
            sudo docker exec third_container sh -c "cat /root/Docker3/$file_name" >> "${final_file}"
            echo "Just finished writing '${file_name}' from third container to ${final_file}!"
            ((i++))
            ((flag3++))
        done
     
done

echo "Writing contents to $final_file has been completed!"


# Create the final file
touch "${final_file}"

echo

# Function to read the file
read_file() {
    echo
    cat "${final_file}"
    echo
}

# Function to remove text from the file
remove_text() {
    echo
    while true; do
        read -p "Please enter the word you want to remove: " input
        if grep -q "$input" "$final_file"; then
            sed -i "s/${input}//g" "$final_file"
            echo "'${input}' is removed from $final_file!"
            break
        else
            echo "Invalid input. The word '${input}' does not exist in the file. Please try again."
        fi
    done
    echo
}

# Function to add text to the file
add_text() {
    echo
    read -p "Please enter the text you want to add:" input
    echo "${input}" >> "$final_file"
    echo "'${input}' is added to $final_file!"
    echo
}

# Function to terminate the program
terminate_program() {
    countdown=3
    echo -n "The program will end in "
    for (( i=countdown; i>0; i-- )); do
        echo -n "$i"
        sleep 1
        echo -ne "\rThe program will end in " 
    done
    echo "0"
    echo "The program is ended!"
    exit 0
}

# Main loop
while true; do
    echo 
    echo "Please choose an option:"
    echo "1. Read Game of Dockers Chapter"
    echo "2. Remove text from Game of Dockers"
    echo "3. Add text to Game of Dockers"
    echo "4. Terminate the program"
    echo "Enter your choice (1-4):"
    read choice

    case $choice in
        1)
            read_file
            ;;
        2)
            remove_text
            ;;
        3)
            add_text
            ;;
        4)
            terminate_program
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done