.data
a: .double 1.3, 1.4, 1.6, 2.3, 2.7
b: .double 1.3, 1.4, 1.6, 2.3, 2.7
c: .double 1.3, 1.4, 1.6, 2.3, 2.7
res: .double 0.0, 0.0, 0.0, 0.0, 0.0
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)

daddi $t0, $zero, 5
daddi $t1, $zero, 0


;sumo los elementos de a + B
loop: l.d f1, a($t1)
      l.d f2, b($t1)
      
      add.d f1, f1, f2

      s.d f1, a($t1)

      daddi $t1, $t1, 8
      daddi $t0, $t0, -1

      bnez $t0, loop 

daddi $t0, $zero, 0
daddi $t1, $zero, 5

;multiplico los elementos de c por cadena
loop2: l.d f3, c($t0)
       
       mul.d f3, f3, f3

       s.d f3, c($t0)

       daddi $t0, $t0, 8
       daddi $t1, $t1, -1

       bnez $t1, loop2

daddi $t0, $zero, 0
daddi $t1, $zero, 5

jal realizar_divicion

daddi $s2, $zero, 0
daddi $s3, $zero, 5
;IMPRIMIR
loop3: l.d f1, res($s2)
       s.d f1, 0($s1)
       daddi $t0, $zero, 3
       sd $t0, 0($s0)

       daddi $s2, $s2, 8
       daddi $s3, $s3, -1
       bnez $s3, loop3


halt 

realizar_divicion: l.d f1, a($t0)
                   l.d f2, c($t0)

                   div.d f2, f1, f2

                   s.d f2, res($t0)

                   daddi $t0, $t0, 8
                   daddi $t1, $t1, -1
                
                   bnez $t1, realizar_divicion

                   jr $ra





