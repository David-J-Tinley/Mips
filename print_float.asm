.data
	b: .float 12.12

.text	
	li $v0, 2
	lwc1 $f12, b
	syscall