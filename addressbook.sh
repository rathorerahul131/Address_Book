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

displayRecord()
{
	
	while true
	do
		echo "To display a record, enter the Contact Number of the person."
		read input
		echo "The records for \"$input\" is :"
		grep "$input" addressbook.csv    
		returnStatus=`echo $?`
		if [ $returnStatus -eq 1 ]
		then
			echo "No records found with last name of \"$input\"."
		fi
		
	done
}

removeRecord()
{
	while true
	do
		echo "To remove a record, enter contact no. of the person."
		read input
		echo "Listing records for \"$input\":"
		grep -n "$input" addressbook.csv
		returnStatus=`echo $?`
		if [ $returnStatus -eq 1 ]
		then
			echo "No records found for \"$input\""
		else
			echo "Enter the line number of the record you want to remove."
			read lineNumber
			for line in `grep -n "$input" addressbook.csv`
			do
				number=`echo "$line" | cut -c1`
				if [ $number -eq $lineNumber ]
				then
					lineRemove="${lineNumber}d"
					sed -i -e "$lineRemove" addressbook.csv
					echo "The record was removed from the address book."
				fi
			done
		fi
	done
}

searchRecord()
{
	while true
	do
		echo "To search for a record, enter any search string, e.g. last name or email address (case sensitive)."
		read input
		echo "List records for \"$input\" is :"
		grep "$input" addressbook.csv
		returnStatus=`echo $?`
		if [ $returnStatus -eq 1 ]
		then
			echo "No records found for \"$input\"."
		fi
	done
}


editRecord()
{
	echo
	while true
	do
		echo "To edit a record, enter any search string, e.g. last name or email address (case sensitive)."
		read input
		echo "Listing records for \"$input\":"
		grep -n "$input" addressbook.csv
		ReturnStatus=`echo $?`
		if [ $ReturnStatus -eq 1 ]
		then
			echo "No records found for \"$input\""
		else
			echo "Enter the line number that you'd like to edit."
			read lineNumber
			for line in `grep -n "$input" addressbook.csv`
			do
				number=`echo "$line" | cut -c1`
				if [ $number -eq $lineNumber ]
				then
					echo "Enter the correct data in the below format:"
					echo "firstName,LastName,Address,City,Zipcode,email,Phone Number"
					read edit
					lineChange="${lineNumber}s"
					sed -i -e "$lineChange/.*/$edit/" addressbook.csv
					echo "The change has been made."
				fi
			done
		fi
		echo
	done		
}

viewAllRecords(){

		echo "Here is the list of all the records"
		cat addressbook.csv | sed -e 's/,,/, ,/g' | column -s, -t 


}

echo "Welcome to the Address Book"

echo "Hello, what would you like to do with your address book?
	1) To Add Record 
	2) T Display Record 
	3) To Edit a Record 
	4) To Remove a Record
	5) To Search the Record 
	6) To View all the Records"
	
read input

case $input in
	1) addRecord;;
	2) displayRecord;;
	3) editRecord;;
	4) removeRecord;;
	5) searchRecord;;
	6) viewAllRecords;;
	*) echo "Invalid Input! Please enter from the displayed options"
esac

echo "Thank you! Have a Great Day!"
