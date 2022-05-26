.data
ora_in:     .byte 12, 47
ora_out:    .byte 18, 14
X:          .byte 1
Y:          .byte 40
.text
.globl main
main:       subu    $sp, $sp, 4
            sw		$ra, 0($sp)		# 

            la      $a0, ora_in            # indirizzo di ora_in
            la      $a1, ora_out            # indirizzo di ora_out
            lbu     $a2, X
            lbu     $a3, Y
            jal     costoParcheggio

            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 1		# system call #1 - print int
            syscall				# execute

            lw		$ra, 0($sp)		# 
            addiu   $sp, $sp, 4

            jr		$ra					# jump to $ra
.end main

.ent costoParcheggio
costoParcheggio:        lbu     $t0, 0($a0)
                        lbu     $t1, 1($a0)
                        lbu     $t2, 0($a1)
                        lbu     $t3, 1($a1)

                        subu	$t4, $t2, $t0		# $t4 = $t2 - $t0
                        mul     $t4, $t4, 60
                        
                        bge		$t3, $t1, elsegif	# if $t3 >= $t1 then elsegif
                        li      $t6, 60
                        subu    $t5, $t6, $t1
                        addu    $t5, $t5, $t3
                        subu    $t4, $t4, 60
                        j		endgif				# jump to endgif

elsegif:                subu    $t5, $t3, $t1
endgif:                 addu    $t4, $t4, $t5

                        div		$t4, $a3			# $t4 / $a3
                        mflo	$v0					# $v0 = floor($t4 / $a3) 
                        mfhi	$t0					# $$t0 = $t4 mod $a3 

                        mul     $v0, $v0, $a2
                        
                        beq		$t0, 0, endifresto	# if $t0 == 0 then endifresto
                        addu    $v0, $v0, $a2
endifresto:             jr		$ra					# jump to $ra
.end costoParcheggio