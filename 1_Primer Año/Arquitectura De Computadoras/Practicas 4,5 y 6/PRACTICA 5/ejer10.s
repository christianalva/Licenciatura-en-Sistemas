.data
cadena: .asciiz "holaAAA"
vocales: .asciiz "aeiouAEIOU"
result: .word 0

.code 
daddi $a0, $zero, cadena
daddi $a1, $zero, vocales           ; podria usar tambien lbu $a1, vocales($0) lo mismo para el de arriba
jal CONTAR_VOC

sd $v0, result($zero) 

halt 

CONTAR_VOC: dadd $v0, $zero, $zero  ;inicializo v0 en 0
loop: lbu $t0, 0($a0) 
      lbu $t1, 0($a1) 

      beqz $t0, fin; 
      beqz $t1, avanzar; 
      beq $t0, $t1, lo_es;
     
      daddi $a1, $a1, 1

      j loop

lo_es: daddi $v0, $v0, 1            ; ya que confirme que es vocal pongo un 1
       j avanzar

avanzar: daddi $a0, $a0, 1
         daddi $a1, $zero, vocales
         j loop
         
fin: jr $ra