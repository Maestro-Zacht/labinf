.data

vet1:       .word 1, 2, 3, 4
vet2:       .word 5, 6, 7, 8
resmat:     .space 64

.text
.globl main
.ent main
main:       li		$t0, 0		# $t0 = 0
            li		$t1, 0		# $t1 = 0
            li		$s0, 4		# $s0 = 4
            
loopext:    beq		$t0, $s0, endloopext	# if $t0 == $s0 then endloopext
loopint:    beq		$t1, $s0, endloopint	# if $1 == $s0 then endloopint
            
            sll		$t2, $t0, 2			# $t2 = $t0 << 2
            add		$t2, $t1, $t2		# $t2 = $t1 + $t2
            sll		$t2, $t2, 2			# $t2 = $t2 << 2
            
            sll		$t3, $t0, 2			# $t3 = $t0 << 2
            sll		$t4, $t1, 2			# $t4 = $t1 << 2
            
            lw		$t5, vet1($t3)		# 
            lw		$t6, vet2($t4)		# 
            
            mult	$t5, $t6			# $t5 * $t6 = Hi and Lo registers
            mflo	$t7					# copy Lo to $t7
            
            sw		$t7, resmat($t2)		# 
            
            addi	$t1, $t1, 1			# $t1 = $t1 + 1
            j		loopint				# jump to loopint

endloopint: addi	$t0, $t0, 1			# $t0 = $t0 + 1
            li		$t1, 0		# $t1 = 0
            j		loopext				# jump to loopext

endloopext: li		$v0, 10		# $v0 = 10
            syscall
.end main