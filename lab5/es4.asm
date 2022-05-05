.data
DIM = 3
matrice:    .word 1, 0, 2
            .word 0, 1, 5
            .word 2, 5, 1

.text
.globl main
.ent main
main:       li		$t0, 0		# $t0 = 0
            li		$s0, 1		# $s0 = 1 diagonale
            li		$s1, 1		# $s1 = 1 simmetrica
            li		$t3, DIM		# $t3 = DIM
            
            
extloop:    beq		$t0, DIM, endeloop	# if $t0 == DIM then endeloop

            li		$t1, 0		# $t1 = 0
intloop:    beq		$t1, DIM, endiloop	# if $t1 == DIM then endiloop
            
            multu	$t0, $t3			# $t0 * $t3 = Hi and Lo registers
            mflo	$t2					# copy Lo to $t2
            addu	$t2, $t1, $t2		# $t2 = $t1 + $t2
            sll		$t2, $t2, 2			# $t2 = $t2 << 2

            lw		$t9, matrice($t2)		# 

            multu	$t1, $t3			# $t1 * $t3 = Hi and Lo registers
            mflo	$t2					# copy Lo to $t2
            addu	$t2, $t0, $t2		# $t2 = $t0 + $t2
            sll		$t2, $t2, 2			# $t2 = $t2 << 2
            
            lw		$t8, matrice($t2)		# 

            beq		$t9, $t8, diag	# if $t9 == $t8 then diag
            li		$s0, 0		# $s0 = 0
            li		$s1, 0		# $s1 = 0
            j		endeloop				# jump to endeloop

diag:       beq		$t0, $t1, isdiag	# if $t0 == $t1 then isdiag
            beq		$t9, 0, incr	# if $t9 == 0 then incr
            li		$s0, 0		# $s0 = 0
            
isdiag:     bne		$t9, 0, incr	# if $t9 != 0 then incr
            li		$s0, 0		# $s0 = 0

incr:       addi	$t1, $t1, 1			# $t1 = $t1 + 1
            j		intloop				# jump to intloop
            
endiloop:   addi	$t0, $t0, 1			# $t0 = $t0 + 1
            j		extloop				# jump to extloop

endeloop:   add		$a0, $s0, $s1		# $a0 = $s0 + $s1
            li		$v0, 1		# system call #1 - print int
            syscall				# execute

            li		$v0, 10		# $v0 = 10
            syscall
.end main