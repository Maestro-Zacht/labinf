.data
DIM=8
.text
.globl main
.ent main
main:       jal		stampaTriangolo				# jump to stampaTriangolo and save position to $ra
            jal		stampaQuadrato				# jump to stampaQuadrato and save position to $ra
            li		$v0, 10		# $v0 = 10
            syscall
.end main

.ent stampaTriangolo
stampaTriangolo:    li		$t0, 0		# $t0 = 0
                    
tloopext:           beq		$t0, DIM, tendeloop	# if $t0 == DIM then tendeloop

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
                    
qloopext:           beq		$t0, DIM, qendeloop	# if $t0 == DIM then qendeloop

                    li		$t1, 0		# $t1 = 0
qintloop:           beq		$t1, DIM, qendiloop	# if $t1 == DIM then qendiloop

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