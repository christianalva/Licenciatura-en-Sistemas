.data
coorX: .byte   1					 ; coordenada X de un punto	
coorY: .byte   1					 ; coordenada Y de un punto
color: .byte   255, 0, 255, 0	     ; color: máximo rojo + máximo azul => magenta
CONTROL: .word32 0x10000		     ; Dirección de mapeo
DATA: .word32 0x10008		         ; Dirección de mapeo
	
.code
lwu	$s6, CONTROL($zero)		        ; $s6 = dirección de CONTROL
lwu	$s7, DATA($zero)				; $s7 = dirección de DATA


	
;cordenada X
lbu	$s0, coorX($zero)				; $s0 = valor de coordenada X
;coordenada Y
lbu	$s1, coorY($zero)				; $s1 = valor de coordenada Y
;color a pintar 
lwu	$s2, color($zero)				; $s2 = valor de color a pintar (OJO, no ld)

;ingresar caracter
leer: daddi $t1, $zero, 9
      sd $t1, 0($s6)
      lbu $t1, 0($s7)
      daddi $t1, $t1, -48

      slti $t2, $t1, 10
      beqz $t2, leer 
      slti $t2, $t1, 0
      bnez $t2, leer 

daddi	$t0, $zero, 7			    ; $t0 = 7 -> función 7: limpiar pantalla gráfica
sd		$t0, 0($s6)					; CONTROL recibe 7 y limpia la pantalla gráfica

daddi $s3, $zero, 0
beq $t1, $s3, es_cero 
daddi $s3, $zero, 1
beq $t1, $s3, es_uno 
daddi $s3, $zero, 2
beq $t1, $s3, es_dos 
daddi $s3, $zero, 3
beq $t1, $s3, es_tres 
daddi $s3, $zero, 4
beq $t1, $s3, es_cuatro 
daddi $s3, $zero, 5
beq $t1, $s3, es_cinco 
daddi $s3, $zero, 6
beq $t1, $s3, es_seis 
daddi $s3, $zero, 7
beq $t1, $s3, es_siete 
daddi $s3, $zero, 8
beq $t1, $s3, es_ocho 
daddi $s3, $zero, 9
beq $t1, $s3, es_nueve 


es_cero: jal columnaA5
         ;me posiciono en x e y para hacer la linea de la parte de arriba
         daddi $s0, $zero, 1        ; pos en x
         daddi $s1, $zero, 8        ; pos en y 
         jal columnaA5              ; pinto la linea de arriba 

         daddi $s0, $zero, 1
         daddi $s1, $zero, 7
         jal filaI6

         daddi $s0, $zero, 5        ;pos x
         daddi $s1, $zero, 7        ;pos y

         jal filaI6 

         j fin 

es_uno: daddi $s0, $zero, 5         ;pos x
        daddi $s1, $zero, 8         ;pos y
        jal filaI6

        j fin

es_dos: jal columnaA5

        daddi $s0, $zero, 1
        daddi $s1, $zero, 2
        jal filaM3
        
        daddi $s0, $zero, 1
        daddi $s1, $zero, 5
        jal columnaA5

        daddi $s0, $zero, 5
        daddi $s1, $zero, 6
        jal filaM2

        daddi $s0, $zero, 1
        daddi $s1, $zero, 8
        jal columnaA5

        j fin

es_tres: jal columnaA5
         
         daddi $s0, $zero, 5
         daddi $s1, $zero, 2
         jal filaM3

         daddi $s0, $zero, 1
         daddi $s1, $zero, 5
         jal columnaA5

         daddi $s0, $zero, 5
         daddi $s1, $zero, 6
         jal filaM2

         daddi $s0, $zero, 1
         daddi $s1, $zero, 8
         jal columnaA5

         j fin 

es_cuatro: daddi $s0, $zero, 5
           daddi $s1, $zero, 1
           jal filaM4

           daddi $s0, $zero, 1
           daddi $s1, $zero, 5
           jal columnaA5

           daddi $s0, $zero, 5
           daddi $s1, $zero, 6
           jal filaM3

           daddi $s0, $zero, 1
           daddi $s1, $zero, 6
           jal filaM3

           j fin

es_cinco: jal columnaA5
          daddi $s0, $zero, 5
          daddi $s1, $zero, 2

          jal filaM3
          daddi $s0, $zero, 1
          daddi $s1, $zero, 5

          jal columnaA5
          daddi $s0, $zero, 1
          daddi $s1, $zero, 6

          jal filaM2
          daddi $s0, $zero, 1
          daddi $s1, $zero, 8

          jal columnaA5

          j fin

es_seis: jal columnaA5
          daddi $s0, $zero, 5
          daddi $s1, $zero, 2

          jal filaM3
          daddi $s0, $zero, 1
          daddi $s1, $zero, 5

          jal columnaA5
          daddi $s0, $zero, 1
          daddi $s1, $zero, 6

          jal filaM2
          daddi $s0, $zero, 1
          daddi $s1, $zero, 8

          jal columnaA5
          daddi $s0, $zero, 1
          daddi $s1, $zero, 2

          jal filaM3

          j fin

es_siete: daddi $s0, $zero, 5
          daddi $s1, $zero, 1
          jal filaM4

          daddi $s0, $zero, 1
          daddi $s1, $zero, 5
          jal columnaA5

          daddi $s0, $zero, 5
          daddi $s1, $zero, 6
          jal filaM2

          daddi $s0, $zero, 1
          daddi $s1, $zero, 8
          jal columnaA5

          j fin

