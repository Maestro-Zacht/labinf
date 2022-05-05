.data

var:        .word 3141592653

.text
.globl main
.ent main
main:       lw		$t0, var		#
            li		$t9, 0		# $t9 = 0
            li		$t8, 10		# $t8 = 10
            
startloop:  divu    $t0, $t8			# $t0 / 10
            mflo	$t0					# $t0 = floor($t0 / 10) 
            mfhi	$t1					# $t1 = $t0 mod 10 
            
            addi	$sp, $sp, -4			# $sp = $sp + -4
            sw		$t1, 0($sp)		# 
            addi	$t9, $t9, 1			# $t9 = $t9 + 1

            bne		$t0, 0, startloop	# if $t0 != 0 then startloop
            
startprint: lw		$t1, 0($sp)		#
            addi	$sp, $sp, 4			# $sp = $sp + 4
            
            addi	$a0, $t1, '0'			# $t1 = $t1 + '0'
            li		$v0, 11		# $v0 = 11
            syscall
            addi	$t0, $t0, 1			# $t0 = $t0 + 1

            bne		$t0, $t9, startprint	# if $t0 != $t9 then startprint
            
            li		$v0, 10		# $v0 = 10
            syscall
.end main