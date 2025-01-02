.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
cadenaA: .asciiz "CaDeNa"
cadenaB: .asciiz ""
A: .word 65
Z: .word 90


.code 
lwu $s6, CONTROL($zero)
lwu $s7, DATA($zero)
daddi $s1, $zero, 0
lw $s2, A($zero)
lw $s3, Z($zero)
daddi $s4, $zero, 6
daddi $s5, $zero, 0
jal procesar_cadena
jal imprimir


halt 


procesar_cadena: lbu $t0, cadenaA($s1)
                 daddi $s4, $s4, -1

                 slt $t1, $t0, $s2
                 bnez $t1, loop

                 slt $t1, $t0, $s3
                 beqz $t1, loop
           
convertir_minu: daddi $t0, $t0, 32
                sb $t0, cadenaA($s1)
                sb $t0, cadenaB($s5)
                daddi $s5, $zero, 1
                
            
loop: daddi $s1, $s1, 1
      bnez $s4, procesar_cadena
      jr $ra 
                 




imprimir: 
         daddi $s2, $zero, cadenaA
         sd $s2, 0($s7)
         daddi $s2, $zero, 4
         sd $s2, 0($s6)

         daddi $s2, $zero, cadenaB
         sd $s2, 0($s7)
         daddi $s2, $zero, 4
         sd $s2, 0($s6)

         jr $ra
