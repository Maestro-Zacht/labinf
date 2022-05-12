.data
.text
.globl main
.ent main
main:       li		$a0, 6		# $a0 = 6
            li		$a1, 3		# $a1 = 3
            jal		combina				# jump to combina and save position to $ra
            
            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 1		# system call #1 - print int
            syscall				# execute

            li		$a0, '\n'		# $v0 = '\n'
            li		$v0, 11		# $v0 = 11
            syscall

            li		$a0, 12		# $a0 = 12
            li		$a1, 2		# $a1 = 2
            jal		combina				# jump to combina and save position to $ra
            
            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 1		# system call #1 - print int
            syscall				# execute

            li		$v0, 10		# $v0 = 10
            syscall
.end main

.ent combina
combina:    move 	$t9, $a0		# $t9 = $a0
            li		$t0, 1		# $t0 = 1
            li		$t8, 1		# $t8 = 1
            
loop:       beq		$t0, $a1, endloop	# if $t0 == $a1 then endloop

            sub		$t1, $a0, $t0		# $t1 = $a0 - $t0
            mult	$t9, $t1			# $t9 * $t1 = Hi and Lo registers
            mflo	$t9					# copy Lo to $t9

            mult	$t8, $t0			# $t8 * $t0 = Hi and Lo registers
            mflo	$t8					# copy Lo to $t8

            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            j		loop				# jump to loop
            
endloop:    mult	$t8, $a1			# $t8 * $a1 = Hi and Lo registers
            mflo	$t8					# copy Lo to $t8

            div		$t9, $t8			# $t9 / $t8
            mflo	$v0					# $v0 = floor($t9 / $t8) 
            
            jr		$ra					# jump to $ra
.end combina