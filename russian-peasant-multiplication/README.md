# Russian Peasant Multiplication

## Description
This project implements the Russian Peasant Multiplication algorithm, also known as Ancient Egyptian Multiplication.
This ancient method allows for multiplying two numbers through a series of halvings and doublings,
eliminating the need for a direct multiplication operation.
The process involves repeatedly halving one number and doubling the other,
then summing specific doubled values based on the halved values that are odd.

## Formula
Let *n* and *m* be two numbers to be multiplied. Then,

- If *n* is even:  
  *nm = (n/2) . (2m)*

- If *n* is odd:  
  *nm = ((n-1)/2) . (2m) + m*

- If *n=1*:  
  *1.m = m*

## Algorithm:
```python
ALGORITHM RussianPeasantMul(n, m)
    int res = 0;
    while (n != 1)
        if (n % 2 != 0)
            res = res + m;
        n = n / 2;
        m = 2 * m;
    return res;
```
