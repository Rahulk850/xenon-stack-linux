# xenon-stack-linux
creating linux custom scripting

.TH MYSCRIPT 1 "November 2023" "v0.1.0" "Myscript Manual Page"
.SH NAME
myscript \- a script for managing server resources and files
.SH SYNOPSIS
myscript [OPTIONS] COMMAND [ARGUMENT]
.SH DESCRIPTION
myscript is a script that provides various functionalities for managing server resources and files. It supports the following commands:
.TP
.B cpu getinfo
Get CPU information.
.TP
.B memory getinfo
Get memory information.
.TP
.B user create <username>
Create a new user with the specified username.
.TP
.B user list
List all the regular users on the system.
.TP
.B user list --sudo-only
List all the users with sudo permissions.
.TP
.B file getinfo [OPTIONS] <filename>
Get information about a file. Supported options include:
.RS
.TP
.B --size, -s
Display the size of the specified file.
.TP
.B --permissions, -p
Display the permissions of the specified file.
.TP
.B --owner, -o
Display the owner of the specified file.
.TP
.B --last-modified, -m
Display the last modified time of the specified file.
.RE
.SH OPTIONS
.TP
.B --help
Show help message.
.TP
.B --version
Show the script version.
.SH AUTHOR
Your Name

