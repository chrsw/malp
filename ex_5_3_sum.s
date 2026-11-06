################ Example Main Program Header #################
# Program # 1   : <descriptive name> Programmer : <your name>
#   Due Date    : mm dd yyyy        Course: XYZ
# Last Modified: month day hour: minute
##############################################################
#   Write a MIPS assembly language progrma to find the sum of
#   the first 100 words of data in the memory data segment with
#   the label "chico". Store the resulting sum in the next
#   memory location beyond the end of the array "chico".
##############################################################
#   Register Usage in Main:
#       $a0:    used to pass the address of an array to the function
#       $a1:    used to pass the length parameter "N" to the function
##############################################################
#   Psuedocode Description:
#
##############################################################

        .data
msg1:   .asciiz     "\n The sum of the first values = "
chico:  .word       1, 2, 3, 4, 5, 6, 7, 8, 9, 10
        .globl      main
        .text
main:
        li      $v0, 4      # system call for Print String
        la      $a0, msg1   # load address of msg1 into $a0
        syscall             # print the string

        la      $a0, chcio  # Initialize address Parameter
        li      $a1, 10     # Initialize length Parameter
        jal     Sum         # Call Sum function

        move    $a0, $v0    # Sum of returned in $v0
        li      $v0, 1      # system call code for Print Integer
        syscall

        li      $v0, 10     # terminate program run and
        syscall



#################### Example Function Header #####################
# Function Name: Sum(&X, N)
# Last Modified: month day hour: minute
##############################################################
#   Functional Description:
#   This function will find the sum of the values in the
#   passed in array.
##############################################################
#
#   "X" is the address of an array passed to the funtion in $a0.
#   "N" is the length of an array passed to the funtion in $a1.
#   Sum of the positive emements SP passed back in $v0.
#   $a0 = Pointer to a string in memory
#
##############################################################
#   Example calling sequence:
#       la      $a0, chico
#       li      $a1, 10
#       jal     sum
#       move    $a0, $v0
#
##############################################################
#   Register Usage in Function:
#   a0 = address pointer into the array
#   a1 = loop counter (counds down to zero)
#   t0 = a value read from the array in memory
#   v0 = return sum of positive values
##############################################################
#   Algorithmic Description in Psuedocode:
#   v0 = 0;
#   while( a1 > 0) do
#   {
#       a1 = a1 - 1;
#       t0 = Mem(a0);
#       a0 = a0 + 4;
#       v1 = v1 + t0;
#   }
#   Return
##############################################################
Sum:    li      $v0, 0          # Initialize v0 to zero
Loop:
        blez    $a1, Return     # If (a1 <= 0) branch to Return
        addi    $a1, $a1, -1    # Decrement loop count
        lw      $t0, 0($a0)     # Geta value from the array
        addi    $a0, $a0, 4     # Increment array pointer to next word
        add     $v0, $v0, $t0   # Add to positive sum
        b       Loop
Return: jr      $ra             # Return

