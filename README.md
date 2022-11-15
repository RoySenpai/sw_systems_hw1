# Software Systems Course Assignment 1
### For Computer Science B.Sc Ariel University

**By Roy Simanovich and Dana Sharper**

## Description
This is a C program that requests an input of two positive integers
and returns all the prime, palindrome, strong and armstrong numbers
that are between those two numbers.

## Requirements
* Linux machine
* gcc

## Building
```
# Cloning the repo to local machine
git clone https://github.com/RoySenpai/sw_systems_hw1.git

# Building all the necessary files & the main programs
make all
```

## Makefile commands
### Libraries
* **make loops** – Compile the static library libclassloops.a, which uses loop methods.
* **make recursives** – Compile the static library libclassrec.a, which uses recursive methods.
* **make recursived** – Compile the dynamic library libclassrec.so which uses recursive methods..
* **make loopd** – Compile the dynamic library libclassloops.so, which uses loop methods.

### Main program
* **make mains** – Compile the main program and link the linked static library libclassrec.a.
* **make maindloop** – Compile the main program and link the linked static dynamic libclassloops.so.
* **make maindrec** – Compile the main program and link the linked static dynamic libclassrec.so.

### Project management
* **make all** – Compile whole project.
* **make clean** – Clean all compiled files & libraries.

## Running
```
# Runs the main program (recursive methods), linked with static library.
./mains

# Runs the main program (loop methods), linked with dynamic library.
./maindloop

# Runs the main program (recursive methods), linked with dynamic library.
./maindrec
```
