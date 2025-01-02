.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
base: .word 0
altura: .word 0
color: .byte 0, 0, 255
posX: .byte 8
posY: .byte 7

.code

lwu $s6, CONTROL($zero)
lwu $s7, DATA($zero)

lbu $s0, posX($zero)        ;
lbu $s1, posY($zero)
lwu $s2, color($zero)       ;COLOR A PINTAR


;ingresar base 
daddi $t0, $zero, 8
sd $t0, 0($s6)
ld $t0, 0($s7)
sd $t0, base($zero); guardo en base el numero ingresado 

;ingresar altura 
daddi $t0, $zero, 8
sd $t0, 0($s6)
ld $t0, 0($s7)
sd $t0, altura($zero)

jal base_altura1
jal base_altura2



halt


base_altura1: ld $t1, base($zero)
              ld $t2, altura($zero)

              ;posX (base)
        loop: sb $s0, 5($s7)                ;data+5 recibe el valor de la coordenada x 
              ;posY
              sb $s1, 4($s7)
              
              sw $s2, 0($s7)                ;data recibe el valor del color a pintar

              ; pinto el pixel
              daddi $t0, $zero, 5
              sd $t0, 0($s6) 

              daddi $t1, $t1, -1
              daddi $s0, $s0, 1
              
              bnez $t1, loop

              ;PONGO ESTOS DOS DADI PARA QUE LA ALTURA ME LA PONGA NI BIEN TERMINO LA BASE Y NO AL LADO
              daddi $s0, $s0, -1
              daddi $s1, $s1, 1
              ;posY(altura)
       loop2: sb $s1, 4($s7)
              ;posX
              sb $s0, 5($s7)
              
              sw $s2, 0($s7)                ;data recibe el valor del color a pintar

              ; pinto el pixel
              daddi $t0, $zero, 5
              sd $t0, 0($s6) 

              daddi $t2, $t2, -1
              daddi $s1, $s1, 1
              
              bnez $t2, loop2


              jr $ra

base_altura2: ld $t1, base($zero)
              ld $t2, altura($zero)

              ;posX (base)
        loop3: sb $s0, 5($s7)
              ;posY
              sb $s1, 4($s7)
              
              sw $s2, 0($s7)                ;data recibe el valor del color a pintar

              ; pinto el pixel
              daddi $t0, $zero, 5
              sd $t0, 0($s6) 

              daddi $t1, $t1, -1
              daddi $s0, $s0, -1
              
              bnez $t1, loop3

              ;PONGO ESTOS DOS DADI PARA QUE LA ALTURA ME LA PONGA NI BIEN TERMINO LA BASE Y NO AL LADO
              daddi $s0, $s0, 1
              daddi $s1, $s1, -1
              ;posY(altura)
       loop4: sb $s1, 4($s7)
              ;posX
              sb $s0, 5($s7)
              
              sw $s2, 0($s7)                ;data recibe el valor del color a pintar

              ; pinto el pixel
              daddi $t0, $zero, 5
              sd $t0, 0($s6) 

              daddi $t2, $t2, -1
              daddi $s1, $s1, -1
              
              bnez $t2, loop4


              jr $ra
