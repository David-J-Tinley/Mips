#################################################
# Lab 2.2 - Computer Organization
# David J Tinley
# 10/03/2023
#
# Swap the contents of two registers,
# assume there is only one additional register
# that can be destroyed.

# Your program should initially read values
# (of type integer, float or string) into registers.
# Next, it will swap the values read, then print the
# final contents of each register

#################################################

# MACROS ############################################################
.macro print_string(%string) # macro for printing strings
    li $v0, 4                # load syscall for print string into $v0
    la $a0, %string          # load address of string to be printed
    syscall                  # print the string
.end_macro

.macro input(%num)           # macro for inputting an integer
    li $v0, 5                # load syscall for reading in a integer
    la $a0, %num             # load address of integer to be input
    syscall                  # read in the integer
.end_macro

.macro print_int(%num)       # macro for printing an integer
    li $v0, 1                # load syscall for printing an integer
    la $a0, (%num)           # load address of integer to be printed
    syscall                  # print the integer
.end_macro

.macro swap(%num1, %num2)    # macro for swapping variables
    la $t2,   (%num1)        # load num1 into temporary storage $t2
    la %num1, (%num2)
    la %num2, ($t2)
.end_macro

.macro end()
    li $v0, 10               # macro to end program. 10 = exit
    syscall                  # exit the program
.end_macro
#####################################################################

# DATA ##############################################################
.data

    _w: .align 2  # w variable (32 bit integer)
         .word 0

    _x: .align 2  # x variable (32 bit integer)
         .word 0

    _t: .align 2  # temporary storage variable (32 bit integer)
         .word 0

    _new_line: .asciiz "\n"                    # new line character
    _w_prompt: .asciiz "Enter a value for w: " # input prompt for variable w
    _x_prompt: .asciiz "Enter a value for x: " # input prompt for variable x
    _x_result: .asciiz "X is now equal to: "   # print x result
    _w_result: .asciiz "W is now equal to: "   # print w result
#####################################################################

# TEXT ##############################################################
.text
    main:
        print_string(_w_prompt) # print w input prompt
        input(_w)               # input value for w. stored in $v0
        la $t0, ($v0)           # transfer w value into $t0

        print_string(_x_prompt) # print x input prompt
        input(_x)               # input value for x. stored in $v0
        la $t1, ($v0)           # transfer x value into $t1

        swap($t0, $t1)          # swap $t0 to $t1

        print_string(_w_result) # print w's new value
        print_int($t0)

        print_string(_new_line) # print new line character

        print_string(_x_result) # print x's new value
        print_int($t1)

        end()                   # exit the program
#####################################################################
















#
