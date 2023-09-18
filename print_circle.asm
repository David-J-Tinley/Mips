#
#
#
#
#

.data
	prompt: .asciiz "Enter a size for the square. i.e. '4 for 4 x 4 size': "
	circle_size: .byte
	symbol: .asciiz "*"
	
.text
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	la $a0, circle_size
	syscall
	
	li $v0, 4
	la $a0, symbol
	syscall
	
print_loop: 