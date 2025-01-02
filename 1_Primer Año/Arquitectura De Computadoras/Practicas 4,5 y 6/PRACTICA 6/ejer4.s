.data 
CONTROL: .word 0x10000
DATA: .word 0x10008
ingrese: .asciiz "Ingrese la contraseña: "
bienvenido: .asciiz "Bienvenido" 
error: .asciiz "ERROR, ingrese la contraseña nuevamente: "
clave: .asciiz "abcd"

.text

lwu $s0, CONTROL($zero)             ; $s1 = dirección de CONTROL
lwu $s1, DATA($zero)                ; $s0 = dirección de DATA
daddi $t3, $zero, 0                 ; inicializo en 0 el contador de caracteres ingresados

;muestro por pantalla el mensaje
daddi $s2, $0, ingrese              ;cargar direccion de ingre
sd $s2, 0($s1)		                ;mandar a Data
daddi $t1, $0, 4	                ;imprimir carácter
sd $t1, 0($s0)                      ;control = 4

jal char

halt

char: lbu $t5, clave($t3)           ;$t5 = car actual de pass
      
      daddi $t1, $zero, 9
      sd $t1, 0($s0)                ; CONTROL = 9
      lbu $t1, 0($s1)               ; tomo el caracter en $t1 
      
      daddi $t3, $t3, 1             ;paso al siguiente caracter de clave
      
      bne $t1, $t5, contrasenaIncorrecta         ; si t1 no es igual a t5 salta a contraseña incorrecta
      slti $t4, $t3, 4                           ; deja un 1 en t4 si t3 es menor a 5
      bnez $t4, char                             ; si t4 no es igual a 0 salta de vuelta al bucle char a que le pase otro caracter    

      j contrasenaCorrecta

contrasenaIncorrecta: ;muestro por pantalla el mensaje
                      daddi $s2, $0, error              ;cargar direccion de error 
                      sd $s2, 0($s1)		            ;mandar a Data
                      daddi $t1, $0, 4	                ;imprimir carácter
                      sd $t1, 0($s0)                    ;control = 4
                      daddi $t3, $zero, 0;
                      j char

contrasenaCorrecta: ;muestro por pantalla el mensaje
                    daddi $s2, $0, bienvenido           ;cargar direccion de bienvenido
                    sd $s2, 0($s1)		                ;mandar a Data
                    daddi $t1, $0, 4	                ;imprimir carácter
                    sd $t1, 0($s0)                      ;control = 4
      jr $ra


