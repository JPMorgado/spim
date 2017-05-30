.data
	msg1:.asciiz"\nDigite um numero OCTAL:"
	msg2:.asciiz"\nNumero em Decimal é:"
.text
main:
	#$t7=aux,$t6=p,$t5=i,$t4=pot,$t3=aux2,$t1=dec,$t0=n
	add $t0, $zero, $zero
	add $t1, $zero, $zero
	add $t3, $zero, $zero
	add $t4, $zero, $zero
	add $t5, $zero, $zero
	add $t6, $zero, $zero
	add $t7, $zero, $zero
	
	li $v0, 4
	la $a0, msg1
	syscall
	
	li $v0, 5
	syscall
	add $t0, $v0, $zero
		
	bge $t0, 1, enquanto 
	j main

enquanto:
	ble $t0, 10000, segue
	j main

segue:
	rem $t7, $t0, 10		#aux=n%10
	beq $t7, 8, main
	beq $t7, 9, main
	add $t6, $t6, 1			#p++
	add $t5, $zero, 1		#i=1
	add $t4, $zero, 1		#pot=1
	
pot:
	bge $t5, $t6, segue2	#i<=p
	mul $t4, $t4, 8			#pot=pot*8
	add $t5, $t5, 1			#i++
	ble $t5, $t6, pot		#i<=p

segue2:
	mul $t3, $t7, $t4		#aux2=aux*pot
	add $t1, $t1, $t3		#dec=dec+aux2
	div $t0, $t0, 10		#n=n/10
	bgt $t0, $zero, segue	#n>0
	
	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 1
	add $a0, $t1, $zero
	syscall