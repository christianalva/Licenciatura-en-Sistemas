.data
string1: .asciiz "hola" ;definir cadenas de caracteres utilizando
string2: .asciiz "hoa"
result: .word 0 

.code 
daddi $a0, $zero, string1
daddi $a1, $zero, string2

jal comparar

sd $v0, result($zero)

halt

comparar: dadd $v0, $zero, $zero    ;inicializo v0 en 0

loop: lbu $t0, 0($a0)               ; copio en t0 un byte(8 bits) desde la direccion (0+$a0) 
      lbu $t1, 0($a1)               ; copio en t1 un byte(8 bits) desde la direccion (0+$a1)

      ; comparo primero si alguno de los dos llega primero a 0
      beqz $t0, fin_a0              ;si t0 es igual a 0 salta
      beqz $t1, final               ;si t1 es igual a 0 salta

      ;comparo si los dos caracteres en la posicion son iguales
      bne $t0, $t1, final           ; si $t0 no es igual a $t1, salta a final

      daddi $v0, $v0, 1             ;avanzo en v0 para encontrar la pos en que las cadenas difieren
      
      ; si son iguales avanzo al siguiente caracter
      daddi $a0, $a0, 1             ; avanzo de caracter en el string1
      daddi $a1, $a1, 1
      j loop 

fin_a0: bnez $t1, final             ;si $t1 no es igual a 0 salta a final 
        daddi $v0, $zero, -1        ;ya que si llega a aca serian los dos string identicos pongo -1 en v0 
    
final: jr $ra