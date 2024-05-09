#!/bin/bash
###############################################
### Author: Martin Hradsky                  ###
### MITRE ID: T1531                         ###
### Test steps:                             ###
###      Creating User                      ###
###      Adding him to the Wheel gropup     ###
###      Deleting user                      ###     
###############################################


# Step 1: Create user
echo "Creating user..."
sudo useradd test_user
if [ $? -ne 0 ]; then
    echo "Failed to create user."
    exit 1
fi
echo "User created successfully."
sleep 1

# Step 2: Add user to wheel group
echo "Adding user to wheel group..."
sudo usermod -aG wheel test_user
if [ $? -ne 0 ]; then
    echo "Failed to add user to wheel group."
    echo "Skipping deletion of user."
    exit 1
fi
echo "User added to wheel group successfully."
sleep 1

# Step 3: Delete user
echo "Deleting user..."
sudo userdel -r test_user
if [ $? -ne 0 ]; then
    echo "Failed to delete user."
    exit 1
fi
echo "User deleted successfully."

exit 0
