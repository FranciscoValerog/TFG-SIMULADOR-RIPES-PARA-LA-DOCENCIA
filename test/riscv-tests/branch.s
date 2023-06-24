.text
main:
  #-------------------------------------------------------------
  # branch tests
  #-------------------------------------------------------------

test_2:
    jal test_3
    li a0, 0
    li a7, 93
    ecall

test_3:
    li x1, 36
    jr x1
    li a0, 0
    li a7, 93
    ecall

test_4:
    li t0, 5
    li t1, 5
    beq  t0, t1, test_5
    li a0, 0
    li a7, 93
    ecall

test_5:
    li t0, 5
    li t1, 6
    bne t1, t0, test_6
    li a0, 0
    li a7, 93
    ecall

test_6:
    li t0, 1
    blt x0, t0, test_7
    li a0, 0
    li a7, 93
    ecall

test_7:
    addi t0, x0, 1
	bge t0, x0, test_8
	li a0, 0
    li a7, 93
    ecall

test_8:
    li t0, 0
    bge x0, t0, test_9
	li a0, 0
    li a7, 93
    ecall

test_9:
    li t0, 1
    bltu x0, t0, test_10
	li a0, 0
    li a7, 93
    ecall

test_10:
    addi t0, x0, 1
	bgeu t0, t0, test_11
	li a0, 0
    li a7, 93
    ecall

test_11:
    li t0, 0
    bgeu t0, x0, pass
	li a0, 0
    li a7, 93
    ecall

pass:
   li a0, 42
   li a7, 93
   ecall