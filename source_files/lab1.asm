#
# Lab 1 - Computer Organization
# David J Tinley
# 09/22/2023
# Write a MIPS program to compute f = g - (f + 5)
#

# Macros
.macro print_line()
	li $v0, 4
	la $a0, _new_line
	syscall
.end_macro

# Data
.data
	_f: .word 0
	_g: .word 0
	
	_new_line: .asciiz "\n"











