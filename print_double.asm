.data 
	c: .double 22.2222
	
.text
	li $v0, 3
	ldc1 $f12, c
	mov.d $f12, $f2 # not necessary, can print from %f12
	syscall