.data

msg1:       "Inserire un numero: "
msg2:       "La media e': "

.text
.globl main
.ent main
main:       li		$t0, 0		# $t0 = 0
            li		$t1, 0		# $t1 = 0
            
loop:       beq		$t0, DIM, endloop	# if $t0 == DIM then endloop
            
            li		$v0, 1		# system call #4 - print string
            la		$a0, msg1
            syscall				# execute

            li		$v0, 5		# $v0 = 5
            syscall

            addu	$t1, $t1, $v0

            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            j		loop				# jump to loop

endloop:    div		$t1, DIM			# $t1 / DIM
            mflo	$t2					# $t2 = floor($t1 / DIM) 
            mfhi	$t3					# $t3 = $t1 mod DIM 

            li		$v0, 1		# system call #4 - print string
            la		$a0, msg2
            syscall				# execute

            li		$v0, 1		# system call #1 - print int
            move	$a0, $t2
            syscall				# execute

            li		$v0, 10		# $v0 = 10
            syscall
            
.end main