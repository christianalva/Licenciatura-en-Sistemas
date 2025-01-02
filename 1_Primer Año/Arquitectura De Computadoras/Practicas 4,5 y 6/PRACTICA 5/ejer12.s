.data
valor: .word 10
result: .word 0


.code

daddi $sp, $0, 0x400 ; Inicializa el puntero al tope de la pila con la dirección 0x400
ld $a0, valor($0)     ; Carga el valor almacenado en la dirección 'valor' en el registro $a0

jal factorial         ; Llama a la subrutina factorial (guarda la dirección de retorno en $ra)

sd $v0, result($0)    ; Almacena el resultado de $v0 en la dirección 'result'

halt                  ; Detiene la ejecución del programa

factorial: daddi $sp, $sp, -16   ; Ajusta el puntero de la pila hacia abajo para hacer espacio
           sd $ra, 0($sp)        ; Guarda el valor de $ra en la pila (dirección 0($sp))
           sd $s0, 8($sp)        ; Guarda el valor de $s0 en la pila (dirección 8($sp))

           beqz $a0, fin_rec     ; Si $a0 es 0, salta a fin_rec (caso base)
           dadd $s0, $0, $a0     ; Copia el valor de $a0 en $s0 (guarda n)
           daddi $a0, $a0, -1    ; Decrementa $a0 en 1 (n-1)
           
           jal factorial         ; Llama recursivamente a factorial
           
           dmul $v0, $v0, $s0    ; Multiplica $v0 (factorial(n-1)) por $s0 (n) y almacena en $v0

           j fin                 ; Salta a fin

fin_rec: daddi $v0, $0, 1      ; Caso base: si $a0 es 0, retorna 1 en $v0

fin: ld $s0, 8($sp)        ; Restaura el valor de $s0 desde la pila
     ld $ra, 0($sp)        ; Restaura el valor de $ra desde la pila
     daddi $sp, $sp, 16    ; Ajusta el puntero de la pila hacia arriba para liberar espacio
     jr $ra                ; Retorna a la dirección almacenada en $ra

