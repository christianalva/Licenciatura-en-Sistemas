.data
ingrese: .asciiz "Ingrese primero la coordenada x y luego la y: "
colores7: .asciiz " Ingrese el la gama de color en la pos 1 (0-255) :  " 
colores2: .asciiz " Ingrese el la gama de color en la pos 2 (0-255) :  " 
colores3: .asciiz " Ingrese el la gama de color en la pos 3 (0-255) :  " 
colores4: .asciiz " Ingrese el la gama de color en la pos 4 :  " 
coorX: .byte 0 ; coordenada X de un punto
coorY: .byte 0 ; coordenada Y de un punto
color: .byte 0, 0, 0, 0 ; color: máximo rojo + máximo azul => magenta
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.text
lwu $s6, CONTROL($zero) ; $s6 = dirección de CONTROL
lwu $s7, DATA($zero) ; $s7 = dirección de DATA

daddi $t0, $zero, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla gráfica

daddi $v0, $zero, 0
jal coordenadas


lbu $s0, coorX($zero) ; $s6 = valor de coordenada X
sb $s0, 5($s7) ; DATA+5 recibe el valor de coordenada X
lbu $s1, coorY($zero) ; $s7 = valor de coordenada Y
sb $s1, 4($s7) ; DATA+4 recibe el valor de coordenada Y


; dibujo lo ingresado

lwu $s2, color($zero) ; $s2 = valor de color a pintar
sw $s2, 0($s7) ; DATA recibe el valor del color a pintar
daddi $t0, $zero, 5 ; $t0 = 5 -> función 5: salida gráfica
sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto 


halt

coordenadas: ;muestro por pantalla el mensaje de ingresar la base
            daddi $s2, $0, ingrese ;cargar direccion de ingre
            sd $s2, 0($s7)		;mandar a Data
            daddi $t1, $0, 4	;imprimir carácter
            sd $t1, 0($s6)          ;control = 4

            ;coordenada X
            daddi $t1, $zero, 8
            sd $t1, 0($s6); CONTROL = 8
            lbu $t1, 0($s7) ;tomo la cordenada x en $t1
            sd $t1, coorX($0) ;guardo t1 en la direccion coorX
        
            ; coordenada Y
            daddi $t1, $zero, 8
            sd $t1, 0($s6) ; CONTROL = 8
            lbu $t1, 0($s7) ;tomo la cordenada y en $t1 
            sd $t1, coorY($zero) ;guardo t1 en la direccion coorY

            
               
               daddi $s2, $0, colores7 ;cargar direccion de ingre
               sd $s2, 0($s7)		;mandar a Data
               daddi $t1, $0, 4	;imprimir carácter
               sd $t1, 0($s6)          ;control = 4

               ;color posicion 1
               daddi $t1, $zero, 8
               sd $t1, 0($s6); CONTROL = 8
               lbu $t1, 0($s7) ;tomo el color 1 en $t1
               sd $t1, color($v0)
               
               daddi $v0, $v0, 8
               
               daddi $s2, $0, colores2 ;cargar direccion de ingre
               sd $s2, 0($s7)		;mandar a Data
               daddi $t1, $0, 4	;imprimir carácter
               sd $t1, 0($s6)          ;control = 4

               ;color posicion 2
               daddi $t1, $zero, 8
               sd $t1, 0($s6); CONTROL = 8
               lbu $t1, 0($s7) ;tomo el color 2 en $t1
               sd $t1, color($v0)

               daddi $v0, $v0, 8

               daddi $s2, $0, colores3 ;cargar direccion de ingre
               sd $s2, 0($s7)		;mandar a Data
               daddi $t1, $0, 4	;imprimir carácter
               sd $t1, 0($s6)          ;control = 4

               ;color posicion 3
               daddi $t1, $zero, 8
               sd $t1, 0($s6); CONTROL = 8
               lbu $t1, 0($s7) ;tomo el color 3 en $t1
               sd $t1, color($v0)

               daddi $v0, $v0, 8

               daddi $s2, $0, colores4 ;cargar direccion de ingre
               sd $s2, 0($s7)		;mandar a Data
               daddi $t1, $0, 4	;imprimir carácter
               sd $t1, 0($s6)          ;control = 4

               ;color posicion 4
               daddi $t1, $zero, 8
               sd $t1, 0($s6); CONTROL = 8
               lbu $t1, 0($s7) ;tomo el color 4 en $t1
               sd $t1, color($v0)


               jr $ra