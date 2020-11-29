#!/bin/bash

first_Name(){

	read -p "Enter First Name keeping first letter as capital " firstName
	regex="^[A-Z]{1}[a-z]+$"
	if [[ $firstName =~ $regex ]]
	then
		echo $firstName
	else
		echo "Please Enter the Name with first letter as capital"
		first_Name
	fi
	

}

last_Name(){

	read -p "Enter last Name keeping first letter as capital " lastName
	regex="^[A-Z]{1}[a-z]+$"
	if [[ $lastName =~ $regex ]]
	then
		echo $lastName
	else
		echo "Please Enter with first letter as capital"
		last_Name
	fi
	
}

Address(){

	read -p "Enter the address keeping first letter as capital " streetName
	regex="^[A-Z]{1}[A-Za-z]+[ ]*[A-Za-z]*$"
	if [[ $streetName =~ $regex ]]
	then
		echo $streetName
	else
		echo "Please enter with first letter as capital"
		address
	fi

}

city(){

	read -p "Enter the City Name keeping first letter as capital " cityName
	regex="^[A-Z]{1}[A-Za-z]+$"
	if [[ $cityName =~ $regex ]]
	then
		echo $cityName
	else
		echo "Please enter with first letter as capital"
		address
	fi
	
}
zipCode(){

	read -p "Enter the zip Code in xyz-abc format " zip
	regex="^[0-9]{6}$"
	if [[ $zip =~ $regex ]]
	then
		echo $zip
	else
		echo "Please enter in xyz-abc format"
		zipCode
	fi
	
}

emailAddress(){

	read -p "Enter the email-Id " email
	regex="^[a-zA-Z0-9]+([._+-][a-zA-Z0-9]+)*@[a-zA-Z0-9]+[.][a-z]{2,4}([.][a-z]{2})*$"
	if [[ $email =~ $regex ]]
	then
		echo $email
	else
		echo "Please enter the email correctly"
		emailAddress
	fi
	

}

contactNumber(){

	read -p "Enter the contact Number " contact
	regex="^[0-9]{10}$"
	if [[ $contact =~ $regex ]]
	then
		echo $contact
	else
		echo "Invalid Contact Number"
		contactNumber
	fi
	


}
addRecord()
{
		firstName="$(first_Name)"
		lastName=$(last_Name)
		address=$(Address)
		cityName=$(city)
		zip=$(zipCode)
		email=$(emailAddress)
		mobileNumber=$(contactNumber)
		echo  $firstName,$lastName,$address,$cityName,$zip,$email,$mobileNumber >> addressbook.csv
		echo "The entry is successfully added to the address book."
		
}

echo "Welcome to the Address Book"

echo "Hello, what would you like to do with your address book?
	1) To Add Record 
	2) T Display Record 
	3) To Edit a Record 
	4) To Remove a Record
	5) To Search the Record "
	
read input

case $input in
	1) addRecord;;
	2) showRecord;;
	3) editRecord;;
	4) removeRecord;;
	5) searchRecord;;
	*) echo "Invalid Input! Please enter from the displayed options"
esac

echo "Thank you! Have a Great Day!"
