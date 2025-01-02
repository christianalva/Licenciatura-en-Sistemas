.data
cadena: .asciiz "adbdcdedfdgdhdid" ; cadena a analizar
car: .asciiz "d"            ; caracter buscado
cant: .word 0               ; cantidad de veces que se repite el caracter car en cadena.

.code
lbu r2, car(r0)             ; Guardo en R2 el carácter a comparar
ld r3, cant(r0)
daddi r4, r0, 0

loop: lbu r1, cadena(r4)    ; Guardo el carácter en r1 de la posición r4
beqz r1, fin                ; Si caracter = 0 -> salto a fin
beq r2, r1, sumar           ; si los caracteres son iguales salto a sumar
daddi r4, r4, 1             ; Avanzo al siguiente carácter r5+1
j loop 

sumar: daddi r3, r3, 1      ; sumo r3 porque los caracteres son iguales 
daddi r4, r4, 1             ; Avanzo al siguiente carácter r5+1
j loop

fin: sd r3, cant(r0)        ;guardo en cant el resultado de r3

halt

