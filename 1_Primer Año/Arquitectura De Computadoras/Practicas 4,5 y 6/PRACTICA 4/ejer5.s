.data
cant: .word 8 ; cantidad de datos
datos: .word 1, 2, 3, 4, 5, 6, 7, 8
res: .word 0

.code
dadd r1, r0, r0
ld r2, cant(r0)

loop: ld r3, datos(r1)    ;guardo el elemento de la tabla en la posicion r1 en r3 
      daddi r2, r2, -1    ;disminuyo la cantidad de datos
      dsll r3, r3, 1      ;dezplazo a la izquierda 1 ves, los bits del registro r3 y lo guardo en r3
      sd r3, res(r1)      ;guardo en res el resultado de r3
      daddi r1, r1, 8     ;sumo 8 a r1 para pasar a la siguiente posicion de datos
      bnez r2, loop
nop
halt
