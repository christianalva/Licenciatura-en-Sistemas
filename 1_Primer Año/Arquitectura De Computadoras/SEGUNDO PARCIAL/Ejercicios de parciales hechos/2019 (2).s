.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
contrasenia: .word 123456
contraCorrecta: .asciiz "Contrasenia CORRECTA "
ingresarContra: .asciiz "Ingrese la contrasenia: "
nuevamente: .asciiz "Ingrese nuevamente la contrasenia: "
block: .asciiz "Contrasenia bloqueada"
ingresado: .word 0

.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
daddi $s2, $zero, 3         ; cantidad de intentos
ld $s3, contrasenia($zero)

jal ingresar

halt 


ingresar: ; mostrar por pantalla ingresarContrasenia
           daddi $t0, $zero, ingresarContra
           sd $t0, 0($s1)
           daddi $t0, $zero, 4
           sd $t0, 0($s0)
           
           ; ingresar contrasenia
           daddi $t0, $zero, 8
           sd $t0, 0($s0)
           ld $t0, 0($s1)
           
           daddi $s2, $s2, -1

           j loop 


 correcto: daddi $t0, $zero, contraCorrecta
           sd $t0, 0($s1)
           daddi $t0, $zero, 4
           sd $t0, 0($s0)

           j fin 

     loop: beq $s3, $t0, correcto  
           beqz $s2, bloqueada

           ;volver a pedir que ingrese la contrasenia
           daddi $t0, $zero, nuevamente
           sd $t0, 0($s1)
           daddi $t0, $zero, 4
           sd $t0, 0($s0)

           daddi $t0, $zero, 8
           sd $t0, 0($s0)
           ld $t0, 0($s1)

           daddi $s2, $s2, -1

           j loop

bloqueada: daddi $t0, $zero, block 
           sd $t0, 0($s1)
           daddi $t0, $zero, 4
           sd $t0, 0($s0)

fin: jr $ra