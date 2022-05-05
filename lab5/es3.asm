.data

str1:       .asciiz "Ci sono soluzioni reali"
str2:       .asciiz "Non ci sono soluzioni reali"
str3:       .asciiz "a: "
str4:       .asciiz "b: "
str5:       .asciiz "c: "

.text
.globl main
.ent main
main:       li		$v0, 4		# system call #4 - print string
            la		$a0, str3
            syscall				# execute
            li		$v0, 5		# $v0 = 5
            syscall
            move 	$t0, $v0		# $t0 = $v0

            li		$v0, 4		# system call #4 - print string
            la		$a0, str4
            syscall				# execute
            li		$v0, 5		# $v0 = 5
            syscall
            move 	$t1, $v0		# $t1 = $v0

            li		$v0, 4		# system call #4 - print string
            la		$a0, str5
            syscall				# execute
            li		$v0, 5		# $v0 = 5
            syscall
            move 	$t2, $v0		# $t2 = $v0

            mult	$t1, $t1			# $t1 * $t1 = Hi and Lo registers
            mflo	$t3					# copy Lo to $t3
            
            mult	$t0, $t2			# $t0 * $t2 = Hi and Lo registers
            mflo	$t4					# copy Lo to $t4
            sll		$t4, $t4, 2			# $t4 = $t4 << 2
            
            slt		$t0, $t3, $t4		# $t0 = ($t3 < $t4) ? 1 : 0
            beq		$t0, 1, nonreal	# if $t0 == 1 then nonreal

real:       li		$v0, 4		# system call #4 - print string
            la		$a0, str1
            syscall				# execute
            j		end				# jump to end
            
nonreal:    li		$v0, 4		# system call #4 - print string
            la		$a0, str2
            syscall				# execute

end:        li		$v0, 10		# $v0 = 10
            syscall
.end main