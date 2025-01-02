.data
CONTROL: .word 0x10000
DATA: .word 0x10008
texto: .byte 0                  ; El mensaje a mostrar

.text 
lwu $s0, CONTROL($zero)         ; $s1 = dirección de CONTROL
lwu $s1, DATA($zero)            ; $s0 = dirección de DATA
daddi $s4, $zero, 13            ; ascii del enter

;hago un bucle que me va a leer y mostrar por pantalla los caracteres hasta que aprete enter
loop: 
    ;ingreso caracter
    daddi $t1, $zero, 9
    sd $t1, 0($s0)          ; CONTROL = 9
    lbu $t1, 0($s1)         ; tomo el caracter en $t1
    beq $t1, $s4, fin       ;verifico si aprete enter o no 
    sb $t1, texto($zero)    ; guardo lo ingresado en variable

    ;muestro por pantalla
    daddi $s3, $0, texto    ;cargar direccion de carácter
	sd $s3, 0($s1)		    ;mandar a Data
	daddi $t1, $0, 4	    ;imprimir carácter
	sd $t1, 0($s0)          ;control = 4

    j loop

; ya que termine limpio la pantalla
fin: daddi $t1, $zero, 6    ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
     sd $t1, 0($s0)         ; CONTROL recibe 6 y limpia la pantalla


halt  