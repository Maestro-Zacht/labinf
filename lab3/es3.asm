.data

gg:         .byte 96
hh:         .byte 23
mm:         .byte 59
risultato:  .space 4
msg1:       .asciiz "Overflow!\n"
msg2:       .asciiz "Il risultato e': "

.text
.globl main
.ent main
main:       li		$t0, 24		# $t0 = 24
            li		$t1, 60		# $t1 = 60

            lbu		$t2, gg		# 
            lbu		$t3, hh		# 
            lbu		$t4, mm		# 
            
            multu	$t0, $t2			# $t0 * $t2 = Hi and Lo registers
            mflo	$t2					# copy Lo to $t2
            
            mfhi    $t5
            bne		$t5, 0, overflow	# if $t5 != 0 then overflow
            
            addu	$t3, $t3, $t2		# $t3 = $t3 + $t2
            blt		$t3, $t2, overflow	# if $t3 < $t2 then overflow
            
            
            mult	$t3, $t1			# $t3 * $t1 = Hi and Lo registers
            mflo	$t3					# copy Lo to $t3
            
            mfhi    $t5
            bne		$t5, 0, overflow	# if $t5 != 0 then overflow

            addu	$t4, $t4, $t3		# $t4 = $t4 + $t3
            blt		$t4, $t3, overflow	# if $t3 < $t2 then overflow

            li		$v0, 1		# system call #4 - print string
            la		$a0, msg2
            syscall				# execute

            li		$v0, 1		# system call #1 - print int
            move	$a0, $t4
            syscall				# execute
            
            j		end				# jump to end

overflow:   li		$v0, 1		# system call #4 - print msg2
            la		$a0, msg2
            syscall				# execute

end:        li		$v0, 10		# $v0 = 10
            syscall
.end main