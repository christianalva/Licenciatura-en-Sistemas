.data 
tabla: .word 1,2,3,4,5,11, 15, 19, 20, 30
X: .word 15
cant: .word 0
res: .word 0

.code 
daddi r1, r0, 0
ld r2, X(r0)
ld r3, cant(r0)
ld r4, res(r0)
daddi r6, r6, 10; creo un contador para ejecutar el loop 10 veces

loop: ld r5, tabla(r1)
daddi r6, r6, -1

slt r4, r2, r5 ; comparo r2(X), con r5(tabla), dejando un 1 si r2 es menor q r5
sd r4, res(r1) ; guardo el resultado de arriba en res

andi r7, r4, 1 ; hago un and (suma) entre r4 y 1  

dadd r8, r8, r7 ; sumo en r8 el resultado de r7
daddi r1, r1, 8; incremento r1 en 8 para pasar al siguiente elemento de la tabla en el proximo loop

bnez r6, loop

sd r8, cant(r0) ; guardo en cant el resultado de r8

halt 
