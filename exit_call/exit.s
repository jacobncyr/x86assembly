#PURPOSE: Simple Program that exits and returns a
#	  status code back tot he linux kernel
#

#INPUT:	none
#

#OUTPUT:  returns a status code. this can be viewed by typing
#	  echho $?
#	  after running the program

#VARIABLES:
#	   %eax holds the system call number
#	   (this is always the case)
#
#          %ebx holds the return status
.section .data
.section .text
.globl _start
_start:
mov $1, %eax  #this is the linux kernel command number (system call)
	      #for exiting a program
mov $0, %ebx  #this is the status number we will return the operating
	      # system. Change this around and it will return different
	      #things too. echo $?
int $0x80 #this wakes up the kernel to runt he exit command
