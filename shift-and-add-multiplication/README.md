# Multiplication with Shift and Add

## Description
This project investigates multiplication using the shift-and-add technique,
which resembles the traditional method of long multiplication.
In this approach, the multiplicand (X) is repeatedly added to itself according to the value of the multiplier (Y),
effectively performing X multiplied by Y.
The process involves examining each digit of the multiplier from right to left.
For each digit, the multiplicand is multiplied by that digit, and the intermediate product is shifted accordingly to align with the partial sums from previous steps, resulting in the final product.

## Algorithm
```python
def multiply_with_shift_and_add(X, Y):
    result = 0
    while Y > 0:
        if Y % 2 == 1:
            result += X
        X <<= 1  # Left shift by 1 (multiply by 2)
        Y >>= 1  # Right shift by 1 (divide by 2)
    return result
```
