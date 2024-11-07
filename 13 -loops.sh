#!/bin/bash

USERID=$(id -u)

#echo "user id is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo "$2 is ----FAILED"
       exit 1
    else
       echo "$2 is....success"
    fi     

}    

if [ $USERID -ne 0 ]

then
   echo " Please run this script with root privilages"
   exit 1

fi

dnf list installed git

VALIDATE $?
       

for package in $@
do
   dnf list installed $package
   if [ $? -ne 0 ]
   then
     echo "$package is not installed, going to installit.."
     dnf install $package -y
     VALIDATE $? "Installing package"
   else
     echo "  $package is already installed nothing to do"
   fi  
done