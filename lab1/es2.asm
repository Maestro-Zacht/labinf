.data

var1:       .byte 'm'
var2:       .byte 'i'
var3:       .byte 'p'
var4:       .byte 's'
var5:       .byte 0

.text
.globl main
.ent main

main:       li		$t0, -32		# $t0 = -32

            la		$s1, var1		# 
            lb		$t1, 0($s1)		# 
            
            la		$s2, var2		# 
            lb		$t2, 0($s2)		# 

            la		$s3, var3		# 
            lb		$t3, 0($s3)		# 

            la		$s4, var4		# 
            lb		$t4, 0($s4)		#

            add		$t1, $t1, $t0		# $t1 = $t1 + $t0
            add		$t2, $t2, $t0		# $t2 = $t2 + $t0
            add		$t3, $t3, $t0		# $t3 = $t3 + $t0
            add		$t4, $t4, $t0		# $t4 = $t4 + $t0
            
            sb		$t1, 0($s1)		# 
            sb		$t2, 0($s2)		# 
            sb		$t3, 0($s3)		# 
            sb		$t4, 0($s4)		# 

            li		$v0, 4		# $v0 = 4
            move 	$a0, $s1		# $a0 = $s1
            syscall

            li		$v0, 10		# $v0 = 10
            syscall

.end main