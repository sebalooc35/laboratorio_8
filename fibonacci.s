.globl __start

.rodata
msg1: .string "Ingresa un numero: "
msg2: .string "El numero de fibonacci es: "

.text

__start:
    #mensaje 1
    li a0 4
    la a1 msg1
    ecall
    #leer numero a a0
    li a0 5
    ecall
    #llamar fib
    jal ra fibonacci_start
    #print fib
    mv t1 a0
    li a0 4
    la a1 msg2
    ecall
    li a0 1
    mv a1 t1
    ecall
    #salida
    li a0 10
    ecall

fibonacci_start:
    #inicializacion
    mv t3 a0
    li t0 0
    li t1 1
    li t4 0
    #prueba si es 0
    mv a0 t0
    beq t3 t0 fibonacci_end 
    addi t4 t4 1
    #prueba si es 1
    mv a0 t1
    beq t3 t1 fibonacci_end
    addi t4 t4 1

fibonacci_loop:
    mv t2 t0
    mv t0 t1
    add t1 t1 t2
    mv a0 t1
    beq t3 t4 fibonacci_end
    addi t4 t4 1
    jal x0 fibonacci_loop

fibonacci_end:
    ret

