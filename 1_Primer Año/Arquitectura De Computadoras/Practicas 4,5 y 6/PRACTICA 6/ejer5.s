.data 
CONTROL: .word 0x10000
DATA: .word 0x10008
ingrese: .asciiz "Ingrese primero la base: " 
elevado: .asciiz "Ingrese el exponente: "
res: .asciiz "El resultado es: "


.text
lwu $s0, CONTROL($zero) ; $s1 = dirección de CONTROL
lwu $s1, DATA($zero) ; $s0 = dirección de DATA

daddi $v0, $zero, 0

jal ingreso

halt


ingreso: ;muestro por pantalla el mensaje de ingresar la base
         daddi $s2, $0, ingrese ;cargar direccion de ingre
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4

         ;cargo la base 
         daddi $t1, $zero, 8
         sd $t1, 0($s0); CONTROL = 8
         lbu $t1, 0($s1); tomo el punto flotante en $t1
         mtc1 $t1, f1 ;copio t1 en f1
	     cvt.d.l f1,f1 ;convierto a punto flotante el valor entero copiado en f2 y lo guardo en f2

         ;muestro por pantalla el mensaje de elevado
         daddi $s2, $0, elevado ;cargar direccion de ingre
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4

         ;cargo el exponente 
         daddi $t1, $zero, 8
         sd $t1, 0($s0); CONTROL = 8
         lbu $t1, 0($s1); tomo el punto flotante en $t1
         dadd $v0, $zero, $t1
         

alapotencia: beqz $v0, potenciaCero
         loop: mul.d f1, f1, f1 ;multiiplico el numero en punto flotante
               daddi $v0, $v0, -1 ;decremento la cantidad de veces que multiiplico el mismo numero
               bnez $v0, loop

mostrar:
         daddi $s2, $0, res
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4

         ;IMPRIMO EL RESULTADO EN PUNTO FLOTANTE
         s.d f1, 0($s1)		;mandar a Data
         daddi $t1, $0, 3	;imprimir el resultado en punto flotante
         sb $t1, 0($s0)     

         jr $ra    

potenciaCero: div.d f1, f1, f1
              j mostrar



; FALTA ARREGLAR EL RESULTADO QUE DA MAL