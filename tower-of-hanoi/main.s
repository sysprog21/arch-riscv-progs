.data
    md:      .string "Move Disk "          # String for move message
    from:    .string " from '"             # String for source pole
    to:      .string "' to '"              # String for destination pole
    newline: .string "'\n"                 # String for newline
    src:     .string "A"                   # Source pole (A)
    aux:     .string "B"                   # Auxiliary pole (B)
    dst:     .string "C"                   # Destination pole (C)
    n:       .word   4                     # Number of disks

.text
.globl main
main:
    lw a1, n              # Load the number of disks (n) into register a1
    la t0, src            # Load the address of the source pole (A) into t0
    la t1, dst            # Load the address of the destination pole (C) into t1
    la t2, aux            # Load the address of the auxiliary pole (B) into t2
    lbu a2, 0(t0)         # Load the first character of source pole into a2
    lbu a3, 0(t2)         # Load the first character of auxiliary pole into a3
    lbu a4, 0(t1)         # Load the first character of destination pole into a4
    jal x1, towerOfHanoi  # Call the towerOfHanoi function (jump and link)
    li a7, 10             # Load system call number for program exit into a7
    ecall                 # Make the system call to exit the program

towerOfHanoi:
    addi sp, sp, -20      # Allocate 20 bytes of space on the stack
    sw x1, 0(sp)          # Save the return address on the stack
    sw a1, 4(sp)          # Save the number of disks (a1) on the stack
    sw a2, 8(sp)          # Save the source pole (a2) on the stack
    sw a3, 12(sp)         # Save the auxiliary pole (a3) on the stack
    sw a4, 16(sp)         # Save the destination pole (a4) on the stack
    addi t0, x0, 1        # Load 1 into t0 (used for comparison)
    beq a1, t0, return    # If there's only 1 disk, jump to return
    lw a1, 4(sp)          # Load the number of disks from the stack
    addi a1, a1, -1       # Decrement the number of disks (a1)
    lbu a2, 8(sp)         # Load source pole from the stack
    lbu a3, 16(sp)        # Load destination pole from the stack
    lbu a4, 12(sp)        # Load auxiliary pole from the stack
    jal x1, towerOfHanoi  # Recursive call to towerOfHanoi
    lw a1, 4(sp)          # Load the number of disks from the stack
    lbu a2, 8(sp)         # Load source pole from the stack
    lbu a3, 16(sp)        # Load destination pole from the stack
    jal x1, print         # Call the print function to display the move
    lw a1, 4(sp)          # Load the number of disks from the stack
    addi a1, a1, -1       # Decrement the number of disks (a1)
    lbu a2, 12(sp)        # Load auxiliary pole from the stack
    lbu a3, 8(sp)         # Load source pole from the stack
    lbu a4, 16(sp)        # Load destination pole from the stack
    jal x1, towerOfHanoi  # Recursive call to towerOfHanoi
    lw x1, 0(sp)          # Load the return address from the stack
    addi sp, sp, 20       # Deallocate space on the stack
    jalr x0, x1, 0        # Return to the caller

return:
    lw a1, 4(sp)          # Load the number of disks from the stack
    lbu a2, 8(sp)         # Load source pole from the stack
    lbu a3, 16(sp)        # Load destination pole from the stack
    jal x1, print         # Call the print function to display the move
    lw x1, 0(sp)          # Load the return address from the stack
    addi sp, sp, 20       # Deallocate space on the stack
    jalr x0, x1, 0        # Return to the caller

print:
    la a0, md             # Load the address of "Move Disk " into a0
    li a7, 4              # Load system call number for printing a string into a7
    ecall                 # Make the system call to print the string
    addi a0, a1, 0        # Load the disk number (a1) into a0
    li a7, 1              # Load system call number for printing an integer into a7
    ecall                 # Make the system call to print the integer
    la a0, from           # Load the address of " from '" into a0
    li a7, 4              # Load system call number for printing a string into a7
    ecall                 # Make the system call to print the string
    addi a0, a2, 0        # Load the source pole into a0
    li a7, 11             # Load system call number for printing a character into a7
    ecall                 # Make the system call to print the character
    la a0, to             # Load the address of "' to '" into a0
    li a7, 4              # Load system call number for printing a string into a7
    ecall                 # Make the system call to print the string
    addi a0, a3, 0        # Load the destination pole into a0
    li a7, 11             # Load system call number for printing a character into a7
    ecall                 # Make the system call to print the character
    la a0, newline        # Load the address of "'\n" into a0
    li a7, 4              # Load system call number for printing a string into a7
    ecall                 # Make the system call to print the string
    jalr x0, x1, 0        # Return to the caller
