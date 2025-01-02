.data 
a: .double 1.9,2.4,3.3,4.2,5.2
b: .double 1.9,2.4,3.3,4.2,5.2
c: .double 1.9,2.4,3.3,4.2,5.2
res: .double 0,0,0,0,0
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code 
daddi $t3, $zero, 0
daddi $t4, $zero, 5
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)

jal calculo

daddi $t3, $zero, 0
daddi $t4, $zero, 5
jal mostrar

halt 

calculo: l.d f0, a($t3)
         l.d f1, b($t3)
         l.d f2, c($t3)

         
         daddi $t4, $t4, -1     ;decremento la cantidad de elementos de los arreglos

         add.d f4, f0, f1 ; (sumo a + b)
         mul.d f4, f4, f4 ; (a + b)^2
         div.d f4, f4, f2 ; (a + b)^2/c

         s.d f4, res($t3)
         daddi $t3, $t3,8       ;paso al siguiente numero en punto flotante de los arreglos 

         bnez $t4, calculo
         
         jr $ra

mostrar: L.D f1, res($t3)
         S.D f1, 0($s1)        

         DADDI $t0, $0, 3
         SD $t0, 0 ($s0) 

         daddi $t4, $t4, -1     ;decremento la cantidad de elementos de los arreglos
         daddi $t3, $t3,8       ;paso al siguiente numero en punto flotante de los arreglos

         bnez $t4, mostrar

         jr $ra

;parcial 2018 06-07-2018