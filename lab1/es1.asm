.data

n1:     .byte 10
n2:     .byte 0x10
n3:     .byte '1'
res:    .space 1

.text
.globl main
.ent main
main:       la		$t5, n1 
            lb		$t1, ($t5)

            la		$t6, n2
            lb		$t2, ($t6)

            la		$t7, n3
            lb		$t3, ($t7)
            
            sub		$t4, $t1, $t2		# $t4 = $t1 - $t2
            add		$t4, $t4, $t3		# $t4 = $t4 + $t3

            la		$t0, res 
            sb		$t4, ($t0)
            

.end main