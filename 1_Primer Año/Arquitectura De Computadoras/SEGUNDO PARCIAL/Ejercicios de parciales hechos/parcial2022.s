.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
valor: .double 4.2
resultado: .asciiz "El resultado es: "

.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)

l.d f1, valor($zero)

;leer num por teclado
daddi $t0, $zero, 8
sd $t0, 0($s0)
l.d f2, 0($s1)

jal comparar

halt 


comparar: c.lt.d f1, f2
          bc1t es_mayor

          sub.d f3, f1, f2
          div.d f3, f3, f2
          j imprimir

es_mayor: sub.d f3, f2, f1
          mul.d f3, f3, f2

          j imprimir

imprimir: daddi $t0, $zero, resultado
          sd $t0, 0($s1)
          daddi $t0, $zero, 4
          sd $t0, 0($s0)

          s.d f3, 0($s1)
          daddi $t0, $zero, 3
          sd $t0, 0($s0)

          jr $ra