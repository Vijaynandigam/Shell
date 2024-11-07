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

if [ $? -ne 0 ]
then
  echo "git is not installed and going to install it..."
  dnf install git -y
  VALIDATE $? "Installing git"

else
  echo "Git is already installed nothing to do...."
fi   


dnf list installed mysql

if [ $? -ne 0 ]
then
   echo " MYSQL is not installed......and going to install"
   dnf install mysql -y
   VALIDATE $? "Installing mySQL"

else 
   echo "MYSQL is already installed nothing to do..."
fi          
