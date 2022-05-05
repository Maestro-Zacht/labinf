.data

str1:       .asciiz "La stringa non e' palindroma"
str2:       .asciiz "La stringa e' palindroma"

.text
.globl main
.ent main
main:       li		$t0, 0		# $t0 = 0
            move 	$t9, $sp		# $t9 = $sp

startloop:  li		$v0, 12		# $v0 = 12
            syscall

            beq		$v0, '\n', endloop	# if $v0 == '\n' then endloop
            
            addi	$t0, $t0, 1			# $t0 = $t0 + 1
            addi	$sp, $sp, -1			# $sp = $sp + -1
            sb		$v0, 0($sp)		# 
            j		startloop				# jump to startloop

endloop:    add		$t1, $t0, $sp		# $t1 = $t0 + $sp
            addi	$t1, $t1, -1			# $t1 = $t1 + -1

startcheck: lb		$s0, 0($sp)		# 
            lb		$s1, 0($t1)		# 
            addi	$sp, $sp, 1			# $sp = $sp + 1
            addi	$t1, $t1, -1			# $t1 = $t1 + -1
            bne		$s0, $s1, notpal	# if $s0 != $s1 then notpal
            beq		$sp, $t1, pal	# if $sp == $t1 then pal
            addi	$t2, $t1, 1		# $t2 = $t1 + 1
            beq		$sp, $t2, pal	# if $sp == $t2 then pal
            j		startcheck				# jump to endloop

notpal:     li		$v0, 4		# system call #4 - print string
            la		$a0, str1
            syscall				# execute
            j		end				# jump to end

pal:        li		$v0, 4		# system call #4 - print string
            la		$a0, str2
            syscall				# execute

end:        move 	$sp, $t9		# $sp = $t9
            li		$v0, 10		# $v0 = 10
            syscall            
.end main