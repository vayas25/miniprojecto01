.data 
dato1:        .word 15                 #numero de filas para el evento.
dato2:  .word 20                #numero de asientos por fila. 
msg_coincide:        .asciiz "filas y asientos coinciden"                         #mensaje si es que son iguales
.text
.globl main 
main: 
 # Cargar datos desde memoria a los registros temporales lw
lw $t0, dato1
lw $t1, dato2
#comparacion extra
beq $t0, $t1, son_iguales                #Si t0 y t1 son similares, da como resultado el mensaje "son iguales".
#CASO SI ES QUE NO SON SIMILALRES
mul $t2, $t0, $t1                #calcula la capacidad total.
#preparar llamada al sistema para que imprima un numero entero 
li $v0, 1                #codigo 4 para imprimir string en I/O 
move $a0, $t2                #mueve la solucion al registro de argumento $a0
syscall                 #ejecuta la impresion en pantalla
j fin
#CASO SI ES QUE SON IGUALES
son_iguales: 
#hacer la llamada al sistema para que imprima una cadena de texto 
li $v0, 4                #codigo 4 para imprimir string en I/O
la $a0, msg_coincide        #carga la direccion del mensaje en $a0
syscall                        #ejecuta la impresion en pantalla
fin: 
#finalizar el programa de manera segura
li $v0, 10                #codigo 10 para terminar la ejecucion, es decir exit
syscall
