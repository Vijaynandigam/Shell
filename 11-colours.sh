#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

#echo "user id is: $USERID"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
       echo -e "$2 is ----$R FAILED $N"
       exit 1
    else
       echo "$2 is....$G success $N"
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
