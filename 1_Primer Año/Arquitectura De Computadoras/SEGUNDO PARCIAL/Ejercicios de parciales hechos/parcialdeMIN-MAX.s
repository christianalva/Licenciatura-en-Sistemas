.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
tabla_1: .word 12, 39, 32, 3, 8, 12, 7, 9, 23, 1
tabla_2: .word 32, 21, 3, 7, 21, 27, 4, 4, 9, 15 
min_1: .word 9999
min_2: .word 9999
max_1: .word 0
max_2: .word 0
color_verde: .word 0, 255, 0
color_azul: .word 0, 0, 255

.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
daddi $s2, $zero, 0
daddi $s3, $zero, 10 ; contador de cantidad de digitos de tabla

ld $t0, min_1($zero)
ld $t1, max_1($zero)
ld $t2, min_2($zero)
ld $t3, max_2($zero)

jal MIN_MAX

sd $t0, min_1($zero) 
sd $t1, max_1($zero) 
sd $t2, min_2($zero) 
sd $t3, max_2($zero) 

; color verde en la coordenada (min2, max2)
;coordenada X
lbu $s5, min_2($zero)
sb $s5, 5($s1)              ; data+5 recibe el valor de la coordenada X
;coordenada Y
lbu $s6, max_2($zero)
sb $s6, 4($s1)              ; data+4 recibe el valor de coordenada Y

;PASO COLOR A PINTAR 
lwu $s7, color_verde($zero)
sw $s7, 0($s1)

;PINTO EL PIXEL
daddi $t0, $zero, 5
sd $t0, 0($s0)              ;control recibe el 5 y produce el dibujo del punto  

; color azul en la coordenada (min1, max1)
;coordenada X
lbu $s5, min_1($zero)
sb $s5, 5($s1)              ; data+5 recibe el valor de la coordenada X
;coordenada Y
lbu $s6, max_1($zero)
sb $s6, 4($s1)              ; data+4 recibe el valor de coordenada Y

;PASO COLOR A PINTAR 
lwu $s7, color_azul($zero)
sw $s7, 0($s1)

;PINTO EL PIXEL
daddi $t0, $zero, 5
sd $t0, 0($s0)              ;control recibe el 5 y produce el dibujo del punto  



halt


es_mayor: dadd $t1, $zero, $t4
          j cmp_max2

es_menor: dadd $t0, $zero, $t4
          j cmp_min2      

es_mayor2: dadd $t3, $zero, $t5
          j fin

es_menor2: dadd $t2, $zero, $t5
           j cmp_max          

MIN_MAX: ld $t4, tabla_1($s2)
         ld $t5, tabla_2($s2)

         slt $s4, $t4, $t0          ; comparo si el nuevo min de la tabla 1 es menor que el que habia
         bnez $s4, es_menor

cmp_min2: slt $s4, $t5, $t2          ; comparo si el numevo min de la tabla 2 es menor que el que habia 
          bnez $s4, es_menor2

cmp_max: slt $s4, $t1, $t4 
         bnez $s4, es_mayor

cmp_max2: slt $s4, $t3, $t5
          bnez $s4, es_mayor2
         

fin:     daddi $s2, $s2, 8
         daddi $s3, $s3, -1

         bnez $s3, MIN_MAX
         jr $ra