.data

msg1:       .asciiz "Inserire un numero: "
msg2:       .asciiz "L'input non e' valido!\n"
msg3:       .asciiz "Il numero e': "

.text
.globl main
.ent main
main:       li		$t0, '0'		# $t0 = '0'
            li		$t1, 0		# $t1 = 0
            li		$t3, 10		# $t3 = 10
            

            li		$v0, 4		# $v0 = 4
            la		$a0, msg1		# 
            syscall

loop:       li		$v0, 12		# $v0 = 12
            syscall

            subu    $t2, $v0, $t0

            beq		$v0, '\n', correct	# if $v0 == '\n' then correct
            blt		$t2, 0, notok	# if $t2 < 0 then notok
            bgt		$t2, 9, notok	# if $t2 > 9 then notok

            multu	$t1, $t3			# $t1 * $t3 = Hi and Lo registers
            mfhi    $t4

            bne		$t4, 0, notok	# if $t4 != 0 then notok
            
            mflo    $t1

            addu		$t1, $t1, $t2		# $t1 = $t1 + $t2
            blt		$t1, $t2, notok	# if $t1 < $t2 then notok
            
            j		loop				# jump to loop
            

correct:    li		$v0, 4		# $v0 = 4
            la		$a0, msg3		# 
            syscall

            li		$v0, 1		# $v0 = 1
            move    $a0, $t1		# $a0 = $t1
            syscall

            j		end				# jump to end
            

notok:      li		$v0, 4		# $v0 = 4
            la		$a0, msg2		# 
            syscall

end:        li		$v0, 10		# $v0 = 10
            syscall
.end main