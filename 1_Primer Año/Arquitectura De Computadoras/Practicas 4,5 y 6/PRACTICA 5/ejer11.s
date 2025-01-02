.data
tabla: .word 1,2,3,4,5,6,6,1,2,2,0
result: .word 0

.code
daddi $t0, $0, 0
jal es_impar
sd $v0, result($0)
halt

es_impar: dadd $v0, $0, $0

    loop: ld $t1, tabla($t0)
	        beqz $t1, fin
          andi $t2, $t1, 1      ; con esto verifico si es par o no, haciendo un and bit a bit a t1 con 1, ya que los impares van a tener siempre el primer bit en 1
                            ;y si el resultado de lo de arriba me da 0 es porque es un numero par 

	        daddi $t0, $t0, 8
	        beqz $t2, no_es
	        daddi $v0, $v0, 1

   no_es: j loop
     fin: jr $ra




