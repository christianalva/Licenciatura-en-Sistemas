.data
peso: .double 110.0
estatura: .double 1.75
imc: .double 0.0
estado: .word 0
infra: .double 18.5
normal: .double 25.0
sobre: .double 30.0


.code
l.d f1, peso(r0)
l.d f2, estatura(r0)

;clasificaciones de peso
l.d f6, infra(r0)
l.d f7, normal(r0)
l.d f8, sobre(r0)

;estatura al cuadrado
mul.d f4, f2, f2

;divido el peso por la estatura al cuadrado y lo guardo en  f5
div.d f5, f1, f4
;le paso el valor al imc
s.d f5, imc(r0)

c.lt.d f5, f6
bc1t infrapeso      ; salta si la op de arriba da 1
c.lt.d f5, f7
bc1t pesonormal     ; salta si la op de arriba da 1
c.lt.d f5, f8
bc1t sobrepeso      ; salta si la op de arriba da 1
j pesoobeso

infrapeso: daddi r2, r2, 1
j fin 
pesonormal: daddi r2, r2, 2       
j fin
sobrepeso: daddi r2, r2, 3
j fin
pesoobeso: daddi r2, r2, 4

fin: 
sd r2, estado(r0)
halt



