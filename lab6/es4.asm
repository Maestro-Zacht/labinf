.data

DIM=11
vet:        .word 4, 6, 8, 9, 574589, 4, 1, 5745890, 36, 5, 8

.text
.globl main
.ent main
main:       la		$a0, vet		# 
            li		$a1, DIM		# $a1 = DIM
            jal		massimo				# jump to massimo and save position to $ra
            
            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 1		# $v0 = 1
            syscall

            li		$v0, 10		# $v0 = 10
            syscall
.end main

.ent massimo
massimo:    li		$t0, 1		# $t0 = 1
            lw		$v0, 0($a0)		# 
            
loop:       beq		$t0, $a1, endloop	# if $t0 == $a1 then endloop

            sll		$t1, $t0, 2			# $t1 = $t0 << 2
            add		$t1, $t1, $a0		# $t1 = $t1 + $a0
            lw		$t2, 0($t1)		# 
            
            ble		$t2, $v0, notg	# if $t2 <= $v0 then notg
            move 	$v0, $t2		# $v0 = $t2

notg:       addi	$t0, $t0, 1			# $t0 = $t0 + 1
            j		loop				# jump to loop
        
endloop:    jr		$ra					# jump to $ra
.end massimo