.data

tabella:        .word 154, 123, 109, 86, 4
                .space 4
                .word 412, -23, -231, 9, 50
                .space 4
                .word 123, -24, 12, 55, -45
                .space 28

.text
.globl main
.ent main
main:       li		$t0, 0		# $t0 = 0
            li		$t1, 0		# $t1 = 0
            li		$s0, 5		# $s0 = 5
            li		$s1, 3		# $s1 = 3
            li		$t9, 0		# $t9 = 0
            
loopext:    beq		$t0, $s1, endloopext	# if $t0 == $s0 then endloopext
            li		$t3, 0		# $t3 = 0
            
loopint:    beq		$t1, $s0, endloopint	# if $1 == $s0 then endloopint

            addi	$t5, $s0, 1			# $t5 = $s0 + 1
            mult	$t0, $t5			# $t0 * $t5 = Hi and Lo registers
            mflo	$t2					# copy Lo to $t2
            add		$t2, $t1, $t2		# $t2 = $t1 + $t2
            sll		$t2, $t2, 2			# $t2 = $t2 << 2

            lw		$t4, tabella($t2)		#  

            add		$t3, $t3, $t4		# $t3 = $t3 + $t4          
            
            addi	$t1, $t1, 1			# $t1 = $t1 + 1
            j		loopint				# jump to loopint

endloopint: addi	$t2, $t2, 4			# $t2 = $t2 + 4

            sw		$t3, tabella($t2)		# 
            add		$t9, $t9, $t3		# $t9 = $t9 + $t3
            
            
            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            li		$t1, 0		# $t1 = 0
            j		loopext				# jump to loopext

endloopext: li		$t0, 0		# $t0 = 0
            li		$t1, 0		# $t1 = 0
            li		$s0, 3		# $s0 = 3
            li		$s1, 5		# $s1 = 5
            
loopext2:   beq		$t0, $s1, endloopext2	# if $t0 == $s0 then endloopext
            li		$t3, 0		# $t3 = 0
            
loopint2:   beq		$t1, $s0, endloopint2	# if $1 == $s0 then endloopint
            
            addi	$t5, $s1, 1			# $t5 = $s0 + 1
            mult	$t1, $t5			# $t0 * $t5 = Hi and Lo registers
            mflo	$t2					# copy Lo to $t2
            add		$t2, $t0, $t2		# $t2 = $t1 + $t2
            sll		$t2, $t2, 2			# $t2 = $t2 << 2

            lw		$t4, tabella($t2)		#  

            add		$t3, $t3, $t4		# $t3 = $t3 + $t4          
            
            addi	$t1, $t1, 1			# $t1 = $t1 + 1
            j		loopint2			# jump to loopint

endloopint2: addi	$t2, $t2, 24			# $t2 = $t2 + 24

            sw		$t3, tabella($t2)		# 
            add		$t9, $t9, $t3		# $t9 = $t9 + $t3
            
            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            li		$t1, 0		# $t1 = 0
            j		loopext2				# jump to loopext

endloopext2: li		$t8, 92		# $t8 = 92
            sw		$t9, tabella($t8)		# 
            
            li		$v0, 10		# $v0 = 10
            syscall
.end main