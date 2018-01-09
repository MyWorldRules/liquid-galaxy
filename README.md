# Liquid-Galaxy
Google Code-In 2017-2018, Liquid Galaxy Task by Tarun Ravi

## Installation Files
For this process, we will use the below three code artifacts:
+ lg_install.sh - this is a wrapper script that calls the main script - - took some time to figure this out, I had to look at few examples on the internet. The wrapper makes the code generic and to retain existing scripts with very few changes.

+ install.sh - is the main install script - I changed the script to accept parameters and commented out unwanted lines.

+ machine_list.dat is the config file - it took some time to figure this out, I had to look at few examples online. An alternative is to prompt for these details and ask the user to input.

## Prerequisites
We will start the installation process from the master node, logged in as a user called lg and the below prerequisites have to be completed manually, to setup remote connectivity. I don't know how to automate this, as connectivity between nodes should have been established before we start the install process. I had to read through examples from the internet and tested it out in my virtual machines.

  a. ```sudo apt-get install openssh-server``` in all nodes
  
  b. ```ssh-keygen``` on the master node
  
  c. ```ssh-copy-id user@machine``` for each node, from master, to enable login without password
  
  d. Add this line to /etc/sudoers file, for user(lg) to execute sudo without password ```lg ALL=(ALL) NOPASSWD: ALL```
  This step was challenging as we cannot directly edit this file. The recommended way to edit this file is ```sudo visudo```


## Configuration
The configuration file (machine_list.dat) should be downloaded to the master computer, to its home directory and filled with below details - Machine IP address, machine_ID, lg_frame. This is the same format, as in the example text already in said file. 

IMPORTANT: There should not be any empty lines in the machine_list.dat file and the master machine must be in the last line.

## Installation
lg_install.sh has to be downloaded and executed from the master computer, logged in as lg user. This script reads the machine info from the machine_list.dat file and for each machine, calls the main script - install.sh with the following three parameters - machine_ID, lg_frame, and total_machines.

The install process completes once the end of file has been reached.
