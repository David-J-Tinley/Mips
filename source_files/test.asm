


.text

	li $v0, 4 # 4 is the syscall code for 'print string'
	la $a0, x
	syscall
	
	
.data
	x: .asciiz "Hello World\n"










