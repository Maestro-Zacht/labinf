.data

.text
.globl main
.ent main
main:       addi	$sp, $sp, -4			# $sp = $sp + -4
            sw		$ra, 0($sp)		#

            li		$a0, 19		# $a0 = 19
            jal		sequenzaDiCollatz				# jump to sequenzaDiCollatz and save position to $ra
            
            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 1		# $v0 = 1
            syscall

            lw		$ra, 0($sp)		# 
            addi	$sp, $sp, 4			# $sp = $sp + 4
            jr		$ra					# jump to $ra
.end main

.ent sequenzaDiCollatz
sequenzaDiCollatz:      addi	$sp, $sp, -8			# $sp = $sp + -8
                        sw		$s0, 4($sp)		# 
                        sw		$ra, 0($sp)		# 
                        
                        li		$s0, 1		# $s0 = 1
loop:                   beq		$a0, 1, endseq	# if $a0 == 1 then endseq
                        jal		calcolaSuccessivo				# jump to calcolaSuccessivo and save position to $ra
                        addi	$s0, $s0, 1			# $s0 = $s0 + 1
                        move 	$a0, $v0		# $a0 = $v0
                        j		loop				# jump to loop
                        
endseq:                 move 	$v0, $s0		# $v0 = $s0
                        lw		$ra, 0($sp)		#
                        lw		$s0, 4($sp)		# 
                        addi	$sp, $sp, 8			# $sp = $sp + 8
                        jr		$ra					# jump to $ra
.end sequenzaDiCollatz

.ent calcolaSuccessivo
calcolaSuccessivo:      li		$t1, 2		# $t1 = 2
                        li		$t2, 3		# $t2 = 3
                        div		$a0, $t1			# $a0 / 2
                        mflo	$v0					# $v0 = floor($a0 / 2) 
                        mfhi	$t0					# $t0 = $a0 mod 2 
                        beq		$t0, 0, endcalc	# if $t0 == 0 then endcalc
                        mul     $v0, $a0, $t2
                        addi	$v0, $v0, 1			# $v0 = $v0 + 1
endcalc:                jr		$ra					# jump to $ra
.end calcolaSuccessivo