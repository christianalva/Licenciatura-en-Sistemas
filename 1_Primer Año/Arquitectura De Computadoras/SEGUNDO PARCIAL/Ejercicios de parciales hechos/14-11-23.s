.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
cadena: .asciiz "12sa145179gfhfg"
digitos: .asciiz ""
cad_msg: .asciiz "Cadena con reemplazos: "
digi_msg: .asciiz "Digitos convertidos a digitos+1: " 

.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)

daddi $s2, $zero, 15 
daddi $s3, $zero, 0
daddi $s4, $zero, 0

jal procesar_cadena



halt 




obtener_digito: daddi $t0, $t0, 1
                sb $t0, cadena($s3)

                sb $t0, digitos($s4)

                daddi $s4, $s4, 1

                j siguiente


es_digito: slti $t1, $t0, 57
           beqz $t1, siguiente        

           slti $t1, $t0, 48
           beqz $t1, obtener_digito

           j siguiente

procesar_cadena: lbu $t0, cadena($s3)
                 
                 j es_digito

      siguiente: daddi $s3, $s3, 1
                 daddi $s2, $s2, -1

                 bnez $s2, procesar_cadena
                 
                 ;imprimir 
                 daddi $t0, $zero, cad_msg
                 sd $t0, 0($s1)
                 daddi $t0, $zero, 4
                 sd $t0, 0($s0)

                 daddi $t0, $zero, cadena
                 sd $t0, 0($s1)
                 daddi $t0, $zero, 4
                 sd $t0, 0($s0)

                 daddi $t0, $zero, digi_msg
                 sd $t0, 0($s1)
                 daddi $t0, $zero, 4
                 sd $t0, 0($s0)

                 daddi $t0, $zero, digitos
                 sd $t0, 0($s1)
                 daddi $t0, $zero, 4
                 sd $t0, 0($s0)

                 jr $ra




