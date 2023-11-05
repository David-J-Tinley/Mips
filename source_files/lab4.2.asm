#####################################################################
# Lab 4.2 - Computer Organization
# David J Tinley
# 11/03/2023
# Write and test a program that reads in three integers and prints out
# the sum of the largest two of the three
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
    .align 2     # align memory to 2^2, which is 4 for word alignment

    _a: .word 0  # 32 bit integers
    _b: .word 0  #      |
    _c: .word 0  #      V

    _new_line:          .asciiz "\n"                                       # new line character
    _input_prompt:      .asciiz "Enter an integer value: "                 # input prompt for variables
    _largest_sum_value: .asciiz "The sum of the two largest integers is: " # print text for largest sum
#####################################################################

# TEXT ##############################################################
.text
  main:

    print_string(_input_prompt)
    input(_a)                   # input value for a
    la $t0, ($v0)               # store a in $t0

    print_string(_input_prompt)
    input(_b)                   # input value for b
    la $t1, ($v0)

    print_string(_input_prompt)
    input(_c)                   # input value for c
    la $t2, ($v0)
    ####################################

    blt $t0, $t1, branch_a_lt_b   # if a < b
    bgt $t0, $t1, branch_a_gt_b   # if a > b

    branch_a_gt_b:
      bgt $t1, $t2, branch_a_lt_b # if b > c
      add $t3, $t0, $t2           # else add a + c
      j end                       # jump to end

    branch_a_lt_b:
      bgt $t2, $t0, branch_c_gt_a # if c > a
      add $t3, $t0, $t1           # else add a + b
      j end                       # jump to end

    branch_c_gt_a:
      add $t3, $t1, $t2           # add b + c
      j end                       # jump to end

    end:
      print_string(_largest_sum_value)
      print_int($t3)              # print sum of two largest values
      end()                       # end the program
###############################################################################
