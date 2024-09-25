# Quarter Square Multiplication

## Overview:
This project delves into the quarter square multiplication method, a technique rooted in Babylonian mathematics.
The approach leverages the property that if \(x + y\) is odd, then \(x - y\) will also be odd,
enabling a more streamlined calculation process.

## Formula:
The quarter square multiplication is performed using the following formula:

a*b = ¼(a+b)<sup>2</sup> - ¼(a-b)<sup>2</sup> 

## Algorithm:
```c
int res = 0;

/* Quarter square for the sum of x and y */
int q1 = (1/4) * ((x + y) ^ 2);

/* Quarter square for the difference of x and y */
int q2 = (1/4) * ((x - y) ^ 2);

/* Formula for Quarter Square Multiplication */
int result = q1 - q2;
```
