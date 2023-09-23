#
# Lab 1 - Computer Organization
# David J Tinley
# 09/22/2023
# Write a MIPS program to compute f = g - (f + 5)
#

# MACROS #########################################################
.macro print_string(%string) # macro for printing string parameter
	li $v0, 4                # load syscall for print string in $v0
	la $a0, %string          # load address of string to be printed
	syscall
.end_macro

.macro input(%num)          # macro for inputing integer
	li $v0, 5               # load syscall for reading integer
	la $a0, %num            # load address of integer to be input
	syscall                 # value stored in $v0
.end_macro
##################################################################

# DATA ###########################################################
.data
	_f: .word 0           # 32 bit integer for f
	_g: .word 0           # 32 bit integer for g
	
	_new_line: .asciiz "\n"
	_f_prompt: .asciiz "Enter a value for f: "
	_g_prompt: .asciiz "Enter a value for g: "
##################################################################

# ALIGNMENT ######################################################
.align 2 # align memory to 2^2, so 4 for word
##################################################################

# TEXT ###########################################################
.text

	print_string(_f_prompt)
	
	input(_f)




##################################################################