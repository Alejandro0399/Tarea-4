#Alejandro Gudiño Gallegos
#Ejercicio 2, Tarea 4

.text
Main:
	li $s0, 0 #Cargar valor de constante, selesctor
	li $s1, 5 #Cargar valor de constante, es A
	li $s2, 3 #Cargar valor de constante, es B
	li $s3, 0 #Cargar valor de constante, es el resultado
	
	beq $s0, 1, suma #Si selector es 1, hace suma
	beq $s0, 2, resta #Si selector es 2, hace resta
	beq $s0, 3, multiplica #Si selector es 3, hace multiplicacion
	j andBitwise #Si no fue alguna anterior, hace and

suma:
	add $s3, $s1, $s2 #Suma de A y B, se guarda en C
	j exit #Break

resta:
	sub $s3, $s1, $s2 #Resta de A y B, se guarda en C
	j exit #Break
	
multiplica:
	mul $s3, $s1, $s2 #Multiplicacion de A y B, se guarda en C
	j exit #Break
	
andBitwise:
	and $s3, $s1, $s2 #And de A y B, se guarda en C
	j exit #Break
	
exit: #Fin del programa
	