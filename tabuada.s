.data
	msg1:.asciiz"\nDigite um numero inteiro"
	msg2:.asciiz"\nNumero fora do parametro"
	msg3:.asciiz"\n"
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	add $t0, $v0, $zero

	ble $t0, 10, zer
	li $v0, 4
	la $a0, msg2
	syscall
	j main

zer:
	bgt $t0, 0, se
	li $v0, 4
	la $a0, msg2
	syscall
	j main

se:	
	add $t5, $t5, 1
	mul $t1, $t0, $t5

	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	li $v0, 5
	la $a0, msg3
	syscall

ble $t5, 10, se