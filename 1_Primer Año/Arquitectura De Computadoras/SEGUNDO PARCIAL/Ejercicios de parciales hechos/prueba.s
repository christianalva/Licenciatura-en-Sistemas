.data
num: .word 0
.code 
daddi $t7, $zero, 6
daddi $t7, $t7, 49
daddi $t3, $zero, 0


siguiente: daddi $t7, $t7, -1
           daddi $t3, $t3, 1
           bnez $t7, siguiente 

sd $t3, num($zero)

halt