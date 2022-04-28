.data

vet:        .word 1, 1
            .space 72

.text
.globl main
.ent main
main:       li		$t0, 2		# $t0 = 2
            li		$t1, 20		# $t1 = 20
            li		$t2, 1		# $t2 = 1
            li		$t3, 1		# $t3 = 1
            
            
loop:       beq		$t0, $t1, endloop	# if $t0 == $t1 then endloop
            add		$t4, $t2, $t3		# $t4 = $t2 + $t3
            sll		$t5, $t0, 2			# $t5 = $t0 << 2
            sw		$t4, vet($t5)		# 

            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            move 	$t2, $t3		# $t2 = $t3
            move 	$t3, $t4		# $t3 = $t4
            j		loop				# jump to loop
            
endloop:    li		$v0, 10		# $v0 = 10
            syscall
            
.end main