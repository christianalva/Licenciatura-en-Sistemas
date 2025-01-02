.data 
num1: .word 2
num2: .word 8
res: .word 0
.code 
ld r1, num1(r0)
ld r2, num2(r0)

loop: dadd r3, r3, r1; guardo en r3 la suma con r1(num1) hasta que num2 sea 0
daddi r2, r2, -1; decremento num2 
bnez r2, loop ; mientras que num2 no sea 0 vuelvo a ejecutar

sd r3, res(r0); guardo el resultado del loop en res 

halt


