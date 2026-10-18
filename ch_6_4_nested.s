JILL:
    lw      $a0, 0($sp)         # Get first in parameter "A" at Mem[Sp]
    lw      $a1, 4($sp)         # Get second in parameter "B" at Mem[Sp+4]
    lw      $a2, 8($sp)         # Get third in parameter "C" at Mem[Sp+8]
    sw      $v0, 12($sp)        # First out parameter "D" at Mem[Sp+12]
    sw      $v1, 16($sp)        # Second out parameter "E" at Mem[Sp+16]
    jr      $ra

