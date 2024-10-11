ADDRESS_BOOK="addbook.txt"

while true; do
    echo "1. Create Address Book"
    echo "2. View Address Book"
    echo "3. Insert a Record"
    echo "4. Delete a Record"    
    echo "5. Modify a Record"
    echo "6. Exit"
    read -p "Enter Your Choice: " choice

    case $choice in
        1)
            if [ ! -f "$ADDRESS_BOOK" ]; then
                touch "$ADDRESS_BOOK"
                echo "Address Book Created"
            else
                echo "Address Book Already Exists"
            fi
            ;;
        
        2)
            if [ -f "$ADDRESS_BOOK" ]; then
                cat "$ADDRESS_BOOK"
            else
                echo "Address Book does not exist."
            fi
            ;;
         3)
            echo "Enter name:"
            read name
            echo "Enter phone number:"
            read phone
            echo "Enter email:"
            read email
            echo "Enter Address:"
            read add
            echo "$name,$phone,$email,$add" >> "$ADDRESS_BOOK"
            echo "Record added."
            ;;
         4) 
            echo "Enter the name of the record to delete:"
            read name
            grep -v "^$name," "$ADDRESS_BOOK" > temp.txt 
            mv temp.txt "$ADDRESS_BOOK"
            echo "Record deleted."
            ;;
	 5) 
	    echo "Enter the name of the record to update:"
            read name
            grep -v "^$name," "$ADDRESS_BOOK" > temp.txt 
            mv temp.txt "$ADDRESS_BOOK"
            echo "Enter new name: "
            read name
            echo "Enter new phone no.: "
            read phone
            echo "Enter email: "
            read mail
            echo "Enter Address:"
            read add
            echo "$name,$phone,$email,$add" >> "$ADDRESS_BOOK"
            echo "Record updated."
	    ;;
	 6)
	    echo "Exiting.."
	    exit
	    ;;
        
        *)
            echo "Invalid choice, please try again."
            ;;
    esac
done
