.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
valor: .double 23.4
imp: .asciiz "El resultado es: "

.code 
lwu $s0, CONTROL($zero)
lwu $s1,  DATA($zero)
l.d f1, valor($zero)

;ingresar valor por teclado 
daddi $t0, $zero, 8
sd $t0, 0($s0)
l.d f2, 0($s1)              ;GUARDO LO INGRESADO EN f1

jal comparar

;imprimir 
daddi $t0, $zero, imp
sd $t0, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)

s.d f4, 0($s1)
daddi $t0, $zero, 3
sd $t0, 0($s0)



halt 


es_menor: ;(valor-x)/x
          sub.d f3, f2, f1
          div.d f4, f3, f2
          j fin 

comparar: c.lt.d f2, f1
          bc1t es_menor
          ;(x-valor)*X
          sub.d f3, f1, f2
          mul.d f4, f3, f2

fin: jr $ra 











