#!/bin/bash

# LIST FN
list_files() {
    echo "Listing all files in the current directory:"
    ls -la | sort
}

# COPY FN
copy_file() {
    echo "Enter source file OR directory:"
    read source
    echo "Enter directory where you want the stuff to be: "
    read destination
    if [ -e "$source" ]; then
        cp -r "$source" "$destination"
        echo "Done! I've copied $source to $destination."
    else
        echo "I couldn't find the source you specified! Please try again."
    fi
}

# MOVE FN
move_file() {
    echo "Enter source file or directory:"
    read source
    echo "Enter directory where you want the stuff to be moved to: "
    read destination
    if [ -e "$source" ]; then
        if [ -e "$destination" ]; then
            if [ -d "$destination" ]; then
                if [ ls -A "$destination" ]; then
                    echo "Destination exists and isn't empty. Should I Overwrite? (y/n)"
                    read confirm
                    if [ "$confirm" != "y" ]; then
                        echo "Nevermind! Job canceled."
                        return
                    fi
                fi
            fi
        fi
        mv "$source" "$destination"
        echo "Success! I moved $source to $destination."
    else
        echo "I couldn't find the source you specified! Please try again."
    fi
}

# DEL FN
delete_file() {
    echo "Enter file or directory to delete (Must be non-hidden for obvious reasons) :"
    read file
    if [[ "$file" == .* ]]; then
        echo "Ayoooo!!! Don't try to delete hidden files! They might be important!"
        return
    fi
    if [ -e "$file" ]; then
        echo "Ya sure ya want to delete $file? (y/n)"
        read confirm
        if [ "$confirm" = "y" ]; then
            rm -r "$file"
            echo "Deleted $file."
        else
            echo "Didn't delete."
        fi
    else
        echo "I couldn't find the file :("
    fi
}

# MENU SCREEN
while true; do
    echo "Welcome aboard! Choose an option:"
    echo "1. List files"
    echo "2. Copy file"
    echo "3. Move file"
    echo "4. Delete file"
    echo "5. Exit"
    read option

    case $option in
        1) list_files ;;
        2) copy_file ;;
        3) move_file ;;
        4) delete_file ;;
        5) echo "Sayonara fam!" ; exit 0 ;;
        *) echo "Invalid option, please try again." ;;
    esac
done

