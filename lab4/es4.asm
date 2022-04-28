.data

tavolap:    .space 400

.text
.globl main
.ent main
main:       li		$t0, 0		# $0 = 0
            li		$t1, 0		# $t1 = 0
            li		$s0, 10		# $s0 = 10
            
loopext:    beq		$t0, $s0, endloopext	# if $t0 == $s0 then endloopext
loopint:    beq		$t1, $s0, endloopint	# if $1 == $s0 then endloopint
            
            mult	$t0, $s0			    # $t0 * $s0 = Hi and Lo registers
            mflo	$t2					# copy Lo to $t2
            add		$t2, $t1, $t2		# $t2 = $t1 + $t2
            sll		$t2, $t2, 2			# $t2 = $t2 << 2
            
            addi	$t3, $t0, 1			# $t3 = $t0 + 1
            addi	$t4, $t1, 1			# $t4 = $t1 + 1
            
            mult	$t4, $t3			# $t4 * $t3 = Hi and Lo registers
            mflo	$t5					# copy Lo to $t5
            
            sw		$t5, tavolap($t2)		# 
            
            
            addi	$t1, $t1, 1			# $t1 = $t1 + 1
            j		loopint				# jump to loopint

endloopint: addi	$t0, $t0, 1			# $t0 = $t0 + 1
            li		$t1, 0		# $t1 = 0
            j		loopext				# jump to loopext

endloopext: li		$v0, 10		# $v0 = 10
            syscall
.end main