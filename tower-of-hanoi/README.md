# Tower-Of-Hanoi

## Description
This RISC-V assembly program implements a solution for the classic Tower of Hanoi game.
It is designed for execution on a 32-bit RISC-V processor. The core logic resides in the `towerOfHanoi` function,
which handles the puzzle-solving algorithm. This function accepts four parameters:
1. `Num_of_Disks`: The number of disks in the puzzle
2. `src_rod_char`: Character representing the source rod
3. `aux_rod_char`: Character representing the auxiliary rod
4. `dst_rod_char`: Character representing the destination rod

These parameters are passed through registers `a1`, `a2`, `a3`, and `a4` respectively.
Notably, the `a0` register is intentionally left unused in this implementation.
The program prints the steps of the Tower of Hanoi solution to the console and does not return any values.
Each step is displayed as a move, indicating which disk is transferred from one rod to another.

## Example usage
```assembly
li a1, 3          # Set disk count to 3
li a2, 'A'        # Initialize source rod label
li a3, 'B'        # Initialize auxiliary rod label
li a4, 'C'        # Initialize destination rod label
jal towerOfHanoi  # Call the Tower of Hanoi solving function
```
