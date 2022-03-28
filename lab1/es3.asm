.data

op1:        .byte 150
op2:        .byte 100

.text
.globl main
.ent main
main:       lbu		$t1, op1		# 
            lbu		$t2, op2		# 
            
            addu	$a0, $t1, $t2		# $t0 = $t1 + $t2
            
            li		$v0, 1		# $v0 = 1
            syscall

            li		$v0, 10		# $v0 = 10
            syscall

.end main