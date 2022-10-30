# **********************************************************************************************************#
# @Author; HLAHA P.P
# Student Number: 202002429
# Purpose: A multipurpose program that prints the first 10 reversible prime squares in MIPS Assembly
# @Date: October 2022
# @Contact : pholohohlaha@gmail.com
# @github: http://github.com/

.data

.text

    main:
        jal reversible_prime_sqrs

        li $v0, 10
        syscall


    reversing_integers:
        addi $sp, $sp, -4

        sw $ra 0($sp)

        addi $t0, $zero, 0

            while:
                addi $t4, $zero, 0

                beq $a0, $t4, done

                addi $t2, $zero, 10

                rem $t1, $a0, $t2

                mul $t3, $t0, $t2

                add $t0, $t1, $t3

                div $a0, $a0, $t2

                add $v0, $zero, $t0

                jal done

            done:
                lw $ra, 0($sp)

                add $v0, $zero, $t0

                jr $ra


    is_prime:
        addi $sp, $sp, -12

        sw $ra, 8($sp)

        sw $s0, 4($sp)

        sw $a0, 0($sp)

        addi $s0, $zero, 2

            loop:
                bge $s0, $a0, done_1

                addi $s0, $s0, 1

                jal if

                    if:
                        rem $s1, $a0, $s0

                        bne $s1, $zero, done_1

                        addi $v0, $zero, 0

                        jal return


                done_1:
                addi $v0, $zero, 1

                jal return

            return:
                lw $a0, 0($sp)

                lw $s0, 4($sp)

                lw $ra, 8($sp)

                jr $ra




    reversible_prime_sqrs:
        addi $sp, $sp, -12

        sw $ra, 0($sp)

        sw $a0, 4($sp)

        sw $s0, 8($sp)

        addi $t0, $zero, 1

        addi $t1, $zero, 0

        addi $t2, $zero, 10

        jal for

            for:
                slt $s3, $t1, $t2

                addi $t3, $t3, 1

                jal if_11

                    if_11:
                        jal is_prime

                        add $a0, $zero, $t3

                        addi $t4, $zero, 1

                        bne $a0, $t4, for

                        mul $s0, $t3, $t3

                        jal reversing_integers

                        add $a0, $zero, $s0

                        jal if_2

                            if_2:
                                beq  $s0, $s1, for

                                jal for_2

                                    for_2:
                                        addi $t5, $zero, 0

                                        addi $t6, $zero, 2

                                        div $t7, $s1, $t6

                                        addi $t5, $t5, 1

                                        jal if_3

                                            if_3:
                                                mul $t8, $t5, $t5

                                                bne $t8, $s1, for_2

                                                jal if_4

                                                    if_4:
                                                        jal is_prime

                                                        add $a0, $zero, $t5

                                                        addi $t9, $zero, 1

                                                        bne $a0, $t9, for_2

                                                        add $v0, $zero, $s0

                                                        li, $v0, 1

                                                        syscall

                                                        jr $ra










