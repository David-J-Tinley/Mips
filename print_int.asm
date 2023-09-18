

.data
	x: .word 123
	
.text
	li $v0, 1
	lw $a0, x
	syscall


