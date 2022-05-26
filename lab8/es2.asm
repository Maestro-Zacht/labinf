LUNG = 6
.data
anni:       .word 1945, 2008, 1800, 2006, 1748, 1600
ris:        .space LUNG
.text
.globl main
.ent main
main:       subu    $sp, $sp, 4
            sw		$ra, 0($sp)		# 

            la      $a0, anni
            la      $a1, ris
            li      $a2, LUNG
            jal     bisestile

            lw		$ra, 0($sp)		# 
            addiu   $sp, $sp, 4

            jr		$ra					# jump to $ra
.end main

.ent bisestile
bisestile:      li		$t0, 0		# $t0 = 0
                li		$t1, 0		# $t1 = 0
                li		$t9, 100		# $t9 = 100
                
                
bloop:          beq		$t0, $a2, bendloop	# if $t0 == $a2 then bendloop
                add		$t2, $t1, $a0		# $t2 = $t1 + $a0
                lw		$t2, 0($t2)		# 
                
                div		$t2, $t9			# $t2 / $t9
                mfhi	$t3					# $t3 = $t2 mod $t9 

                li		$t8, 4		# $t8 = 4
                
                bne		$t3, 0, endifcent	# if $t3 != 0 then endifcent
                li		$t8, 400		# $t8 = 400
endifcent:      div		$t2, $t8			# $t2 / $t8
                mfhi	$t3					# $t3 = $t2 mod $t8 

                seq     $t4, $t3, 0
                
                add		$t2, $t0, $a1		# $t2 = $t0 + $a1
                sb		$t4, 0($t2)		# 
                
                addu    $t0, $t0, 1
                addu    $t1, $t1, 4
                j       bloop
                
bendloop:       jr		$ra					# jump to $ra                
.end bisestile