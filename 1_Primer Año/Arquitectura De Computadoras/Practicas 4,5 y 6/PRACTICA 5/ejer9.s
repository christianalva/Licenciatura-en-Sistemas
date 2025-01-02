.data
vocal: .asciiz "A"
vocales: .asciiz "aeiouAEIOU"
result: .word 0

.code 
daddi $a0, $zero, vocal
daddi $a1, $zero, vocales           ; podria usar tambien lbu $a1, vocales($0) lo mismo para el de arriba

jal ES_VOCAL

sd $v0, result($zero) 

halt 

lo_es: daddi $v0, $v0, 1            ; ya que confirme que es vocal pongo un 1
       j fin

ES_VOCAL: dadd $v0, $zero, $zero    ;inicializo v0 en 0
loop: lbu $t0, 0($a0)               ; copio en t0 un byte(8 bits) desde la direccion (0+$a0) 
      lbu $t1, 0($a1)               ; copio en t1 un byte(8 bits) desde la direccion (0+$a1)

      beqz $t1, fin                 ; veo si la cadena de vocales llego a su fin, si asi es voy a fin
      beq $t0, $t1, lo_es           ; si la vocal es igual a algun caracter de vocales salto a lo_es
     
      daddi $a1, $a1, 1

      j loop

fin: jr $ra