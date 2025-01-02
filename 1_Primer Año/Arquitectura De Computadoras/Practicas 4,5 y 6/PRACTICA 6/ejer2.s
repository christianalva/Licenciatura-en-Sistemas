.data 
CONTROL: .word 0x10000
DATA: .word 0x10008
cero: .asciiz "cero"
uno: .asciiz "uno"
dos: .asciiz "dos"
tres: .asciiz "tres"
cuatro: .asciiz "cuatro"
cinco: .asciiz "cinco"
seis: .asciiz "seis"
siete: .asciiz "siete"
ocho: .asciiz "ocho"
nueve: .asciiz "nueve"
ingre: .asciiz "Ingrese un numero: "
ingre2: .asciiz "ingrese nuevamente un numero entero: "

.text

lwu $s0, CONTROL($zero)                   ; $s1 = dirección de CONTROL
lwu $s1, DATA($zero)                      ; $s0 = dirección de DATA
daddi $s3, $zero, 0                       ; contador que va a ir de 0 a 9

daddi $s2, $0, ingre                      ;cargar direccion de ingre
sd $s2, 0($s1)		                  ;mandar a Data
daddi $t1, $0, 4	                        ;imprimir carácter
sd $t1, 0($s0)                            ;control = 4

ingreso: ;ingreso un numero 
         daddi $t1, $zero, 9
         sd $t1, 0($s0); CONTROL = 9
         lbu $t1, 0($s1)                  ; tomo el caracter en $t1
         daddi $t1, $t1, -48              ; le resto 48 para que me de el valor pero sin el cod ascii 
         j muestra


      
muestra:;busco que numero es el que ingrese 
         beq $t1, $s3, es_cero
         daddi $s3, $zero, 1              ;incremento el contador para seguir comprando si no fue cero
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
         
         ;si no es ningun numero de los anteriores quiere ddecir que ingresaron un caracter asi que vuelvo a pedir
         daddi $s2, $0, ingre             ;cargar direccion de ingre
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4
         
         j ingreso

es_cero: daddi $s2, $0, cero              ;cargar direccion de cero
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4

         j fin

es_uno: daddi $s2, $0, uno                ;cargar direccion de uno
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4

         j fin
es_dos: daddi $s2, $0, dos                ;cargar direccion de dos
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4

         j fin
es_tres: daddi $s2, $0, tres              ;cargar direccion de tres
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4

         j fin
es_cuatro: daddi $s2, $0, cuatro          ;cargar direccion de cuatro
           sd $s2, 0($s1)		      ;mandar a Data
           daddi $t1, $0, 4	            ;imprimir carácter
           sd $t1, 0($s0)                 ;control = 4

           j fin
es_cinco: daddi $s2, $0, cinco            ;cargar direccion de cinco
          sd $s2, 0($s1)		      ;mandar a Data
          daddi $t1, $0, 4	            ;imprimir carácter
          sd $t1, 0($s0)                  ;control = 4

          j fin
es_seis: daddi $s2, $0, seis              ;cargar direccion de seis
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4

         j fin
es_siete: daddi $s2, $0, siete            ;cargar direccion de siete
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4

         j fin
es_ocho: daddi $s2, $0, ocho              ;cargar direccion de ocho
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4

         j fin
es_nueve: daddi $s2, $0, nueve            ;cargar direccion de nueve
         sd $s2, 0($s1)		            ;mandar a Data
         daddi $t1, $0, 4	            ;imprimir carácter
         sd $t1, 0($s0)                   ;control = 4

         j fin
      
fin: 
halt