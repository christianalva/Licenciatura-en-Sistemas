.data 
CONTROL: .word32 0x10000
DATA: .word32 0x10008
a: .double 1.3, 3.4, 2.9, 5.2, 4.2
b: .double 1.3, 3.4, 2.9, 5.2, 4.2
c: .double 1.3, 3.4, 2.9, 5.2, 4.2
res: .double 0.0, 0.0, 0.0, 0.0, 0.0 


.code
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
daddi $s2, $zero, 5         ;contador  para decrementar los elementos del arreglo 
daddi $s3, $zero, 0         ;contador para ir al siguiente elemento del arreglo 


jal calculo 

daddi $s2, $zero, 5 
daddi $s3, $zero, 0

imprimir: l.d f1, res($s3)
          s.d f1, 0($s1)
          daddi $t0, $zero, 3
          sd $t0, 0($s0)

          daddi $s3, $s3, 8
          daddi $s2, $s2, -1
          bnez $s2, imprimir

halt


calculo: l.d f1, a($s3)
         l.d f2, b($s3)
         l.d f3, c($s3)

         add.d f1, f1, f2       ;SUMO LOS DOS ELEMENTOS DE CADA ARREGLO
         mul.d f3, f3, f3       ;MULTIPLICO LO Q HAYA EN C POR SI MISMO Y LO GUARDO EN F3   

         div.d f3, f1, f3       ;HAGO LA DIVICION DE (A+B) POR C^2 Y EL RESULTADO LO DEJO EN F
        
         s.d f3, res($s3)            ; GUARDO LA SUMA DE LOS DOS ELEMETOS EN RES

         daddi $s3, $s3, 8          ;SUMO PARA PASAR AL SIGUIENTE ELEMENTO DEL ARREGLO 
         daddi $s2, $s2, -1        ;DECREMENTO EL CONTADOR DE ELEMENTOS DE LOS ARREGLOS 
         
         bnez $s2, calculo

         jr $ra










