#
# Print user entered floating point number
# David J Tinley
# 09/16/2023
#

.data
	prompt: .asciiz "Enter a floating point number: "
	entered: .asciiz "You entered : "
	user_input: .float 0.0
	
.text
	li $v0, 4	       # 4 is syscall for 'print string'
	la $a0, prompt
	syscall
	
	li $v0, 6	       # 6 is syscall for 'read float'
	la $a0, user_input # result is stored in co-processor-1 $f0
	syscall

	li $v0, 4
	la $a0, entered
	syscall
	
	li $v0, 2    	   # 2 is syscall for 'print float'
	mov.s $f12, $f0    # move contents of register $f3 to register $f12
	syscall
	