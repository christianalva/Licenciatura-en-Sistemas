.data
tabla: .word 4,11,12,18,6,17,28,9,0,11,23,15,6,37,29,14
menor: .word 20
mayor: .word 10
cantidad: .word 15
total: .word 0
nuevo: .word 0
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)

ld $s2, cantidad($zero)
ld $s3, mayor($zero)
ld $s4, menor($zero)
daddi $s5, $zero, 0         ; contador de tabla
daddi $s6, $zero, 0         ; contador de nuevo
daddi $s7, $zero, 0         ;cantidad de elementos del nuevo arreglo

jal nuevo_arreglo

sd $s7, total($zero)        ;cantidad total de elementos del nuevo arreglo

daddi $s5, $zero, 0
; imprimir nuevo arreglo 
loop: ld $t0, nuevo($s5)
      sd $t0, 0($s1)
      daddi $t0, $zero, 1
      sd $t0, 0($s0)

      daddi $s5, $s5, 8
      daddi $s7, $s7, -1
      bnez $s7, loop 

      


halt

nuevo_arreglo: ld $t0, tabla($s5)
               slt $t1, $t0, $s3
               beqz $t1, es_mayor
    
    siguiente: daddi $s5, $s5, 8
               daddi $s2, $s2, -1
               bnez $s2, nuevo_arreglo

               jr $ra


es_mayor: slt $t1, $t0, $s4
          bnez $t1, cumple

          j siguiente

cumple: sd $t0, nuevo($s6)
        daddi $s6, $s6, 8
        daddi $s7, $s7, 1

        j siguiente

