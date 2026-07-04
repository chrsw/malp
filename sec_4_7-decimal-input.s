        .data
prompt: .asciiz "\n   Please input a value"
bye:    .asciiz "\n  **** Adios Amigo - Have a good day ****"
        .globl  main
        .text
main:
        li      $v0, 4          # system call code for Print String
        la      $a0, prompt     # load address of prompt int $a0
        syscall                 # print the prompt message
        li      $v0, 5          # system call code for Read Integer
        syscall                 # reads the value in $v0
        beqz    $v0, end        # branch to end if $v0 equals 0
        move    $a0, $v0        
        li      $v0, 1          # system call code for Print Integer
        syscall                 # print
        b       main            # branch to main

end:    li      $v0, 4          # system call code for Print String
        la      $a0, bye        # load address of msg. into $a0
        syscall                 # print the string
        li      $v0, 10         # terminal program run and
        syscall                 # return control to  system
        
        
