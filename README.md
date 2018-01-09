# Liquid-Galaxy
Google Code-In 2017-2018, Liquid Galaxy Task by Tarun Ravi

## Installation Files
For this process, we will use the below three code artifacts
+ lg_install.sh - this is a wrapper script that calls the main script
+ Install.sh - is the main install script
+ machine_list.dat is the config file

## Initial Prerequisites
We will start the installation process from the master node, logged in as user called lg and the below prerequisites have to be completed manually, to setup remote connectivity.

  a. ```sudo apt-get install openssh-server``` in all nodes
  
  b. ```ssh-keygen``` on the master node
  
  c. ```ssh-copy-id user@machine``` for each node, from master, to enable login without password
  
  d. add this line to /etc/sudoers file, for user(lg) to execute sudo without password ```lg ALL=(ALL) NOPASSWD: ALL```

## Configuration
The configuration file(machine_list.dat) should be downloaded to the master computer, to its home directory and filled with below details - Machine IP address, machine_ID, lg_frame. This is the same format, as the example text already in said file. 

IMPORTANT: There should not be any empty lines in the machine_list.dat file, and the master machine should be the last line.

## Installation
lg_install.sh has to be executed from the master computer, logged in as lg user. This script reads the machine info from the machine_list.dat file and for each machine, calls the main script - install.sh with the below 3 parameters - machine_ID, lg_frame, and total_machines.

The install process completes once the end of file has been reached.
