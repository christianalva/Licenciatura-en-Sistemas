.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
tabla1: .word 12, 11, 1, 32, 19, 20, 5, 9, 23, 22
tabla2: .word 12, 11, 4, 32, 15, 20, 5, 9, 24, 22
verde: .byte 0, 255, 0
azul: .byte 0, 0, 255
min1: .word 9999
min2: .word 9999
max1: .word 0
max2: .word 0


.code 
lwu $s6, CONTROL($zero)
lwu $s7, DATA($zero)


daddi $s0, $zero, 0         ; contador de tabla 
daddi $s1, $zero, 10        ; cantidad total de nuemros de cada tabla




ld $s2, min1($zero)
ld $s3, max1($zero)
ld $s4, min2($zero)
ld $s5, max2($zero)

jal min_max

sd $s2, min1($zero)
sd $s3, max1($zero)
sd $s4, min2($zero)
sd $s5, max2($zero)

;PINTO EL PIMER (MIN1, MAX1)
lbu $t0, min1($zero)
sb $t0, 5($s7)
lbu $t1, max1($zero)
sb $t1, 4($s7)

;pongo el color a pintar el pixel 
lwu $t2, azul($zero)
sw $t2, 0($s7)

;pinto el pixel
daddi $t3, $zero, 5
sd $t3, 0($s6)

; PINTO EL SEGUNDO(MIN2, MAX2)
lbu $t0, min2($zero)
sb $t0, 5($s7)
lbu $t1, max2($zero)
sb $t1, 4($s7)

;pongo el color a pintar el pixel 
lwu $t2, verde($zero)
sw $t2, 0($s7)

;pinto el pixel
daddi $t3, $zero, 5
sd $t3, 0($s6)



halt


es_menor1: dadd $s2, $zero, $t0
           j menor2
           
es_menor2: dadd $s4, $zero, $t1
           j mayor1

es_mayor1: dadd $s3, $zero, $t0
           j mayor2

es_mayor2: dadd $s5, $zero, $t1
           j mayor2

min_max: ld $t0, tabla1($s0)
         ld $t1, tabla2($s0)

         slt $t2, $t0, $s2
         bnez $t2, es_menor1
 
 menor2: slt $t2, $t1, $s4
         bnez $t2, es_menor2 

 mayor1: slt $t2, $s3, $t0
         bnez $t2, es_mayor1

 mayor2: slt $t2, $s5, $t1  
         bnez $t2, es_mayor2

         daddi $s0, $s0, 8
         daddi $s1, $s1, -1

         bnez $s1, min_max

         jr $ra


         



