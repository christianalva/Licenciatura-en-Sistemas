.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
ingresar: .asciiz "Ingrese la contrasenia: "
incorrecta: .asciiz "Ingrese nuevamente la contrasenia: "
bloqueada: .asciiz "Contrasenia bloqueada."
correcta: .asciiz "Contrasenia correcta"
contrasenia: .word 1234
clave: .word 0

.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
daddi $v0, $zero, 0
ld $s3, contrasenia($zero)       ;guardo en s3 la contrasenia

daddi $s2, $zero, ingresar
sd $s2, 0($s1)
daddi $s2, $zero, 4
sd $s2, 0($s0)

jal leer


halt 

leer: daddi $t0, $zero, 8
      sd $t0, 0($s0)
      ld $t1, 0($s1)            ; tomo numero ingresado por teclado en t1

      daddi $v0, $v0, 1
      
      slti $v1, $v0, 3
      beqz $v1, bloqueado
      beq $t1, $s3, ingresa     ; si son iguales 
      bne $t1, $s3, reintentar  ; si no son iguales 

ingresa: daddi $s2, $zero, correcta
         sd $s2, 0($s1)
         daddi $s2, $zero, 4
         sd $s2, 0($s0)
         
         j fin

reintentar: daddi $s2, $zero, incorrecta
            sd $s2, 0($s1)
            daddi $s2, $zero, 4
            sd $s2, 0($s0)

            j leer


bloqueado: daddi $s2, $zero, bloqueada
            sd $s2, 0($s1)
            daddi $s2, $zero, 4
            sd $s2, 0($s0)

            fin: jr $ra

;escribir un programa que lea una contrasenia de 6 diguitos y la compare con la contrasenia original guardada en memoria. permite al usuario tener 3 intentos para ingresar la contrasenia. Si la contrasenia es
; correcta imprimir CONTRANIA CORRECTA. Si es incorrecta pero tiene mas chanses imprimir INGRESE NUEVAMENTE LA CONTRASENIA. y si se le terminaron los intentos debe imprimir CONTRANIA BLOQUEADA
;use al menos una subrutina