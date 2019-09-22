#Alejandro Gudiño Gallegos
#Ejercicio 1, Tarea 4

.data
Vector1: .word 1, 2, 3
Vector2: .word 6, 7, 8
Resultado: .word 0

.text
Main:
	la $s1, Vector1 #Cargar dirección de vector 1
	la $s2, Vector2 #Cargar dirección de vector 2
	la $s3, Resultado #Cargar dirección para resultado
	li $s0, 3 #Cargar valor de constante para K
	li $s4, 0 #Cargar constante para contador
	
for:	beq $s0, $s4, exit #Comparar si el contador y K son iguales
	jal multAndAccumulate
	addi $s4, $s4, 1 #Agregar uno al acumulador
	sw $s6, 0($s3) #Guardar el resultado final
	j for
	

multAndAccumulate: 
	move $t0, $s4 #Valor para recorrer el arreglo
	add $t0, $t0, $t0 #Doblar el valor del indice
	add $t0, $t0, $t0 #Doblar el valor del indice(*4)
	add $t1, $t0, $s1 #Combinar para obtener dirección
	add $t2, $t0, $s2 #Combinar para obtener direccion
	add $t6, $t0, $s3 #Combinar para obtener direccion
	lw $t3, 0($t1) #Obtener valor de vector 1
	lw $t4, 0($t2) #Obtener valor de vector 2
	mult $t3, $t4
	mflo $t5
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal Acumulate
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra

Acumulate:
	add $s6, $s6, $t5
	jr $ra
exit: 
	
	
	
	