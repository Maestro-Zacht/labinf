.data

.text
.globl main
.ent main
main:       nop
.end main

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