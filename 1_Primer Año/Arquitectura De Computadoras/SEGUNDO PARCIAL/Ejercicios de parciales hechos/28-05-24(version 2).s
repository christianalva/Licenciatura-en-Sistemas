.data 
CONTROL: .word32 0x10000
DATA: .word32 0X10008
base: .word 0
altura: .word 0
posX: .word 5
posY: .word 5
color: .byte 0,0,255


.code 
lwu $s6, CONTROL($zero)
lwu $s7, DATA($zero)

;coordenada X
lbu $s0, posX($zero)

;coordenada Y 
lbu $s1, posY($zero)

;color
lwu $s2, color($zero)


;ingresar base 
daddi $t0, $zero, 8
sd $t0, 0($s6)
ld $t0, 0($s7)
sd $t0, base($zero)         ;guardo el valor ingresado en la variable base 

;ingresar altura 
daddi $t0, $zero, 8
sd $t0, 0($s6) 
ld $t0, 0($s7)
sd $t0, altura($zero)

jal dibujar1

jal dibujar2


halt

dibujar1: ld $t0, base($zero)
         ld $t1, altura($zero)

loopBase: ;ME MUEVO EN LA COORDENADA X
          sb $s0, 5($s7)
          daddi $s0, $s0, 1
          
          ;DEJO LA COORDENADA Y COMO ESTA
          sb $s1, 4($s7)
          
          ;COLOR
          sw $s2, 0($s7)

          ;PINTO EL PIXEL 
          daddi $t2, $zero, 5
          sd $t2, 0($s6)

          daddi $t0, $t0, -1
          bnez $t0, loopBase
          
          daddi $s0, $s0, -1
          daddi $s1, $s1, 1

loopAltura: ;ME MUEVO EN LA COORDENADA Y
            sb $s1, 4($s7)
            daddi $s1, $s1, 1

            ;DEJO LA COORDENADA X COMO ESTA
            sb $s0, 5($s7)

            ;COLOR
            sw $s2, 0($s7)

            ;PINTO EL PIXEL 
            daddi $t2, $zero, 5
            sd $t2, 0($s6) 

            daddi $t1, $t1, -1
            bnez $t1, loopAltura

            jr $ra
            
dibujar2: ld $t0, base($zero)
          ld $t1, altura($zero)

loopBase2: ;ME MUEVO EN LA COORDENADA X
          sb $s0, 5($s7)
          daddi $s0, $s0, -1
          
          ;DEJO LA COORDENADA Y COMO ESTA
          sb $s1, 4($s7)
          
          ;COLOR
          sw $s2, 0($s7)

          ;PINTO EL PIXEL 
          daddi $t2, $zero, 5
          sd $t2, 0($s6)

          daddi $t0, $t0, -1
          bnez $t0, loopBase2
          
          daddi $s0, $s0, 1
          daddi $s1, $s1, -1

loopAltura2: ;ME MUEVO EN LA COORDENADA Y
            sb $s1, 4($s7)
            daddi $s1, $s1, -1

            ;DEJO LA COORDENADA X COMO ESTA
            sb $s0, 5($s7)

            ;COLOR
            sw $s2, 0($s7)

            ;PINTO EL PIXEL 
            daddi $t2, $zero, 5
            sd $t2, 0($s6) 

            daddi $t1, $t1, -1
            bnez $t1, loopAltura2

            jr $ra




