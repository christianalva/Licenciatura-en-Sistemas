.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
cad_msj: .asciiz "Cadena con reemplazos: "
dig_msj: .asciiz " Digitos convertidos en digitos + 1: "
cadena: .asciiz "asf231ds3246789a"
digitos: .asciiz ""


.code 
lwu $s0, CONTROL($zero)
lwu $s1, DATA($zero)
daddi $s2, $zero, 0
daddi $s3, $zero, 0
daddi $s4, $zero, 16			; lo uso como contador de los elementos que tiene cadena

loop: lbu $t0, cadena($s2) 
	  daddi $t0, $t0, -48

	  jal es_digito

	  daddi $s2, $s2, 1
	  daddi $s4, $s4, -1

	  bnez $s4, loop

;imprimir cad_msj 
daddi $t0, $zero, cad_msj
sd $t0, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)

;imprimir la cadena
daddi $t0, $zero, cadena
sd $t0, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)

;imprimir dig_msj 
daddi $t0, $zero, dig_msj
sd $t0, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)

;imprimir digitos
daddi $t0, $zero, digitos
sd $t0, 0($s1)
daddi $t0, $zero, 4
sd $t0, 0($s0)







halt 

obtener_digito: daddi $t0, $t0, 1	        ; le aumento 1
				daddi $t0, $t0, 48	        ; busco el nuemero en codigo ascii
				sb $t0, cadena($s2)         ; guardo el nuevo numero en la cadena
				sb $t0, digitos($s3)        ; agrego el numero a digitos en la posicion  que corresponda segun diga s3
				daddi $s3, $s3, 1           

                j fin 

es_digito: slti $t1, $t0, 0 		;veo si es menor a 0 
		   bnez $t1, fin 
		   slti $t1, $t0, 9 		; veo si es menor a 9, si lo es cumple con lo pedido
		   bnez $t1, obtener_digito

	fin: jr $ra




