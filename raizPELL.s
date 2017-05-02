.data
	msg1:.asciiz"\nDigite um numero inteiro"
	msg2:.asciiz"\nA raiz inteira e:"
.text
		#$t0=m, $t1=i, $t2=n
main:
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero

	add $t1, 1
	add $t2, $t2, $zero

enquanto:
	sub $t0, $t0, $t1
	add $t1, $t1, 2
	add $t2, $t2, 1

bge $t0, $t1, enquanto
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	