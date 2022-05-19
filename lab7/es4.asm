.data
vet:        .word 4, 5, 6, 7
.text
.globl main
.ent main
main:       addi	$sp, $sp, -4			# $sp = $sp + -4
            sw		$ra, 0($sp)		#

            la		$s1, vet		# 
            lw		$a0, 0($s1)		# 
            lw		$a1, 4($s1)		# 
            lw		$a2, 8($s1)		# 
            lw		$a3, 12($s1)		# 
            
            jal		determinante2x2				# jump to determinante2x2 and save position to $ra
            
            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 1		# $v0 = 1
            syscall

            lw		$ra, 0($sp)		# 
            addi	$sp, $sp, 4			# $sp = $sp + 4
            jr		$ra					# jump to $ra
.end main

.ent determinante2x2
determinante2x2:        mul     $v0, $a0, $a3
                        mul     $t0, $a1, $a2
                        sub		$v0, $v0, $t0		# $v0 = $v0 - $t0
                        jr		$ra					# jump to $ra
.end determinante2x2