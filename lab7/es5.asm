.data

mat:        .word   5, 1, 2
            .word   1, 4, 1
            .word   58, 1, 47

.text
.globl main
.ent main
main:       la		$t0, mat		# 
            lw		$a0, 0($t0)		# 
            lw		$a1, 4($t0)		# 
            lw		$a2, 8($t0)		# 
            lw		$a3, 12($t0)		# 
            
            addi	$sp, $sp, -24			# $sp = $sp + -24
            sw		$ra, 20($sp)		# 
            lw		$t1, 16($t0)		# 
            sw		$t1, 16($sp)		# 
            lw		$t1, 20($t0)		# 
            sw		$t1, 12($sp)		# 
            lw		$t1, 24($t0)		# 
            sw		$t1, 8($sp)		# 
            lw		$t1, 28($t0)		# 
            sw		$t1, 4($sp)		# 
            lw		$t1, 32($t0)		# 
            sw		$t1, 0($sp)		# 
            
            jal		determinante3x3				# jump to determinante3x3 and save position to $ra
            
            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 1		# system call #1 - print int
            syscall				# execute

            lw		$ra, 20($sp)		# 
            addi	$sp, $sp, 24			# $sp = $sp + 24
            
            jr      $ra
.end main

.ent determinante2x2
determinante2x2:        mul     $v0, $a0, $a3
                        mul     $t0, $a1, $a2
                        sub		$v0, $v0, $t0		# $v0 = $v0 - $t0
                        jr		$ra					# jump to $ra
.end determinante2x2

.ent determinante3x3
determinante3x3:        lw		$t4, 0($sp)		# 
                        lw		$t3, 4($sp)		#
                        lw		$t2, 8($sp)		#
                        lw		$t1, 12($sp)		#
                        lw		$t0, 16($sp)		#

                        addi	$sp, $sp, -40			# $sp = $sp + -40
                        sw		$ra, 36($sp)		# 
                        sw		$s0, 32($sp)		# 
                        sw		$s1, 28($sp)		# 
                        sw		$s2, 24($sp)		# 
                        sw		$s3, 20($sp)		# 
                        sw		$s4, 16($sp)		# 
                        sw		$s5, 12($sp)		# 
                        sw		$s6, 8($sp)		# 
                        sw		$s7, 4($sp)		# 
                        sw		$a0, 0($sp)		# 

                        move 	$s0, $a1		# $s0 = $a3
                        move 	$s1, $a2		# $s1 = $t0
                        move 	$s2, $a3		# $s2 = $t1
                        move 	$s3, $t0		# $s3 = $t2
                        move 	$s4, $t1		# $s4 = $t3
                        move 	$s5, $t2		# $s5 = $t4
                        move 	$s6, $t3		# $s6 = $a1
                        move 	$s7, $t4		# $s7 = $a2

                        move 	$a0, $s3		# $a0 = $t1
                        move 	$a1, $s4		# $a1 = $s4
                        move 	$a2, $s6		# $a2 = $s6
                        move 	$a3, $s7		# $a3 = $s7

                        jal		determinante2x2				# jump to determinante2x2 and save position to $ra
                        
                        lw		$t0, 0($sp)		#                         
                        mul     $t0, $t0, $v0
                        sw		$t0, 0($sp)		# 
                        

                        move 	$a0, $s2		# $a0 = $t1
                        move 	$a1, $s4		# $a1 = $s4
                        move 	$a2, $s5		# $a2 = $s6
                        move 	$a3, $s7		# $a3 = $s7

                        jal		determinante2x2				# jump to determinante2x2 and save position to $ra
                        
                        lw		$t0, 0($sp)		# 
                        mul     $s0, $s0, $v0
                        sub		$t0, $t0, $s0		# $t0 = $t0 - $s0
                        sw		$t0, 0($sp)		# 

                        move 	$a0, $s2		# $a0 = $t1
                        move 	$a1, $s3		# $a1 = $s4
                        move 	$a2, $s5		# $a2 = $s6
                        move 	$a3, $s6		# $a3 = $s7

                        jal		determinante2x2				# jump to determinante2x2 and save position to $ra

                        lw		$t0, 0($sp)		# 
                        mul     $s1, $s1, $v0
                        add		$v0, $t0, $s1		# $v0 = $t0 + $s1
                        
                        lw		$s7, 4($sp)		# 
                        lw		$s6, 8($sp)		# 
                        lw		$s5, 12($sp)		# 
                        lw		$s4, 16($sp)		# 
                        lw		$s3, 20($sp)		# 
                        lw		$s2, 24($sp)		# 
                        lw		$s1, 28($sp)		# 
                        lw		$s0, 32($sp)		# 
                        lw		$ra, 36($sp)		# 
                        addi	$sp, $sp, 40			# $sp = $sp + 40
                        
                        jr		$ra					# jump to $ra
.end determinante3x3