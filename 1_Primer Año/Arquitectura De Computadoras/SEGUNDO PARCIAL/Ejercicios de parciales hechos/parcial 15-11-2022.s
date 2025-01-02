.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
valor: .double 32.0
result: .asciiz "El resultado es: "

.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
l.d f2, valor($zero)

;ingresar valor en punto flotante por teclado
daddi $t0, $zero, 8
sd $t0, 0($s0)             ; control = 8
l.d f1, 0($s1)             ; guardo en f1 el punto flotante ingresado por teclado

c.lt.d f1, f2
bc1f valor_mayor

;(X-VALOR)*X

sub.d f3, f2, f1
mul.d f3, f3, f1



imprimir: daddi $t0, $zero, result
          sd $t0, 0($s1)
          daddi $t0, $zero, 4
          sd $t0, 0($s0)
          
          ; IMPRIMO EL RESULTADO
          s.d f3, 0($s1)
          daddi $t0, $zero, 3
          sd $t0, 0($s0)
          
          j fin


valor_mayor: sub.d f3, f1, f2
             div.d f3, f3, f1   

             j imprimir

fin: 
halt





