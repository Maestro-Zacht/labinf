.data

str1:       .asciiz "Inserire la dimensione del lato: "

.text
.globl main
.ent main
main:       li		$v0, 4		# system call #4 - print string
            la		$a0, str1
            syscall				# execute

            li		$v0, 5		# $v0 = 5
            syscall

            move 	$s1, $v0		# $s1 = $v0

            move 	$a0, $s1		# $a0 = $s1
            jal		stampaTriangolo				# jump to stampaTriangolo and save position to $ra

            move 	$a0, $s1		# $a0 = $s1
            jal		stampaQuadrato				# jump to stampaQuadrato and save position to $ra

            li		$v0, 10		# $v0 = 10
            syscall
.end main

.ent stampaTriangolo
stampaTriangolo:    li		$t0, 0		# $t0 = 0
                    move 	$s0, $a0		# $s0 = $a0

tloopext:           beq		$t0, $s0, tendeloop	# if $t0 == $s0 then tendeloop

                    li		$t1, 0		# $t1 = 0
tintloop:           bgt		$t1, $t0, tendiloop	# if $t1 > $t0 then tendiloop
                    
                    li		$a0, '*'		# $a0 = '*'
                    li		$v0, 11		# $v0 = 11
                    syscall

                    addi	$t1, $t1, 1			# $t1 = $t1 + 1
                    j		tintloop				# jump to tintloop

tendiloop:          addi	$t0, $t0, 1			# $t0 = $t0 + 1

                    li		$a0, '\n'		# $a0 = '\n'
                    li		$v0, 11		# $v0 = 11
                    syscall
                    
                    j		tloopext				# jump to tloopext

tendeloop:          jr		$ra					# jump to $ra
.end stampaTriangolo

.ent stampaQuadrato
stampaQuadrato:     li		$t0, 0		# $t0 = 0
                    move 	$s0, $a0		# $s0 = $a0
                    
qloopext:           beq		$t0, $s0, qendeloop	# if $t0 == $s0 then qendeloop

                    li		$t1, 0		# $t1 = 0
qintloop:           beq		$t1, $s0, qendiloop	# if $t1 == $s0 then qendiloop

                    li		$a0, '*'		# $a0 = '*'
                    li		$v0, 11		# $v0 = 11
                    syscall

                    addi	$t1, $t1, 1			# $t1 = $t1 + 1
                    j		qintloop

qendiloop:          addi	$t0, $t0, 1			# $t0 = $t0 + 1

                    li		$a0, '\n'		# $a0 = '\n'
                    li		$v0, 11		# $v0 = 11
                    syscall

                    j		qloopext				# jump to qloopext

qendeloop:          jr		$ra	
.end stampaQuadrato