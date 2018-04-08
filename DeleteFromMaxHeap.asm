.data 
	# v = { 73, 61, 42, 52, 19, 48, 25, 26, 12, 31};
	list: .word 73, 61, 42, 52, 19, 48, 25, 26, 12, 31
	.eqv n, 10
	.eqv r,9
	
.text 
la $t0 list
li $s2 r
li $s1 n
mulo $s0 $s2 2
nop
addi $s0 $s0 1
sgt $t1 $s1 1
beq $t1 0 endif
	mulo $t1 $s1 4
	mulo $t2 $s2 4
      	subi $s1 $s1 1
      	add $t1 $t0 $t1
      	add $t2 $t0 $t2
      	lw $t3 ($t1)
      	sw $t3 ($t2)
      	sw $zero ($t1)
endif:
startloop:
slt $t1 $s0 $s1
beq $t1 0 endwhile
	mulo $s6 $s0 4
	subi $s3 $s1 1
	add $t5 $t0 $s6
	lw $t7 ($t5)
	lw $t8 4($t5)
	slt $t1 $s0 $s3
	slt $t2 $t7 $t8
	and $t3 $t1 $t2
	beq $t3 0 pula
		addi $s0 $s0 1
	pula:
	mulo $t3 $s0 4
	nop
	add $s4 $t0 $t3
	mulo $t1 $s2 4
        nop
        add $s5 $t1 $t0
        lw $v0 ($s4)
        lw $v1 ($s5)
        slt $t2 $v1 $v0
        beq $t2 0 _else
        	sw $v1 ($s4)
        	sw $v0 ($s5)
        	move $s2 $s0
        	mulo $s0 $s0 2
        	j _endif
        _else: j endwhile
        _endif:
        addi $s0 $s0 1
        j startloop
endwhile:
