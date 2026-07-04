###################################################################

# Reports elapsed time every 5 seconds over a period of one minute.

###################################################################
            .data                       # Data declaration section
msg:        .asciiz     "\n Elapsed Time = "
            .text
main:                                   # Start of code section
            li          $s1, 0          # Time counter
countdown:
            li          $s0, 250000     # Adjustable time factor
waitloop:
            addi        $s0, $s0, -1
            bnez        $s0, waitloop
            addi        $s1, $s1, 5
            li          $v0, 4          # Print message
            la          $a0, msg
            syscall
            move        $a0, $s1
            li          $v0, 1
            syscall                     # Print amount
            addi        $t0, $s1, -60
            bnez        $t0, countdown
            li          $v0, 10
            syscall
