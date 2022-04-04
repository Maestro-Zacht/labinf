.data
str1:       .asciiz "Inserire 2 numeri:\n"
str2:       .asciiz "I numeri non vanno bene\n"
str3:       .asciiz "Il risultato e': "
.text
.globl main
.ent main
main:       li		$v0, 4		# $v0 = 4
            la		$a0, str1		# 
            syscall

            li      $v0, 5
            syscall
            move 	$t0, $v0		# $t0 = $v0

            li      $v0, 5
            syscall
            move 	$t1, $v0		# $t0 = $v0

            blt		$t0, 0, notok	# if $t0 < 0 then notok
            blt		$t1, 0, notok	# if $t1 < 0 then notok
            bge		$t0, 256, notok	# if $t0 >= 256 then notok
            bge		$t1, 256, notok	# if $t1 >= 256 then notok

            not     $t2, $t1
            and		$t3, $t0, $t2		# $t3 = $t0 & $t2
            not     $t3, $t3
            xor		$t4, $t0, $t1		# $t4 = $t0 ^ $t1

            li		$v0, 4		# $v0 = 4
            la		$a0, str3		# 
            syscall

            or		$a0, $t3, $t4		# $t5 = $t3 | $t4

            andi	$a0, $a0, 255			# $a0 = $a0 & 255
            
            
            li		$v0, 1		# $v0 = 1
            syscall

            j		fine				# jump to fine
            
notok:      li		$v0, 4		# $v0 = 4
            la		$a0, str2		# 
            syscall

fine:       li		$v0, 10		# $v0 = 1
            syscall

.end main