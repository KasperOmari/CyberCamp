#!/bin/bash

echo "Starting setup for challenges..."

# Base directory for challenges
CHALLENGES_DIR=~/Desktop/challenges

# Create base directory
mkdir -p $CHALLENGES_DIR

# --- Session 1 Challenges ---
echo "Setting up Session 1 challenges..."
SESSION1_DIR=$CHALLENGES_DIR/session1
mkdir -p $SESSION1_DIR/file_finder_race/folder1/folder2

# File Finder Race
echo "You found the treasure!" > $SESSION1_DIR/file_finder_race/folder1/folder2/hidden.txt

# --- Session 2 Challenges ---
echo "Setting up Session 2 challenges..."
SESSION2_DIR=$CHALLENGES_DIR/session2

# Hidden File Hunt
mkdir -p $SESSION2_DIR/hidden_file_hunt/folder1/folder2
echo "Congrats! You found the hidden file!" > $SESSION2_DIR/hidden_file_hunt/folder1/folder2/.hidden.txt

# Organize the Chaos
ORGANIZE_DIR=$SESSION2_DIR/organize_the_chaos
mkdir -p $ORGANIZE_DIR
for i in {1..10}; do echo "Text file $i" > $ORGANIZE_DIR/file$i.txt; done
for i in {1..5}; do echo "Image file $i" > $ORGANIZE_DIR/image$i.jpg; done
for i in {1..3}; do echo "PDF file $i" > $ORGANIZE_DIR/document$i.pdf; done

# File Security Puzzle
SECURITY_DIR=$SESSION2_DIR/file_security_puzzle
mkdir -p $SECURITY_DIR
echo "Top secret message!" > $SECURITY_DIR/secret.txt
chmod 600 $SECURITY_DIR/secret.txt

# Secret Message Decoder
DECODER_DIR=$SESSION2_DIR/secret_message_decoder
mkdir -p $DECODER_DIR
echo "Decode this: VGhlIHBhc3N3b3JkIGlzIDEyMzQ=" > $DECODER_DIR/message_to_decode.txt

# --- Session 3 Challenges ---
echo "Setting up Session 3 challenges..."
SESSION3_DIR=$CHALLENGES_DIR/session3

# Mini-Challenge: Build Your Project Folder
PROJECT_DIR=$SESSION3_DIR/project_folder
mkdir -p $PROJECT_DIR/{assignments,notes,resources,submissions}
echo "Assignment 1 content" > $PROJECT_DIR/assignments/assignment1.txt
echo "Class notes" > $PROJECT_DIR/notes/class_notes.txt
echo "Research material" > $PROJECT_DIR/resources/research_material.pdf
touch $PROJECT_DIR/submissions/.gitignore

# Pre-created files for Advanced Commands section
BIG_FILES_DIR=$SESSION3_DIR/big_files
mkdir -p $BIG_FILES_DIR
echo "This is line 1" > $BIG_FILES_DIR/largefile.txt
for i in {2..100}; do echo "This is line $i" >> $BIG_FILES_DIR/largefile.txt; done

# File Hunt
HUNT_DIR=$SESSION3_DIR/file_hunt
mkdir -p $HUNT_DIR/{docs,reports,backups}
echo "Confidential report" > $HUNT_DIR/reports/secret_report.txt
echo "Backup file 1" > $HUNT_DIR/backups/.hidden_backup1.txt
echo "Important passwords" > $HUNT_DIR/docs/passwords.txt

# User & Group Management Challenge
USER_GROUP_DIR=$SESSION3_DIR/user_group_management
mkdir -p $USER_GROUP_DIR
echo "Confidential data for a new user" > $USER_GROUP_DIR/confidential.txt
chmod 600 $USER_GROUP_DIR/confidential.txt

# --- Session 4 Challenges ---
echo "Setting up Session 4 challenges..."
SESSION4_DIR=$CHALLENGES_DIR/session4

# Ping and Traceroute Challenge
NETWORK_DIR=$SESSION4_DIR/network_tools
mkdir -p $NETWORK_DIR
echo "Ping results: Check connectivity to a specific server." > $NETWORK_DIR/ping_results.txt
echo "Traceroute: Find the path to a specific server." > $NETWORK_DIR/traceroute_results.txt

# Nmap Challenge
NMAP_DIR=$SESSION4_DIR/nmap
mkdir -p $NMAP_DIR
echo "Run an nmap scan to discover devices in the classroom network." > $NMAP_DIR/instructions.txt

# Cybersecurity Basic Challenge
CYBERSEC_DIR=$SESSION4_DIR/cybersecurity_basics
mkdir -p $CYBERSEC_DIR
echo "Attempt to brute-force a simulated password (hint: use the provided dictionary)." > $CYBERSEC_DIR/instructions.txt
echo -e "1234\npassword\nletmein" > $CYBERSEC_DIR/dictionary.txt
echo "Correct password: password" > $CYBERSEC_DIR/target.txt

# Who’s on the Network Challenge
WHO_NETWORK_DIR=$SESSION4_DIR/whos_on_network
mkdir -p $WHO_NETWORK_DIR
echo "Identify devices on the network and map them to their owners." > $WHO_NETWORK_DIR/instructions.txt

# --- Session 6 Challenges ---
echo "Setting up Session 6 challenges..."
SESSION6_DIR=$CHALLENGES_DIR/session6_pwnagotchi
mkdir -p $SESSION6_DIR
# Wireshark Analysis
echo "Creating sample pcap file for Wireshark analysis..."
sudo apt-get update && sudo apt-get install -y tcpdump curl
tcpdump -i lo -w $SESSION6_DIR/sample.pcap "tcp port 80" > /dev/null 2>&1 &
sleep 2
curl "http://example.com/login?user=admin&pass=password123" > /dev/null 2>&1
pkill tcpdump

# --- Finalizing ---
echo "All challenges set up under: $CHALLENGES_DIR"
ls -R $CHALLENGES_DIR
