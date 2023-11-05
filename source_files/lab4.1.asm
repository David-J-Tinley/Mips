#####################################################################
# Lab 4.1 - Computer Organization
# David J Tinley
# 11/03/2023
#
# Write and test an adding machine program that repeatedly reads in
# integers and adds them into a running sum. The program should stop
# when it gets an input that is zero, printing out the sum at that point
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
    .align 2           # align memory to 2^2, which is 4 for word alignment

    _integer: .word 0  # 32 bit integers

    _new_line:      .asciiz "\n"                                                 # new line character
    _input_prompt:  .asciiz "Enter an integer value to add or enter 0 to quit: " # input prompt for variables
    _current_value: .asciiz "The current value is: "                             # print current total
#####################################################################

# TEXT ##############################################################
.text
  main:

    li $t0, 1                      # initialize $t0 to 1, will be overwritten by user input
    li $t1, 0
    li $s0, 0                      # load 0 in to $s0, used  for checking if user input 0 on beq

    loop:
      beq $t0, $s0, end            # if $t0 == 0 jump to end label (i.e. user enters 0 to quit)
      
      print_string(_input_prompt)
      input(_integer)
      la $t0, ($v0)
      add $t1, $t1, $t0            # add the input integer at $t0 to the total in $t1
      print_string(_current_value)
      print_int($t1)
      print_string(_new_line)

      j loop                       # jump back to beginning of loop

    end:
      end()                        # end the program
###############################################################################
