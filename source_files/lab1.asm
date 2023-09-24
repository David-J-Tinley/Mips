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

.macro input(%num)          # macro for inputting integer
    li $v0, 5               # load syscall for reading integer
    la $a0, %num            # load address of integer to be input
    syscall                 # value stored in $v0
.end_macro

.macro print_result(%num)   # macro for printing result
    li $v0, 1               # load syscall for printing integer
    la $a0, (%num)          # load address of integer to be printed
    syscall
.end_macro
##################################################################


# DATA ###########################################################
.data
        .align 2            # align memory to 2^2, so 4 for word
                            # alignment must be declared before .word???
                            # declaration must also be literally aligned
                            # with .word???

    _f: .word 0             # 32 bit integer for f
    _g: .word 0             # 32 bit integer for g

    _new_line: .asciiz "\n"
    _f_prompt: .asciiz "Enter a value for f: "
    _g_prompt: .asciiz "Enter a value for g: "
    _answer:   .asciiz "Answer for f = g - (f + 5): "
##################################################################


# TEXT ###########################################################
.text

    li $t2, 0                   # load loop counter (i = 0)
    li $t3, 3                   # load max loop iterations (i < 3)

    loop:                       # loop through 3 times total

        beq $t2, $t3, exit      # branch to exit when $t2 == $t3

        li $t1, 5               # load immediate value 5 into $t1
                                # used for equation (_f + 5)

        print_string(_f_prompt) # print prompt for _f input

        input(_f)               # input value for f variable

        la $s1, ($v0)           # store value of _f into $s1

        print_string(_g_prompt) # print prompt for _g input

        input(_g)               # input value for g

        la $t0, ($v0)           # store value of _g into $t0

        add $s1, $t1, $s1       # $s1 = (_f + 5)

        sub $s1, $t0, $s1       # $s1 = _g - _f

        print_string(_answer)   # print string "Answer for f = g - (f + 5):"

        print_result($s1)       # print result

        print_string(_new_line) # print new line character

        addi $t2, $t2, 1        # increment $t2 by 1 (++i)

        j loop                  # jump back to top of loop


    # EXIT SYSCALL ###############################################
    exit:
        li  $v0, 10             # load syscall for program exit
        syscall

##################################################################
