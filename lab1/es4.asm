.data

var:        .word 0x3FFFFFF0

.text
.globl main
.ent main
main:       li		$t2, 2		        # $t1 = 2
            lw		$t0, var		    # 
            mult	$t0, $t2			# $t0 * $t1 = Hi and Lo registers
            mflo	$t1				    # copy Lo to $t2
            addiu	$t3, $t1, 40		# $t3 = $t1 + 40
            
            li		$v0, 1		        # $v0 = 1
            move 	$a0, $t3		    # $a0 = $t3
            syscall

            li		$t2, 40		        # $t2 = 40
            addu    $t3, $t1, $t2

            li		$v0, 1		        # $v0 = 1
            move 	$a0, $t3		    # $a0 = $t3
            syscall

            li		$v0, 10		        # $v0 = 10
            syscall

.end main