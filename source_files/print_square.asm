#
# Print square with user input size
# David J Tinley
# 09/17/23
#

.data
	################################################
	prompt: .asciiz "Enter a size for the square. i.e. '4 for 4 x 4 size': "
	square_size: .word 0   # Integers are referred to as words (32-bit value)
	symbol: .asciiz "*"    # Null-terminated string
	new_line: .asciiz "\n" # new line character
	end: .asciiz "end\n"   # Null-terminated string
	################################################
	
.text
	################################################
	# display prompt
	li $v0, 4            # load 4 into $v0, 4 = syscall for print string
	la $a0, prompt       # load prompt string into argument register $a0
	syscall              # syscall to print string in terminal
	
	################################################
	# enter square size
	li $v0, 5            # load 5 into $v0, 5 = syscall for read integer
	la $a0, square_size  # load in square_size address into argument register $a0
	syscall              # syscall to read in integer from terminal
	
	################################################
	# store square_size
	la $t0, ($v0)        # copy address of square_size value into temporary register $t1
	
	################################################
	# define loop iteration counters
	addi $a1, $zero, 0   # initialize counter to 0. i.e: (i = 0)
	add $a2, $zero, $t0  # set $a2 with max counter size. i.e: (i < square_size)
	
	################################################
	# define row counters
	addi $t1, $zero, 1   # initialize row counter to 1 to adjust for first loop printed
	add $t2, $zero, $t0  # set $t2 to maximum rows
	
	################################################
	# define loop (i = 0; i < square_size; ++i)
	loop:
		beq $a1, $a2, rows # stop when $a1 == $a2, then go to next section
		
		li $v0, 4          # load 4 into $v0, 4 = syscall for print string
		la $a0, symbol 	   # load symbol into argument register $a0
		syscall            # print '*' character
		
		add $a1, $a1, 1    # increment $a1 by 1. i.e: (++i)
		
		j loop             # jump back to loop beginning
	
	################################################
	# check for number of rows and jump back to loop
	rows:
		beq $t1, $t2, done # stop when $t1 == $t2, then go to done function
		
		li $v0, 4          # load 4 into $v0, 4 = syscall for print string
		la $a0, new_line   # load new line character into argument register $a0
		syscall            # print new line character
		
		add $t1, $t1, 1    # increment row counter by 1
		addi $a1, $zero, 0 # resest loop counter before jump
	
		j loop             # jump back to loop beginning
	
	################################################
	# define end of program
	done:
		# print new line character
		li $v0, 4
		la $a0, new_line
		syscall
		
		# print 'end' at end of program
		li $v0, 4
		la $a0, end
		syscall
	
