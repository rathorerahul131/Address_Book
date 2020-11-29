#!/bin/bash

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
