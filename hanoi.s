.globl __start

.rodata
msg1: .string "Ingresa numeros en el siguiente orden (numeroDeDiscos, T_origen, T_destino, T_alterna) dando enter por cada uno:\n"
msg2: .string "mueva el disco de la torre: "
msg3: .string " hacia la torre: "
msg4: .string "\n"

.text
__start:
    #mensaje 1
    li a0 4
    la a1 msg1
    ecall
    #leer numero a t0
    li a0 5
    ecall
    mv t0 a0
    #leer numero a t1
    li a0 5
    ecall
    mv t1 a0
    #leer numero a t2
    li a0 5
    ecall
    mv t2 a0
    #leer numero a t2
    li a0 5
    ecall
    mv t3 a0
    #llamar a hanoi
    mv a0 t0
    mv a1 t1
    mv a2 t2
    mv a3 t3
    jal hanoi_start
    #salida
    li a0 10
    ecall

hanoi_start:
    li t0 1
    bne a0 t0 hanoi_else
    jal x0 hanoi_print

hanoi_else:
    addi sp sp -20
    sw a0 0(sp)  #numeroDiscos
    sw a1 4(sp)  #T_origen
    sw a2 8(sp)  #T_destino
    sw a3 12(sp) #T_alterna
    sw ra 16(sp) #ra

    lw a0 0(sp)
    addi a0 a0 -1
    lw a1 4(sp)
    lw a2 12(sp)
    lw a3 8(sp)
    jal hanoi_start

    li a0 1
    lw a1 4(sp)
    lw a2 8(sp)
    lw a3 12(sp)
    jal hanoi_start

    lw a0 0(sp)
    addi a0 a0 -1
    lw a1 12(sp)
    lw a2 8(sp)
    lw a3 0(sp)
    jal hanoi_start

    lw ra 16(sp)
    addi sp sp 20

    ret


hanoi_print:
    mv t0 a0
    mv t1 a1
    mv t2 a2
    mv t3 a3
    li a0 4
    la a1 msg2
    ecall
    li a0 1
    mv a1 t1
    ecall
    li a0 4
    la a1 msg3
    ecall
    li a0 1
    mv a1 t2
    ecall
    li a0 4
    la a1 msg4
    ecall
    ret

