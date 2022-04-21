.data

msg1:       .asciiz "Inserire un numero: "
msg2:       .asciiz "\nL'input non e' valido!\n"
msg3:       .asciiz "Il numero e': "
msg4:       .asciiz "\nNon e' rappresentabile su 4 byte\n"
msg5:       .asciiz "E' rappresentabile su 4 byte\n"

.text
.globl main
.ent main
main:       li		$t0, '0'		# $t0 = '0'
            li		$t1, 0		# $t1 = 0
            li		$t3, 10		# $t3 = 10
            li		$t5, 0x0000ffff		# $t5 = 0x0000ffff
            

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

            bne		$t4, 0, toolong	# if $t4 != 0 then notok
            
            mflo    $t1

            addu		$t1, $t1, $t2		# $t1 = $t1 + $t2
            blt		$t1, $t2, toolong	# if $t1 < $t2 then notok
            
            j		loop				# jump to loop

notok:      li		$v0, 4		# $v0 = 4
            la		$a0, msg2		# 
            syscall
            j		end				# jump to end
            

correct:    li		$v0, 4		# $v0 = 4
            la		$a0, msg5		# 
            syscall

            li		$v0, 4		# $v0 = 4
            la		$a0, msg3		# 
            syscall

            j		print				# jump to end

toolong:    li		$v0, 4		# $v0 = 4
            la		$a0, msg4		# 
            syscall

print:      li		$v0, 1		# system call #1 - print int
            move	$a0, $t1
            syscall				# execute        

end:        li		$v0, 10		# $v0 = 10
            syscall
.end main