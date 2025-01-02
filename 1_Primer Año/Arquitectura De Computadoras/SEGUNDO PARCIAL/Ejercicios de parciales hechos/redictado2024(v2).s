.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
color: .byte 0, 255, 0
coorX: .byte 5
coorY: .byte 5
base: .word 0 
altura: .word 0

.code
lwu $s6, CONTROL($zero)
lwu $s7, DATA($zero)

lbu $s0, coorX($zero)
lbu $s1, coorY($zero)
lwu $s2, color($zero)

;ingresar base 
daddi $t0, $zero, 8
sd $t0, 0($s6)
ld $t0, 0($s7)
sd $t0, base($zero)

;ingresar altura 
daddi $t0, $zero, 8
sd $t0, 0($s6)
ld $t0, 0($s7)
sd $t0, altura($zero)

jal pintar1
jal pintar2
                    
halt 

pintar1: ld $t0, base($zero)
         ld $t1, altura($zero)

  base1: sb $s0, 5($s7)
         sb $s1, 4($s7)
         sw $s2, 0($s7)         ; color

         ;pintar
         daddi $t2, $zero, 5
         sd $t2, 0($s6)

         daddi $s0, $s0, 1
         daddi $t0, $t0, -1

         bnez $t0, base1

         daddi $s0, $s0, -1
         daddi $s1, $s1, 1

altura1: sb $s0, 5($s7)
         sb $s1, 4($s7)

         sw $s2, 0($s7)

         daddi $t2, $zero, 5
         sd $t2, 0($s6)

         daddi $s1, $s1, 1
         daddi $t1, $t1, -1

         bnez $t1, altura1

         jr $ra

pintar2: ld $t0, base($zero)
         ld $t1, altura($zero)

  base2: sb $s0, 5($s7)
         sb $s1, 4($s7)
         sw $s2, 0($s7)         ; color

         ;pintar
         daddi $t2, $zero, 5
         sd $t2, 0($s6)

         daddi $s0, $s0, -1
         daddi $t0, $t0, -1

         bnez $t0, base2

         daddi $s0, $s0, 1
         daddi $s1, $s1, -1

altura2: sb $s0, 5($s7)
         sb $s1, 4($s7)

         sw $s2, 0($s7)

         daddi $t2, $zero, 5
         sd $t2, 0($s6)

         daddi $s1, $s1, -1
         daddi $t1, $t1, -1

         bnez $t1, altura2

         jr $ra      




