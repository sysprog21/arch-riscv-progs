.data
    multiplier: .word -7      # Define the multiplier with a value of -7
    multiplicand: .word 5     # Define the multiplicand with a value of 5
    result: .word 0           # Initialize result to 0

.text
    la a0, multiplier         # Load the address of multiplier into register a0
    lw a1, 0(a0)              # Load the value of the multiplier from memory into a1
    la a2, multiplicand       # Load the address of multiplicand into register a2
    lw a3, 0(a2)              # Load the value of the multiplicand from memory into a3
    li t0, 0                  # Initialize t0 as the accumulator (result) to 0
    li t1, 32                 # Set t1 to 32 (number of bits to process in a 32-bit integer)

    # Check if multiplier is negative
    bltz a1, handle_negative1 # If multiplier is negative, jump to handle_negative1
    j shift_and_add_loop      # Otherwise, skip to the shift-and-add loop
    # Check if multiplicand is negative
    bltz a3, handle_negative2 # If multiplicand is negative, jump to handle_negative2
    j shift_and_add_loop      # Otherwise, continue to the shift-and-add loop

handle_negative1:
    neg a1, a1                # Negate the multiplier to make it positive

handle_negative2:
    neg a3, a3                # Negate the multiplicand to make it positive

shift_and_add_loop:
    beqz t1, end_shift_and_add # If t1 (bit count) is zero, exit the loop
    andi t2, a1, 1            # Check if the least significant bit of a1 is 1
    beqz t2, skip_add         # If it is 0, skip adding the multiplicand
    add t0, t0, a3            # Add the multiplicand to the accumulator

skip_add:
    srai a1, a1, 1            # Right shift the multiplier by 1 (divide by 2)
    slli a3, a3, 1            # Left shift the multiplicand by 1 (multiply by 2)
    addi t1, t1, -1           # Decrease the bit counter (t1) by 1
    j shift_and_add_loop      # Repeat the loop

end_shift_and_add:
    la a4, result             # Load the address of the result into a4
    sw t0, 0(a4)              # Store the final result in memory
