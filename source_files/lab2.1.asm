#####################################################################
# Lab 2.1 - Computer Organization
# David J Tinley
# 10/02/2023
#
# Part 1:
# if [(x-y)>=w] {
#    x = y
# } else {
#    x = z
# }
# print x
#
#####################################################################

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

.macro end()
    li $v0, 10               # macro to end program. 10 = exit
    syscall                  # exit the program
.end_macro
#####################################################################

# DATA ##############################################################
.data
        .align 2 # align memory to 2^2, which is 4 for word alignment

    _w: .word 0  # 32 bit integers
    _x: .word 0  #       |
    _y: .word 0  #       |
    _z: .word 0  #       V

    _new_line: .asciiz "\n"                    # new line character
    _w_prompt: .asciiz "Enter a value for w: " # input prompt for variables
    _x_prompt: .asciiz "Enter a value for x: " #            |
    _y_prompt: .asciiz "Enter a value for y: " #            |
    _z_prompt: .asciiz "Enter a value for z: " #            V
      _result: .asciiz "X is now equal to: "   # print result
#####################################################################

# TEXT ##############################################################
.text
    main:
        print_string(_w_prompt) # print w input prompt
        input(_w)               # input value for w. stored in $v0
        la $s0, ($v0)           # transfer w value into $s0

        print_string(_x_prompt) # print x input prompt
        input(_x)               # input value for x. stored in $v0
        la $s1, ($v0)           # transfer x value into $s1

        print_string(_y_prompt) # print y input prompt
        input(_y)               # input value for y. stored in $v0
        la $s2, ($v0)           # transfer y value into $s2

        print_string(_z_prompt) # print z input prompt
        input(_z)               # input value for z. stored in $v0
        la $s3, ($v0)           # transfer z value into $s3

        sub $t0, $s1, $s2       # subtract x - y and store in $t0

        bge $t0, $s0, x_to_y    # if x >= w jump to x_to_y
        j   x_to_z              # else jump to x_to_z

    x_to_y:
        move $t0, $s2           # set x = y
        j    end                # jump to end of program

    x_to_z:
        move $t0, $s3           # set x = z

    end:
        print_string(_result)   # print result text
        print_int($t0)          # print x
        end()                   # exit the program