es_ocho: jal columnaA5

          daddi $s0, $zero, 5
          daddi $s1, $zero, 2
          jal filaM3

          daddi $s0, $zero, 1
          daddi $s1, $zero, 5
          jal columnaA5

          daddi $s0, $zero, 5
          daddi $s1, $zero, 6
          jal filaM2

          daddi $s0, $zero, 1
          daddi $s1, $zero, 8
          jal columnaA5

          daddi $s0, $zero, 1
          daddi $s1, $zero, 2
          jal filaM3

          daddi $s0, $zero, 1
          daddi $s1, $zero, 6
          jal filaM2

          j fin

es_nueve: jal columnaA5

          daddi $s0, $zero, 5
          daddi $s1, $zero, 2
          jal filaM3

          daddi $s0, $zero, 1
          daddi $s1, $zero, 5
          jal columnaA5

          daddi $s0, $zero, 5
          daddi $s1, $zero, 6
          jal filaM2

          daddi $s0, $zero, 1
          daddi $s1, $zero, 8
          jal columnaA5

          daddi $s0, $zero, 1
          daddi $s1, $zero, 6
          jal filaM2

          j fin



fin: 
halt

;Columna alta 5 pixeles (me muevo en x)
columnaA5: 
           daddi $t3, $zero, 5      ;igualo t3 a 5 para pintar 5 pixeles en el eje x
loop1: ;valor de coordenada Y
	   sb $s1, 4($s7)					; DATA+4 recibe el valor de coordenada Y 

       ;coordenada X
       sb $s0, 5($s7)
           
       sw $s2, 0($s7)           ;DATA recibe el valor del color a pintar
       ;PINTO
       daddi $t0, $zero, 5      ; $t0 = 5 -> función 5: salida gráfica
       sd $t0, 0($s6)           ; CONTROL recibe 5 y produce el dibujo del punto

       daddi $t3, $t3, -1       ; decremento t3
       daddi $s0, $s0, 1        ; aumento el valor de s0 para que me haga la linea a la derecha

       bnez $t3, loop1
       
       jr $ra

;Fila izquierda 6 pixeles (me muevo en x)
filaI6:
        daddi $t3, $zero, 6      ;igualo t3 a 5 para pintar 5 pixeles en el eje x
loop3: 
      ;coordenada x
      sb $s0, 5($s7)
      ;coordenada y
      sb $s1, 4($s7)

      sw $s2, 0($s7)           ;DATA recibe el valor del color a pintar
      ;PINTO
      daddi $t0, $zero, 5      ; $t0 = 5 -> función 5: salida gráfica
      sd $t0, 0($s6)           ; CONTROL recibe 5 y produce el dibujo del punto

      daddi $t3, $t3, -1       ; decremento t3
      daddi $s1, $s1, -1        ; incremento el calor de s1 para que me haga la linea de la izquierda

      bnez $t3, loop3
      
      jr $ra

;Fila hasta la mitad derecha 3 pixeles 
filaM4:
        daddi $t3, $zero, 4      ;igualo t3 a 4 para pintar 4 pixeles en el eje x
loop5: 
      ;coordenada x
      sb $s0, 5($s7)
      ;coordenada y
      sb $s1, 4($s7)

      sw $s2, 0($s7)           ;DATA recibe el valor del color a pintar
      ;PINTO
      daddi $t0, $zero, 5      ; $t0 = 5 -> función 5: salida gráfica
      sd $t0, 0($s6)           ; CONTROL recibe 5 y produce el dibujo del punto

      daddi $t3, $t3, -1       ; decremento t3
      daddi $s1, $s1, 1        ; incremento el calor de s1 para que me haga la linea de la izquierda

      bnez $t3, loop5
      
      jr $ra

;Fila hasta la mitad derecha 3 pixeles 
filaM3:
        daddi $t3, $zero, 3      ;igualo t3 a 3 para pintar 3 pixeles en el eje x
loop5: 
      ;coordenada x
      sb $s0, 5($s7)
      ;coordenada y
      sb $s1, 4($s7)

      sw $s2, 0($s7)           ;DATA recibe el valor del color a pintar
      ;PINTO
      daddi $t0, $zero, 5      ; $t0 = 5 -> función 5: salida gráfica
      sd $t0, 0($s6)           ; CONTROL recibe 5 y produce el dibujo del punto

      daddi $t3, $t3, -1       ; decremento t3
      daddi $s1, $s1, 1        ; incremento el calor de s1 para que me haga la linea de la izquierda

      bnez $t3, loop5
      
      jr $ra


;Fila hasta la mitad 2 pixeles 
filaM2:
        daddi $t3, $zero, 2      ;igualo t3 a 2 para pintar 2 pixeles en el eje x
loop5: 
      ;coordenada x
      sb $s0, 5($s7)
      ;coordenada y
      sb $s1, 4($s7)

      sw $s2, 0($s7)           ;DATA recibe el valor del color a pintar
      ;PINTO
      daddi $t0, $zero, 5      ; $t0 = 5 -> función 5: salida gráfica
      sd $t0, 0($s6)           ; CONTROL recibe 5 y produce el dibujo del punto

      daddi $t3, $t3, -1       ; decremento t3
      daddi $s1, $s1, 1        ; incremento el calor de s1 para que me haga la linea de la izquierda

      bnez $t3, loop5
      
      jr $ra


