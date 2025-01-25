# CyberCamp Challenges and Fun Projects

Welcome to **CyberCamp's** Git repository on GitHub!
Here, you'll find a script that sets up the challenges for each session of the course, some fun simple projects to explore and play with on your Raspberry Pi, instructions, and more!

## How to run challenges setup script
```
curl -L https://raw.githubusercontent.com/KasperOmari/CyberCamp/refs/heads/main/challenges/setup_challenges.sh | bash
```

## How to Clone:
```
git clone https://github.com/KasperOmari/CyberCamp.git
```

## Fun Projects:
1. [**hello_world.py**](/fun-projects/hello_world.py): Customize your own "Hello World!"
2. [**magic_number_game.py**](/fun-projects/magic_number_game.py): Play a number guessing game.
3. [**turtle_shapes.py**](/fun-projects/turtle_shapes.py): Draw shapes with Turtle Graphics.
4. [**fun_facts.py**](/fun-projects/fun_facts.py): Learn random fun facts.
5. [**chatbot.py**](/fun-projects/chatbot.py): Chat with a simple chatbot.
6. [**snake.py**](/fun-projects/snake.py): Play with a simple snake game.

## Course Challenges Setup
[**setup_challenges.sh**](/challenges/setup_challenges.sh) script would automatically create a directory for each session that contains all of its challenges.


## Pwnagotchi
Below are the steps to setup pwnagotchi on your Raspberry Pi and connect to it from your PC.

### Setup Steps
1. Download pwnagotchi image that works for your Raspberry Pi Zero W 2 from [here](https://pwnagotchi.org/3rd-party-images/index.html)
2. Plugin your SD card into your PC
3. Use [Raspberr Pi Imager](https://www.raspberrypi.com/software/) to write pwnagotchi image into your SD card
4. Once the image is written, plug the SD card into your Raspberry Pi, connect it using USB <-> Micro-USB cable (That supports data transfer) with your PC. *Make sure to connect it on the USB port, not power port*.

#### Windows
The following steps are only related to windows, where Linux/MacOs devices would need simpler steps to connect (only netwerk configuration part).
1. Download RNDIS driver from [here](https://www.factoryforward.com/pi-zero-w-headless-setup-windows10-rndis-driver-issue-resolved/)
2. Uncompress the downloaded file, you should have a folder that contains 2 files in it.
3. Go to "Device Manager", then Go to "Ports" section.
4. You should find an item called something like: "USB Serial Device (COM**X**)".
5. Right-Click on it and select "Update Driver".
6. Select "Browse my computer for driver software".
7. Click on "Browse" and navigate to select the uncompressed folder from "Step #2" and continue, now you have new "Network Adapter" called "USB Ethernet/RNDIS Gadget", which will help you connect to your pwnagotchi.
8. Go to "Network Connections"
9. Right-Click the Ethernet connection that has "USB Ethernet/RNDIS Gadget" name, and select properties.
10. Scroll down and select "Internet Protocol Version 4 (TCP/IPv4)", and click on properties.
11. Click on "Use the following IP address, and enter the following information:
    1. IP address: 10.0.0.1
    2. Subnet mask: 255.255.255.0
13. Under use the following DNS server addresses, enter the following information:
    1. Preferred DNS server: 8.8.8.8
    2. [Optional] Alternative DNS server: 1.1.1.1

### Connect
Once the setup is done, pwnagotchi should be reachable on `10.0.0.2` IP address. So, we should be able to SSH into it with its default credentials: 
- Username: pi
- Password: raspberry
```
ssh pi@10.0.0.2
```

## Other resources
Refer to the [resources](/resources/README.md) for more resources that can help you proceed byond just this course with your learning journey! 
