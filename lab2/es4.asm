.data
var1:       .half   255
str1:       .asciiz "Il numero di 1 e': "
.text
.globl main
.ent main
main:       lh      $t0, var1
            li		$t1, 1		        # $t1 = 0
            andi	$t2, $t0, 1			# $t2 = $t0 & 1
            
            

loop:       beq		$t1, 16, fine	    # if $t1 == 16 then fine
            srl		$t0, $t0, 1			# $t0 = $t0 >> 1
            andi	$t3, $t0, 1			# $t3 = $t0 & 1
            bne		$t3, 1, ritorna	    # if $t3 != 1 then ritorna
            addi	$t2, $t2, 1			# $t2 = $t2 + 1
            
ritorna:    addi	$t1, $t1, 1			# $t1 = $t1 + 1
            j		loop				# jump to loop

fine:       li		$v0, 4		# $v0 = 4
            la		$a0, str1		# 
            syscall

            li		$v0, 1		# $v0 = 1
            move 	$a0, $t2		# $a0 = $t2
            syscall

            li		$v0, 10		# $v0 = 10
            syscall
.end main