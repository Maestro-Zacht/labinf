.data

tabj:       .word caso0, caso1, caso2, caso3
str1:       .asciiz "Inserire un numero tra 0 e 3: "
opa:        .word 2043
opb:        .word 5
res:        .space 4

.text
.globl main
.ent main
main:       lw		$s0, opa		# 
            lw		$s1, opb		# 
            
            li		$v0, 4		# $v0 = 4
            la		$a0, str1		# 
            syscall

            li		$v0, 5		# $v0 = 5
            syscall

            bgt		$v0, 3, end	# if $v0 > 3 then end
            blt		$v0, 0, end	# if $v0 < 0 then end
            
            sll		$t0, $v0, 2			# $t0 = $v0 << 2
            
            lw		$t1, tabj($t0)		# 
            jr		$t1					# jump to $t1
            
caso0:      add		$s2, $s0, $s1		# $s2 = $s0 + $s1
            j		endswitch				# jump to endswitch
            
caso1:      sub		$s2, $s0, $s1		# $s2 = $s0 - $s1
            j		endswitch				# jump to endswitch

caso2:      mult	$s0, $s1			# $s0 * $s1 = Hi and Lo registers
            mflo	$s2					# copy Lo to $s2
            j		endswitch				# jump to endswitch

caso3:      div		$s0, $s1			# $s0 / $s1
            mflo	$s2					# $s2 = floor($s0 / $s1) 
            j		endswitch				# jump to endswitch

endswitch:  sw		$s2, res		# 


end:        li		$v0, 10		# $v0 = 10
            syscall
.end main