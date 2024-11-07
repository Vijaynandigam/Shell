#!/bin/bash

LOGS_FOLDER="/var/log/shell-scripts"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER





USERID=$(id -u)

#echo "user id is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo "$2 is ----FAILED" &>>$LOG_FILE
       exit 1
    else
       echo "$2 is....success" &>>$LOG_FILE
    fi     

}    

if [ $USERID -ne 0 ]

then
   echo " Please run this script with root privilages" &>>$LOG_FILE
   exit 1

fi



VALIDATE $?
       

for package in $@
do
   dnf list installed $package
   if [ $? -ne 0 ]
   then
     echo "$package is not installed, going to installit.." &>>$LOG_FILE
     dnf install $package -y
     VALIDATE $? "Installing package"
   else
     echo "  $package is already installed nothing to do" &>>$LOG_FILE
   fi  
done