.text
main:
  #-------------------------------------------------------------
  # full test
  #-------------------------------------------------------------

test_lui:
 lui x5, 12
 lui x6, 12
 bne x6, x5, fail
 
test_auipc:
auipc x5, 0
li x6, 12
bne x6, x5, fail

test_jal:
jal x6, test_jal2
test_jal2:
auipc x5, 0
bne x6, x5, fail

test_jalr:
jalr x6, x0 test_jalr2
test_jalr2:
auipc x5, 0
bne x6, x5, fail

test2_jalr:
li x7, 4
auipc x5, 0
addi x5, x5, 12
jalr x6, x7 test2_jalr2
test2_jalr2:
lui x6, 0
bne x6, x5, fail

test_beq:
li x5, 1
beq x5, x0, fail
li x5, 0
beq x5, x0, test_beq2
test_beq2:
li x5, -1
beq x5, x0, fail
li x5, 0
beq x5, x0, test_beq3
test_beq3:
beq x0, x0, test_bne

test_bne:
li x5, 1
bne x5, x0, test_blt

test_blt:
li x5, -1
li x6, 1
blt x6, x5, test_blt2
test_blt2:
blt x5, x5, fail
blt x5, x6, test_blte
jal x5, fail
test_blte:

test_bge:
li x5, -1
li x6, 1
bge x6, x5, test_bge2 #>
test_bge2:
bge x5, x5, test_bge3 #=
jal x7, fail
test_bge3:
bge x5, x6, fail #<
    
test_bltu:
li x5, -1
li x6, 1
bltu x6, x5, test_bltu2
jal x7, fail
test_bltu2:
bltu x5, x5, fail
bltu x5, x6, test_bltu2

    
test_bgeu:
li x5, -1
li x6, 1
bgeu x5, x6, test_bgeu2 #>
test_bgeu2:
bgeu x5, x5, test_bgeu3 #=
jal x7, fail
test_bgeu3:
bgeu x6, x5, fail #<

pass:
	li a0, 42
	li a7, 93
	ecall
fail:
	li a0, 0
	li a7, 93
	ecall
