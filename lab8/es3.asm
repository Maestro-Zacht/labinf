NUM = 5
DIM = NUM * 4
SCONTO = 30
ARROTONDA = 1
.data
prezzi:         .word 39, 1880, 2394, 1000, 1590
scontati:       .space DIM
.text
.globl main
.ent main
main:       subu    $sp, $sp, 4
            sw		$ra, 0($sp)		# 

            la      $a0, prezzi
            la      $a1, scontati
            li      $a2, NUM
            li      $a3, SCONTO
            li      $t0, ARROTONDA
            subu    $sp, 4
            sw      $t0, ($sp)
            jal     calcola_sconto

            addiu   $sp, $sp, 4

            lw		$ra, 0($sp)		# 
            addiu   $sp, $sp, 4

            jr		$ra					# jump to $ra
.end main

.ent calcola_sconto
calcola_sconto:     subu	$sp, $sp, 4
                    sw		$fp, 0($sp)		# 
                    move 	$fp, $sp		# $fp = $sp
                    
                    lw		$t9, 4($fp)		# 
                    li		$t8, 100		# $t8 = 100
                    
                    
                    li		$t0, 0		# $t0 = 0
                    
cloop:              beq		$t0, $a2, endcloop	# if $t0 == $a2 then endcloop
                    sll		$t1, $t0, 2			# $t1 = $t0 << 2
                    addu    $t1, $t1, $a0
                    lw		$t1, 0($t1)		# 
                    mul     $t2, $t1, $a3
                    div		$t2, $t8			# $t2 / $t8
                    mflo	$t2					# $t2 = floor($t2 / $t8) 
                    mfhi	$t3					# $t3 = $t2 mod $t8 
                    
                    sge     $t3, $t3, 50

                    and		$t3, $t3, $t9		# $t3 = $t3 & $t9
                    
                    

endcloop:           

                    lw		$fp, 0($sp)		# 
                    addu    $sp, $sp, 4

                    jr		$ra					# jump to $ra
.end calcola_sconto