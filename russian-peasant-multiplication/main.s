.data
    # Define the data section with two numbers to multiply
    num1: .word 13
    num2: .word 7
    result: .word 0  # Placeholder for the final result

.text
    # Begin the main code in the text section
    la x1, result       # Load the address of the result variable into register x1
    lw t0, num1         # Load the first number (num1) into register t0
    lw t1, num2         # Load the second number (num2) into register t1
    li t2, 0            # Initialize the result (t2) to 0

loop:
    # Check if the least significant bit of t0 (num1) is 1 (i.e., if the number is odd)
    andi t3, t0, 1
    beq t3, x0, skip_add  # If the bit is 0 (even), skip the addition
    # If the number is odd, add the value in t1 (num2) to the result in t2
    add t2, t2, t1

skip_add:
    # Perform a right shift on t0 (num1), effectively dividing it by 2
    srli t0, t0, 1
    # Perform a left shift on t1 (num2), effectively multiplying it by 2
    slli t1, t1, 1
    # If t0 (num1) is not zero, repeat the loop
    bnez t0, loop

    # Store the final result in the memory location pointed by x1
    sw t2, 0(x1)
    nop                 # No operation, acts as a placeholder
