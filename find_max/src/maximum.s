#purpose: this program finds the maximum number of a set of data items
#variables: the registers have the following uses
#	%edi - holds the index of the data item being examined
#	%ebx - largest item found
#	%eax - current data item
#the following memory locations are used:
#
# data_items - contains the item data A 0 is used to terminate the data


.section .data
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0
.section .text
.globl _start
_start:
mov1 $0, %edi #move 0 into the index register
movl data_items(.%edi,4), %eax #load the first byte of data
movl %eax, %ebx

start_loop:
cmpl $0, %eax  #check to see if weve hit the end
je loop_exit
incl %edi
movl data_items(,%edi,4), %eax
cmpl %ebx, %eax
jle start_loop

loop_exit:
# %ebx is the return balue, it already has the number in it
movl $1, %eax
int $0x80
