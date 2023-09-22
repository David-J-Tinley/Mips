.data
	prompt: .asciiz "Enter your name: "
	message: .asciiz "Hello "
	user_input: .space 10 # 10 is just an initialization, can be overwritten at line: 13
	
.text
	li $v0, 4 # load mips system service call number: 4 = print string
	la $a0, prompt
	syscall
	
	li $v0, 8
	la $a0, user_input
	li $a1, 10
	syscall
	
	li $v0, 4
	la $a0, message
	syscall
	
	li $v0, 4
	la $a0, user_input
	syscall
	
