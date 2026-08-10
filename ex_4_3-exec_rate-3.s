###################################################################

# Reports elapsed time every 5 seconds over a period of one minute.
# Outer loop version

###################################################################
            .data                       # Data declaration section
msg:        .asciiz     "\n Elapsed Time = "
            .text
main:                                   # Start of code section
            li          $s1, 0          # Time counter
outer:      li          $s2, 5          # Outer loop counter
countdown:
            li          $s0, 2500000   # Adjustable time factor
waitloop:
            addi        $s0, $s0, -1
            bnez        $s0, waitloop
            addi        $s2, $s2, -1
            bnez        $s2, countdown
            addi        $s1, $s1, 5
            li          $v0, 4          # Print message
            la          $a0, msg
            syscall
            move        $a0, $s1
            li          $v0, 1
            syscall                     # Print amount
            addi        $t0, $s1, -60
            bnez        $t0, outer
            li          $v0, 10
            syscall
