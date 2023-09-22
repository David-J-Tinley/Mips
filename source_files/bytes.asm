#
#
#
#
#

.macro print_ln()
	li $v0, 1
	lw $a0, _word
	syscall
.end_macro

.data
	_char_byte: .byte 'a'
	_word: .word 121
	
.align 2

.text
	la $t0, _char_byte

	li $t1, 2
	
	lw $t2, _char_byte
	
	lw $t3, _word
	
	sw $t1, _word # store value of $t1 into _word
	
	lw $t4, _word

	print_ln()