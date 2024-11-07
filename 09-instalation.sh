#!/bin/bash

USERID=$(id -u)

echo "user id is: $USERID"

if [ $USERID -ne 0 ]

then
   echo " Please run this script with root privilages"
   exit 1

fi

dnf list installed git

if [ $? -ne 0 ]
then
  echo "git is not installed and going to install it..."
  dnf install git -y

else
  echo "Git is already installed nothing to do...."
fi   


dnf list installed mysql

if [ $? -ne 0 ]
then
   echo " MYSQL is not installed......and going to install"
   dnf install mysql -y
   if [ $? -ne 0 ]
   then 
      echo " MYSQL installation is falied...please check"
      exit 1 
   else 
       echo " MY sql installation is sucess..."

   fi

else 
   echo" MYSQL is already installed nothing to do..."
fi          
