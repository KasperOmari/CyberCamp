#!/bin/bash

echo "Starting Challenge Setup..."
BASE_DIR=~/challenges

# Create base directory for all challenges
mkdir -p $BASE_DIR

# --- Session 1 Challenges ---
echo "Setting up Session 1 challenges..."
SESSION1_DIR=$BASE_DIR/session1
mkdir -p $SESSION1_DIR/mystery/folder1/folder2

# File Finder Race
echo "Congrats! You found me!" > $SESSION1_DIR/mystery/folder1/folder2/hidden.txt

# --- Session 2 Challenges ---
echo "Setting up Session 2 challenges..."
SESSION2_DIR=$BASE_DIR/session2
mkdir -p $SESSION2_DIR/mystery/folder1/folder2

# Hidden File Hunt
echo "Congrats! You found me!" > $SESSION2_DIR/mystery/folder1/folder2/.hidden.txt

# Secret Message Decoder
echo "The key is 42!" > $SESSION2_DIR/secret_message.txt
chmod 000 $SESSION2_DIR/secret_message.txt

# Pre-created files for Understanding Files section
mkdir -p $SESSION2_DIR/files
echo "Hello, World!" > $SESSION2_DIR/files/sample.txt
echo "#!/bin/bash" > $SESSION2_DIR/files/script.sh
echo "echo 'This is a script!'" >> $SESSION2_DIR/files/script.sh
chmod +x $SESSION2_DIR/files/script.sh

# --- Session 3 Challenges ---
echo "Setting up Session 3 challenges..."
SESSION3_DIR=$BASE_DIR/session3
mkdir -p $SESSION3_DIR/logs

# Threat Analysis Simulation
echo "Accepted password for pi from 192.168.1.100 port 22 ssh2" > $SESSION3_DIR/logs/auth.log
echo "Accepted password for pi from 192.168.1.101 port 22 ssh2" >> $SESSION3_DIR/logs/auth.log
echo "Accepted password for pi from 192.168.1.102 port 22 ssh2" >> $SESSION3_DIR/logs/auth.log
echo "Failed password for root from 192.168.1.200 port 22 ssh2" >> $SESSION3_DIR/logs/auth.log

# Pre-created files for Advanced Commands section
mkdir -p $SESSION3_DIR/files
echo "This is line 1" > $SESSION3_DIR/files/largefile.txt
for i in {2..100}; do echo "This is line $i" >> $SESSION3_DIR/files/largefile.txt; done

# --- Session 4 Challenges ---
echo "Setting up Session 4 challenges..."
SESSION4_DIR=$BASE_DIR/session4
mkdir -p $SESSION4_DIR

# Wireshark Analysis
echo "Creating sample pcap file for Wireshark analysis..."
sudo apt-get update && sudo apt-get install -y tcpdump curl
tcpdump -i lo -w $SESSION4_DIR/sample.pcap "tcp port 80" > /dev/null 2>&1 &
sleep 2
curl "http://example.com/login?user=admin&pass=password123" > /dev/null 2>&1
pkill tcpdump

# Who’s on the Network
echo "Preparing network discovery challenge..."
# Nothing additional required here; students will use network tools.

# --- Finalizing ---
echo "Challenge setup complete!"
echo "All challenges are available in: $BASE_DIR"
ls -R $BASE_DIR
