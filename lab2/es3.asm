.data
var1:          .word 48
var2:          .word 47
var3:          .word 6
spazio:        .byte ' '
.text
.globl main
.ent main
main:       lw		$t1, var1		# 
            lw		$t2, var2		# 
            lw		$t3, var3		# 

            blt		$t1, $t2, swap2	# if $t1 < $t2 then swap2
            
            # swap $t1 $t2
            add		$t1, $t1, $t2		# $t1 = $t1 + $t2
            sub		$t2, $t1, $t2		# $t2 = $t1 - $t2
            sub		$t1, $t1, $t2		# $t1 = $t1 - $t2

swap2:      blt		$t1, $t3, swap3	    # if $t1 < $t3 then swap3

            # swap $t1 $t3
            add		$t1, $t1, $t3		# $t1 = $t1 + $t3
            sub		$t3, $t1, $t3		# $t3 = $t1 - $t3
            sub		$t1, $t1, $t3		# $t1 = $t1 - $t3

swap3:      blt		$t2, $t3, fine	    # if $t1 < $t3 then fine

            # swap $t2 $t3
            add		$t2, $t2, $t3		# $t2 = $t2 + $t3
            sub		$t3, $t2, $t3		# $t3 = $t2 - $t3
            sub		$t2, $t2, $t3		# $t2 = $t2 - $t3

fine:       li		$v0, 1		# $v0 = 1
            move 	$a0, $t1		# $a0 = $t1
            syscall

            li		$v0, 11		# $v0 = 1
            lb		$a0, spazio
            syscall

            li		$v0, 1		# $v0 = 1
            move 	$a0, $t2		# $a0 = $t2
            syscall

            li		$v0, 11		# $v0 = 1
            lb		$a0, spazio
            syscall

            li		$v0, 1		# $v0 = 1
            move 	$a0, $t3		# $a0 = $t2
            syscall

            li		$v0, 10		# $v0 = 10
            syscall
.end main