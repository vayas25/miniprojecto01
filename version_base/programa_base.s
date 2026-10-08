.data
dato1: .word 15                #numero de filas para el evento.
dato2: .word 20                #numero de asientos por fila.   
resultado1: .word 0        #se almacenara la capacidad total. 
resultado2: .word 0        #se guardara el resultado de la comparacion. 
.text
.globl main 
main: 
 # Cargar datos desde memoria a los registros temporales lw
lw $t0, dato1
lw $t1, dato2
# Realizar las operaciones correspondientes
mul $t2, $t0, $t1         #multiplicacion para saber la capacidad total 
seq $t3, $t0, $t1        #comparacion para saber si los dos valores son iguales
# Guardar resultados de vuelta en la memoria utilizando sw 
sw $t2, resultado1        #se guarda el valor 300 en resultado1
sw $t3, resultado2        #almacena el valor 0 en resultado2
#/fin del programa 
li $v0, 0 
jr $ra 
