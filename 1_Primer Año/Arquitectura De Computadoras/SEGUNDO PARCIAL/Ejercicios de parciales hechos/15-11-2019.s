.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
A: .word 0
B: .word 0
C: .word 0
res: .word 0
impri: .asciiz "El resultado es: "


.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)

;ingresar entero A 
daddi $t0, $zero, 8
sd $t0, 0($s0)
ld $t0, 0($s1)
sd $t0, A($zero)

;ingresar entero B
daddi $t0, $zero, 8
sd $t0, 0($s0)
ld $t0, 0($s1)
sd $t0, B($zero)

;ingresar entero C
daddi $t0, $zero, 8
sd $t0, 0($s0)
ld $t0, 0($s1)
sd $t0, C($zero)

ld $t0, A($zero)
ld $t1, B($zero)
ld $t2, C($zero)

jal calculo 


halt



calculo: dsub $t0, $t2, $t0
   loop: dadd $t3, $t3, $t0 
         daddi $t1, $t1, -1

         bnez $t1, loop

         sd $t3, res($zero)

         ;imprimir 
         daddi $t0, $zero, impri
         sd $t0, 0($s1)
         daddi $t0, $zero, 4
         sd $t0, 0($s0)
 
         ld $t0, res($zero)
         sd $t0, 0($s1)
         daddi $t0, $zero, 2
         sd $t0, 0($s0)


         jr $ra



