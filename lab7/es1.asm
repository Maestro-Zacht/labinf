.data
.text
.globl main
.ent main
main:       addi	$sp, $sp, -4			# $sp = $sp + -4
            sw		$ra, 0($sp)		# 

            li		$t0, 4		# $t0 = 4
            li		$t1, 2		# $t1 = 2
            li		$t2, -5		# $t2 = -5
            li		$t3, 3		# $t3 = 3
            
            li		$s0, 8		# $s0 = 8
            li		$s1, 4		# $s1 = 4
            li		$s2, 27		# $s2 = 4
            li		$s3, 9		# $s3 = 4
            li		$s4, 64		# $s4 = 4
            li		$s5, 16		# $s5 = 4
            
            add		$a0, $t1, $t0		# $a0 = $t1 + $t0
            add		$a0, $a0, $t2		# $a0 = $a0 + $t2
            add		$a0, $a0, $t3		# $a0 = $a0 + $t3
            
            mul     $a1, $t0, $s0
            mul     $t9, $t1, $s1
            sll		$t8, $t2, 1			# $t8 = $t2 << 1
            add		$a1, $a1, $t9		# $a1 = $a1 + $t9
            add		$a1, $a1, $t8		# $a1 = $a1 + $t8
            add		$a1, $a1, $t3		# $a1 = $a1 + $t3
            
            mul     $a2, $t0, $s2
            mul     $t9, $t1, $s3
            mul     $t8, $t2, 3
            add		$a2, $a2, $t9		# $a2 = $a2 + $t9
            add		$a2, $a2, $t8		# $a2 = $a2 + $t8
            add		$a2, $a2, $t3		# $a2 = $a2 + $t3

            mul     $a3, $t0, $s4
            mul     $t9, $t1, $s5
            sll		$t8, $t2, 2			# $t8 = $t2 << 1
            add		$a3, $a3, $t9		# $a3 = $a3 + $t9
            add		$a3, $a3, $t8		# $a3 = $a3 + $t8
            add		$a3, $a3, $t3		# $a3 = $a3 + $t3

            addi	$sp, $sp, -20			# $sp = $sp + -4

            sw		$t0, 16($sp)		# 
            sw		$t1, 12($sp)		# 
            sw		$t2, 8($sp)		# 
            sw		$t3, 4($sp)		# 
            
            li		$t9, 10		# $t9 = 10
            sw		$t9, 0($sp)		# 

            jal		polinomio				# jump to polinomio and save position to $ra

            lw		$t9, 0($sp)		# 
            lw		$t3, 4($sp)		# 
            lw		$t2, 8($sp)		# 
            lw		$t1, 12($sp)		# 
            lw		$t0, 16($sp)		# 
            addi	$sp, $sp, 20			# $sp = $sp + 20
            
            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 1		# $v0 = 1
            syscall

            lw		$ra, 0($sp)		# 
            addi	$sp, $sp, 4			# $sp = $sp + 4
            jr		$ra					# jump to $ra
.end main

.ent polinomio
polinomio:  lw		$t9, 0($sp)		# 
            
            sub		$t0, $a1, $a0		# $t0 = $a1 - $a0
            sub		$t1, $a2, $a1		# $t1 = $a2 - $a1
            sub		$t2, $a3, $a2		# $t2 = $a3 - $a2

            addi	$sp, $sp, -12			# $sp = $sp + -12
            sw		$s0, 8($sp)		# 
            sw		$s1, 4($sp)		# 
            sw		$s2, 0($sp)		# 
            
            sub		$s0, $t1, $t0		# $s0 = $t1 - $t0
            sub		$s1, $t2, $t1		# $s1 = $t2 - $t1
            sub		$s2, $s1, $s0		# $s2 = $s1 - $s0

            move 	$v0, $a3		# $v0 = $a3

            li		$t8, 0		# $t8 = 0
            addi	$t9, $t9, -4			# $t9 = $t9 + -4
            
loop:       beq		$t8, $t9, endloop	# if $t8 == $t9 then endloop
            add		$s1, $s1, $s2		# $s1 = $s1 + $s2
            add		$t2, $t2, $s1		# $t2 = $t2 + $s1
            add		$v0, $v0, $t2		# $v0 = $v0 + $t2
            addi	$t8, $t8, 1			# $t8 = $t8 + 1
            j		loop				# jump to loop

endloop:    lw		$s2, 0($sp)		# 
            lw		$s1, 4($sp)		# 
            lw		$s0, 8($sp)		# 
            addi	$sp, $sp, 12			# $sp = $sp + 12

            jr		$ra					# jump to $ra
.end polinomio