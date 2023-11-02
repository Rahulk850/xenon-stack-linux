#!/bin/bash

# internsctl script

if [ "$1" == "--help" ]; then
    echo "Help for internsctl command:"
    echo "This command provides various functionalities for managing server resources and files."
    echo "Usage: internsctl [OPTIONS] COMMAND"
    echo "Options:"
    echo "    --help      Show this help message"
    echo "    --version   Show command version"
    echo "Commands:"
    echo "    cpu getinfo              Get CPU information"
    echo "    memory getinfo           Get memory information"
    echo "    user create <username>   Create a new user"
    echo "    user list                List all users"
    echo "    user list --sudo-only    List all users with sudo permissions"
    echo "    file getinfo [options] <filename>  Get information about a file"
    exit 0
fi

if [ "$1" == "--version" ]; then
    echo "internsctl version v0.1.0"
    exit 0
fi

if [ "$1" == "cpu" ] && [ "$2" == "getinfo" ]; then
    lscpu
    exit 0
fi

if [ "$1" == "memory" ] && [ "$2" == "getinfo" ]; then
    free
    exit 0
fi

if [ "$1" == "user" ] && [ "$2" == "create" ]; then
    if [ -z "$3" ]; then
        echo "Error: Please provide a username."
        exit 1
    fi
    sudo useradd $3
    echo "User $3 created successfully."
    exit 0
fi

if [ "$1" == "user" ] && [ "$2" == "list" ]; then
    if [ "$3" == "--sudo-only" ]; then
        getent group sudo | cut -d: -f4
    else
        getent passwd | cut -d: -f1
    fi
    exit 0
fi

if [ "$1" == "file" ] && [ "$2" == "getinfo" ]; then
    file_name=$4
    if [ "$3" == "--size" ] || [ "$3" == "-s" ]; then
        stat -c '%s' $file_name
    elif [ "$3" == "--permissions" ] || [ "$3" == "-p" ]; then
        ls -l $file_name | awk '{print $1}'
    elif [ "$3" == "--owner" ] || [ "$3" == "-o" ]; then
        ls -l $file_name | awk '{print $3}'
    elif [ "$3" == "--last-modified" ] || [ "$3" == "-m" ]; then
        stat -c '%y' $file_name
    else
        echo "Invalid option. Please use --size, --permissions, --owner, or --last-modified."
        exit 1
    fi
    exit 0
fi

echo "Invalid command. Use 'internsctl --help' for assistance."
exit 1


