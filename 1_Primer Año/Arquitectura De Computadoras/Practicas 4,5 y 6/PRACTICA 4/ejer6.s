.data
A: .word 2
B: .word 1
C: .word 2
D: .word 0
.code 
ld r1, A(r0)
ld r2, B(r0)
ld r3, C(r0)
daddi r4, r0, 0
beq r1,r2,sumar1
compAC: beq r1,r3,sumar2
compBA: beq r2,r1,sumar3
compBC: beq r2,r3,sumar4
compCA: beq r3,r1,sumar5
compCB: beq r3,r2,sumar6
j fin 
sumar1: daddi r4,r4,1
j compAC
sumar2: daddi r4,r4,1
j compBA        
sumar3: daddi r4,r4,1
j compBC
sumar4: daddi r4,r4,1
j compCA
sumar5: daddi r4,r4,1
j compCB        
sumar6: daddi r4,r4,1
fin: sd r4, D(r0)
halt 

