# Liquid-Galaxy
Google Code-In 2017-2018, Liquid Galaxy Task by Tarun Ravi

## Installation Files
For this process, we will use the below three code artifacts. Download these from GitHub and save it on the master node, user’s home directory:
+ lg_install.sh - this is a wrapper script that calls the main script - - took some time to figure this out, I had to look at few examples on the internet. The wrapper makes the code generic and to retain existing scripts with very few changes.

+ install.sh - is the main install script - I changed the script to accept parameters and commented out unwanted lines.

+ machine_list.dat is the config file - took some time to figure this out, I had to look at few examples on the internet. An Alternative is to prompt for these details and ask the user to input.

Prerequisites
We will start the installation process from the master node, logged in as user called lg and the below prerequisites have to be completed manually, to setup remote connectivity. - I do not know how to automate this, as connectivity between nodes should have been established before we start the install process.I had to read through examples from the internet and tested out in my virtual machines.

  a. ```sudo apt-get install openssh-server``` in all nodes
  
  b. ```ssh-keygen``` on the master node
  
  c. ```ssh-copy-id user@machine``` for each node, from the master, to enable login without password
  
  d. Add this line to /etc/sudoers file, for user(lg) to execute sudo without password ```lg ALL=(ALL) NOPASSWD: ALL``` This step was     challenging as we cannot directly edit this file. The recommended way to edit this file is ```- sudo visudo```
  
  
## Configuration
It is recommended to update the system so that the liquid galaxy installer can run quicker.

```sudo apt-get update```

```sudo apt-get upgrade```

The 3 artifacts need to be downloaded from GitHub to the master node, user’s home directory.
To grant execute privileges, do 

```chmod u+x install.sh```

```chmod u+x lg_install.sh```

The configuration file (machine_list.dat) should be downloaded to the master computer, to its home directory and filled with below details - Machine IP address, machine_ID, lg_frame. This is the same format, as the example text already in said file. 

IMPORTANT: There should not be any empty lines, and the master machine should be the last line. I had to make the master node the last one as reboot is required at the end of install.

## Installation
lg_install.sh has to be executed from the master computer, logged in as lg user. This script reads the machine info from the machine_list.dat file and for each machine, calls the main script - install.sh with the below 3 parameters - machine_ID, lg_frame, and total_machines. After installation, each machine will be rebooted.

The install process completes once the end of file has been reached.
