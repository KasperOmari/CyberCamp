# CIRCLean - USB key sanitizer
From the [offical page](https://circl.lu/projects/CIRCLean/), this is how it's briefly defined:
> Malware regularly uses USB sticks to infect victims, and the abuse of USB sticks is a common vector of infection (as an example Lost USB keys have 66% chance of malware).
>
> CIRCLean is an independent hardware solution to clean documents from untrusted (obtained) USB keys / USB sticks. The device automatically converts untrusted documents into a readable but disarmed format and stores these clean files on a trusted (user owned) USB key/stick.
>
> The focus of CIRCLean is to establish document exchange even if the used transport layer (the USB stick) cannot be trusted or if there is a suspicion about whether the contained documents are free of malware or not. In the worst case, only the CIRCLean would be compromised, but not the computer reading the target (trusted) USB key/stick.
>
> The code runs on a Raspberry Pi (a small hardware device), which also means it is not required to plug the original USB key into a computer. CIRCLean can be seen as a kind of air gap between the untrusted USB key and your operational computer.
>
> CIRCLean does not require any technical prerequisites of any kind and can be used by anyone. CIRCLean is free software which can be audited and analyzed by third-parties. We also invite all organizations to actively reuse CIRCLean in their own products or contribute to the project.
## Steps to Setup on Raspberry Pi 4
1. git clone https://github.com/CIRCL/circlean-pi-gen | git clone --branch arm64 https://github.com/RPI-Distro/pi-gen.git
2. cd circlean-pi-gen
3. sudo apt install libarchive-tools xxd qemu-utils kpartx pigz
4. sudo ./build.sh
5. ?
