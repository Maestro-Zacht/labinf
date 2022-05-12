.data

strconv:        .asciiz "paroladaconvertire"

.text
.globl main
.ent main
main:       li		$s0, 0		# $s0 = 0

loop:       lb		$a0, strconv($s0)		# 
            beq		$a0, 0, endloop	# if $a0 == 0 then endloop
            
            jal		upper				# jump to upper and save position to $ra
            
            move 	$a0, $v0		# $a0 = $v0
            li		$v0, 11		# $v0 = 11
            syscall

            addi	$s0, $s0, 1			# $s0 = $s0 + 1
            j		loop				# jump to loop

endloop:    li		$v0, 10		# $v0 = 10
            syscall
.end main

.ent upper
upper:      li		$t0, 'A'		# $t0 = 'A'
            li		$t1, 'a'		# $t1 = 'a'
            sub		$t2, $t0, $t1		# $t2 = $t0 - $t1
            
            add		$v0, $a0, $t2		# $v0 = $a0 + $t2
            jr		$ra					# jump to $ra
.end upper