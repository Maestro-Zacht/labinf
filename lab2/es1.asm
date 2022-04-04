.data
str1:       .asciiz "Inserire un numero: "
strp:       .asciiz "\nIl numero e' pari.\n"
strd:       .asciiz "\nIl numero e' dispari.\n"
.text
.globl main
.ent main
main:       li		$v0, 4		# $v0 = 4
            la		$a0, str1		# 
            syscall

            li      $v0, 5
            syscall

            andi	$t0, $v0, 1			# $t0 = $v0 & 1

            beq		$t0, 1, dispari	# if $t0 == 1 then dispari

            li		$v0, 4		# $v0 = 4
            la		$a0, strp		# 
            syscall
            
            j		fine				# jump to fine

dispari:    li		$v0, 4		# $v0 = 4
            la		$a0, strd		# 
            syscall

fine:       li		$v0, 10		# $v0 = 10
            syscall

.end main