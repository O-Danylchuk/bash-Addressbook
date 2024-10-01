#!/bin/bash

file="addressbook.txt"

add_contact() {
	echo "Enter Name:"
	read name
        echo "Enter Phone Number:"
	read phone
	echo "Enter Email:"
	read email

	echo "$name;$phone;$email" >> $file
	echo "Contact added"

}

search_contact() {
	 echo "Enter text to search (name, phone, or email):"
	 read search_text

	 result=$(grep -i "$search_text" $file)
	 echo "$result" | while IFS=; read -r name phone email 
	 do
       	 	echo "_______________________________"
	       	echo "Name : $name"
		echo "Phone: $phone"	       
	       	echo "Email: $email"
	 	echo "_______________________________"
	 done
}

remove_contact() {
	echo "Enter name/phone No/email of a contact you want to remove"
	read info

	grep -i "$info" $file
	if [ $? -eq 1 ]; then
		echo "Contact not found"
		return
	fi

	sed -i "/$info/d" $file
	echo "Contact removed"
}

case "$1" in
	add)
		add_contact;;
	search)
		search_contact;;
	remove)	
		remove_contact;;
											              *)
		echo "Usage: $0 {add|search|remove}";;					
esac
