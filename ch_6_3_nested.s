    addiu   $sp, $sp, -24       # Allocate space on the stack
    sw      $t1, 0($sp)         # First in parameter "A" at Mem[Sp]
    sw      $t2, 4($sp)         # Second in parameter "B" at Mem[Sp+4]
    sw      $t3, 8($sp)         # Third in parameber "C" at Mem[Sp+8]
    sw      $ra, 20($sp)        # Save return address
    jal     JILL                # Call the function
    lw      $ra, 20($sp)        # Restore return address to main program
    lw      $t4, 12($sp)        # Get first out parameter "D" at Mem[Sp+12]
    lw      $t5, 16(sp)         # Get second out parameter "E" at Mem[Sp+16]
    addiu   $sp, $sp, 24        # Deallocate space on the stack

