.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
tabla1: .word 11,12,4,3,6,8,4,31,27, 22
tabla2: .word 11,12,1,3,6,8,4,31,27, 22
min1: .word 999
min2: .word 999
max1: .word 0
max2: .word 0 
verde: .byte 0, 255, 0
azul: .byte 0,0,255


.code 
lwu $s6, CONTROL($zero)
lwu $s7, DATA($zero)

daddi $s0, $zero, 10        ;contador de elementos totales
daddi $s1, $zero, 0          ;contador de elementos del 0 al 10

jal recorrerTablas

jal pintar1
jal pintar2


halt


nuevo_min1: sd $t0, min1($zero)
           j mayor1
nuevo_max1: sd $t0, max1($zero)
            j menor2
nuevo_min2: sd $t1, min2($zero)
            j mayor2
nuevo_max2: sd $t1, max2($zero)
            j siguiente 

recorrerTablas: ld $t0, tabla1($s1)
                ld $t1, tabla2($s1)

                ld $s2, min1($zero)
                ld $s3, max1($zero)
                ld $s4, min2($zero)
                ld $s5, max2($zero)

                slt $t2, $t0, $s2
                bnez $t2, nuevo_min1

        mayor1: slt $t2, $s3, $t0
                bnez $t2, nuevo_max1
        
        menor2: slt $t2, $t1, $s4
                bnez $t2, nuevo_min2
        
        mayor2: slt $t2, $s5, $t1 
                bnez $t2, nuevo_max2

     siguiente: daddi $s0, $s0, -1
                daddi $s1, $s1, 8
                bnez $s0, recorrerTablas

                jr $ra
                
pintar1: lbu $s0, min1($zero)
         sb $s0, 5($s7)
         lbu $s1, max1($zero)
         sb $s1, 4($s7)

         lwu $s2, azul($zero)
         sw $s2, 0($s7)

         daddi $t0, $zero, 5
         sd $t0, 0($s6)

         jr $ra

pintar2: lbu $s0, min2($zero)
         sb $s0, 5($s7)
         lbu $s1, max2($zero)
         sb $s1, 4($s7)

         lwu $s2, verde($zero)
         sw $s2, 0($s7)

         daddi $t0, $zero, 5
         sd $t0, 0($s6)

         jr $ra