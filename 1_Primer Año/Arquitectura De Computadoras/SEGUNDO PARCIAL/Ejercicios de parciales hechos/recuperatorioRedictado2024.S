.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
caracteres: .asciiz " "
cat: .asciiz " caracteres al reves: "  
caracteres2: .asciiz ""
cero: .word 48


.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)

daddi $s2, $zero, 0 
ld $s3, cero($zero) 

loop: daddi $t0, $zero, 9
      sd $t0, 0($s0)
      lbu $t0, 0($s1)
      sb $t0, caracteres($s2)

      daddi $s2, $s2, 1

      bne $t0, $s3, loop

daddi $s4, $zero,0

daddi $s2, $s2, -1; AGREGADO 

loop2: lbu $t0, caracteres($s2)
       sb $t0, caracteres2($s4) 

       daddi $s2, $s2,-1
       daddi $s4, $s4,1

       bnez $s2, loop2 ; FALTARIA Q TERMINE CUANDO SEA IGUAL A -1 NO A CERO YA QUE NO GUARADARIA EL PIMER ELEMENTO 


jal imprimir



halt


imprimir: daddi $t0, $zero, caracteres
          sd $t0, 0($s1)
          daddi $t0, $zero, 4
          sd $t0, 0($s0)

          daddi $t0, $zero, cat
          sd $t0, 0($s1)
          daddi $t0, $zero, 4
          sd $t0, 0($s0)

          daddi $t0, $zero, caracteres2
          sd $t0, 0($s1)
          daddi $t0, $zero, 4
          sd $t0, 0($s0)

          jr $ra





