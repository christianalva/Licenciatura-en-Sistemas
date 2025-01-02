.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
cadenaA: .asciiz "CasdeFewqasAsfaV"
cadenaSig: .asciiz " LA CADENA B QUEDA DE LA SIGUIENTE MANERA: "
cadenaB: .asciiz ""


.code
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
daddi $s2, $zero, 16        ;cantidad de caracteres de la cadena A
daddi $s3, $zero, 0
daddi $s4, $zero, 0          

jal procesar_cadena

;imprimo las cadenas
daddi $t0, $zero, cadenaA
sd $t0, 0($s1) 
daddi $t0, $zero, 4
sd $t0, 0($s0)

daddi $t0, $zero, cadenaSig
sd $t0, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)

daddi $t0, $zero, cadenaB
sd $t0, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)


halt


procesar_cadena: lbu $t0, cadenaA($s3)
                 slti $t1, $t0, 91
                 bnez $t1, es_mayu
         
             sig: daddi $s3, $s3, 1
                  daddi $s2, $s2, -1
                  bnez $s2, procesar_cadena

                  jr $ra

        es_mayu: slti $t1, $t0, 65
                 beqz $t1, convertir_minu

                 j sig


convertir_minu: lbu $t3, cadenaB($s4)
                daddi $t0, $t0, 32
                sb $t0, cadenaA($s3)
                sb $t0, cadenaB($s4)
                daddi $s4, $s4, 1

                j sig

