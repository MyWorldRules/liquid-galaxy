#!/bin/bash

#This script insalls liquid galaxy in multiple machines, listed in ~/machine_list.dat.
# Below are prerequisites -
# 
# To login to the remote machine, perform below - 
# a. sudo apt-get install openssh-server in all nodes
# b. ssh-keygen on the master node
# c. ssh-copy-id user@machine for each node, from master, to enable login without password
# d. add this line to /etc/sudoers file, for user(lg) to execute sudo without passwd
# lg	ALL=(ALL) NOPASSWD: ALL
#
# e. download the liquid galaxy install script on the master node
#
#
#read the machine names file, line by line

# while on master, prompt & capture all inputs

# Test for machine lsit file
if [ -f $HOME/machine_list.dat ]; then 
	echo ""
else 
	echo "$HOME/machine_list.dat does not exist...Abort!"
	exit 1
fi

TOTAL_MACHINES=`wc -l $HOME/machine_list.dat|awk '{print $1}'`
cat $HOME/machine_list.dat|while read line
do

#for each line extract field 1 and field 2
echo "reading next line..."
MACHINE_NAME=`echo $line|awk '{print $1}'`
MACHINE_ID=`echo $line|awk '{print $2}'`
MACHINE_FRAME=`echo $line|awk '{print $3}'`

echo "machine name - $MACHINE_NAME"
echo "machine ID - $MACHINE_ID"
echo "machine frame - $MACHINE_FRAME"
echo "total machines - $TOTAL_MACHINES"

#now run the instaltarlation steps on this machine
echo "installing liquid galaxy in $machine_name ..."

#Install cURL
sudo apt-get install curl
#2. download and execute the install script there

if [ $MACHINE_ID == "1" ]; then
#master, local install
$HOME/install.sh $MACHINE_ID $MACHINE_FRAME $TOTAL_MACHINES
#bash <(curl -s https://raw.githubusercontent.com/MyWorldRules/Liquid-Galaxy/master/install.sh $MACHINE_ID $MACHINE_FRAME $TOTAL_MACHINES)
else
#node-ssh to node and remote install
	#ssh $MACHINE_NAME 'bash -s' < bash <(curl -s https://raw.githubusercontent.com/LiquidGalaxyLAB/liquid-galaxy/master/install.sh $MACHINE_ID $MACHINE_FRAME $TOTAL_MACHINES)
ssh $MACHINE_NAME 'bash -s' < $HOME/install.sh $MACHINE_ID $MACHINE_FRAME $TOTAL_MACHINES
fi

echo "completed install"
echo " "


#go to the next line(machine)
done
