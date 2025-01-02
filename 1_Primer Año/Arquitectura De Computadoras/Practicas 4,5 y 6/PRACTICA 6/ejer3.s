.data 
CONTROL: .word 0x10000
DATA: .word 0x10008
ingrese: .asciiz "Ingrese dos numero: "
mas: .asciiz "+"
igual: .ascii "="
num1: .word 0
num2: .word 0
dig1: .word 0
dig2: .word 0

.text
lwu $s0, CONTROL($zero)                 ; $s1 = dirección de CONTROL
lwu $s1, DATA($zero)                    ; $s0 = dirección de DATA


;muestro por pantalla el mensaje
daddi $s2, $0, ingrese                  ;cargar direccion de ingre
sd $s2, 0($s1)		                ;mandar a Data
daddi $t1, $0, 4	                ;imprimir carácter
sd $t1, 0($s0)                          ;control = 4

jal ingreso
jal muestro

fin:
halt

 ingreso: ;primer numero
         daddi $t1, $zero, 9
         sd $t1, 0($s0)                 ; CONTROL = 9
         lbu $t1, 0($s1)                ; tomo el caracter en $t1
         sb $t1, num1($zero)
         daddi $t1, $t1, -48            ; le resto 48 para que me de el valor pero sin el cod ascii 
         dadd $v0, $0, $t1

        ; segundo numero
         daddi $t1, $zero, 9
         sd $t1, 0($s0)                 ; CONTROL = 9
         lbu $t1, 0($s1)                ; tomo el caracter en $t1
         sb $t1, num2($zero)
         daddi $t1, $t1, -48            ; le resto 48 para que me de el valor pero sin el cod ascii 
         
         ;GUARDO EL RESULTADO DE NUM1 + NUM2 EN DOS DIG POR SI ES MAS DE 10 LA SUMA
         dadd $v0, $v0, $t1
         slti $v1, $v0, 10              ; si es menor a 9 deja un 1 en v1
         beqz $v1, mayora9              ; si v1 es igual a 0 salta a mayora9 
         
         daddi $v1, $zero, 0
         daddi $v0, $v0, 48
         daddi $v1, $v1, 48
         sb $v1, dig1($zero)
         sb $v0, dig2($zero)
         
         
         jr $ra

mayora9: daddi $v0, $v0, -10
         daddi $v1, $zero, 1
         daddi $v1, $v1, 48
         daddi $v0, $v0, 48
         sb $v1, dig1($zero)
         sb $v0, dig2($zero)
         
         j muestro

muestro: ;muestro por pantalla el mensaje
         daddi $s2, $0, num1
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4

         daddi $s2, $0, mas
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4

         daddi $s2, $0, num2
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4

         daddi $s2, $0, igual
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4

         daddi $s2, $0, dig1
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4
         daddi $s2, $0, dig2
         sd $s2, 0($s1)		;mandar a Data
         daddi $t1, $0, 4	;imprimir carácter
         sd $t1, 0($s0)          ;control = 4

         jr $ra