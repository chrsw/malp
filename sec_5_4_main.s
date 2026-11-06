################ Example Main Program Header #################
# Program # 1   : <descriptive name> Programmer : <your name>
#   Due Date    : mm dd yyyy        Course: XYZ
# Last Modified: month day hour: minute
##############################################################
#   Overall Program Functional Description:
#   This main line program is used to test the function "Sum. "
#   After calling the function, results are printed.
##############################################################
#   Register Usage in Main:
#       $a0:    used to pass the address of an array to the function
#       $a1:    used to pass the length parameter e"N" to the function
##############################################################
#   Psuedocode Description:
#
##############################################################

        .data
array:  .word       -4, 5, 8, -1
msg1:   .asciiz     "\n The sum of hte positive values = "
msg2:   .asciiz     "\n The sum of hte negative values = "
        .globl      main
        .text
main:
        li      $v0, 4      # system call for Print Sring
        la      $a0, msg1   # load address of msg1 into $a0
        syscall             # print the string

        la      $a0, array  # Initialize address Parameter
        li      $a1, 4      # Initialize length Parameter
        jal     Sum         # Call Sum function

        move    $a0, $v0    # Sum of positive returned in $v0
        li      $v0, 1      # system call ocde for Print Integer
        syscall

        li      $v0, 4      # system call code for Print String
        la      $a0, msg2   # load address of msg2, into $a0
        syscall             # print the string

        li      $v0, 1      # system call code for Print Integer
        move    $a0, $v1    # sum of negative returned in $v1
        syscall             # print sum of negative values

        li      $v0, 10     # terminate program run and
        syscall



#################### Example Function Header #####################
# Function Name: Sum(&X, N, SP, SN)
# Last Modified: month day hour: minute
##############################################################
#   Functional Description:
#   This function will find the sum of the positive values SP
#   and the sum of the negative values of SN in an array of
#   words X of length N.
##############################################################
#
#   "X" is the address of an array passed to the funtion in $a0.
#   "N" is the length of an array passed to the funtion in $a1.
#   The function returns two values:
#       (1) Sum of the positive emements SP passed back in $v0.
#       (2) Sum of the negative elements SN passed back in $v1.  
#       $a0 = Pointer to a string in memory
#
##############################################################
#   Example calling sequence:
#       la      $a0, array
#       li      $a1, 4
#       jal     sum
#       move    $a0, $v0
#
##############################################################
#   Register Usage in Function:
#   a0 = address pointer into the array
#   a1 = loop counter (counds down to zero)
#   t0 = a value read from the array in memory
#   v0 = return sum of positive values
#   v1 = return sum of negative values
##############################################################
#   Algorithmic Description in Psuedocode:
#   v0 = 0;
#   v1 = 0;
#   while( a1 > 0) do
#   {
#       a1 = a1 = 1;
#       t0 = Mem(a0);
#       a0 = a0 + 4;
#       If (t0 > 0) then
#           v0 = v0 + t0;
#       else
#           v1 = v1 + t0;
#   }
#   Return
##############################################################
Sum:    li      $v0, 0
        li      $v1, 0          # Initialize v0 and v1 to zero
Loop:
        blez    $a1, Return     # If (a1 <= 0) branch to Return
        addi    $a1, $a1, -1    # Decrement loop count
        lw      $t0, 0($a0)     # Geta value from the array
        addi    $a0, $a0, 4     # Increment array pointer to next word
        blez    $t0, Negative   # If value is negative branch to negg
        add     $v0, $v0, $t0   # Add to positive sum
        b       Loop
Negative:
        add     $v1, $v1, $t0   # Add to the negative sum
        b       loop            # Branch back for another Iteration
Return: jr      $ra             # Return

