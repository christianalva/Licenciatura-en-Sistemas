.data 
tabla: .word 1,2,3,4,5,12,14,16
M: .word 14
cant: .word 8
result: .word 0

.code
ld $a1, M($zero)
ld $a2, cant($zero)

jal valores_mayores
sd $v0, result($zero)

halt

valores_mayores: daddi $t0, $zero, 0
           loop: ld $a0, tabla($t0)
                 slt $t1, $a1, $a0
                 beqz $t1, salto
                 daddi $v0, $v0, 1
                
           salto: daddi $a2, $a2, -1; decremento el contador
                  daddi $t0, $t0, 8 ; avanzo al siguiente numero de la tabla
                  bnez $a2, loop
         
        terminar: jr $ra


