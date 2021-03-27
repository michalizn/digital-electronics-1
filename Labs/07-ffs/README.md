## 1. Preparation tasks

#### Characteristic equations and completed tables for D, JK, T flip-flops:

![equation](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/CodeCogsEqn.png)

| clk   | d    | Q(n) | Q(n+1) | Comments           |
| ----- | ---- | ---- | ------ | ------------------ |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png) | 0    | 0    | 0      | No change          |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)      | 0    | 1    | 1      | No change          |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)      | 1    | 0    | 0      | Set (stored to FF) |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)      | 1    | 1    | 1      | Set (stored to FF) |

![equation](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/CodeCogsEqn1.png)

| clk  | j    | k    | Q(n) | Q(n+1) | Comments  |
| ---- | ---- | ---- | ---- | ------ | --------- |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 0    | 0    | 0      | No change |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 0    | 1    | 1      | No change |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 1    | 0    | 0      | Reset     |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 1    | 1    | 0      | Reset     |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 0    | 0    | 1      | Set       |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 0    | 1    | 1      | Set       |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 1    | 0    | 1      | Toggle    |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 1    | 1    | 0      | Toggle    |

![equation](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/CodeCogsEqn2.png)

| clk  | t    | Q(n) | Q(n+1) | Comments        |
| ---- | ---- | ---- | ------ | --------------- |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 0    | 0      | No change       |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 1    | 1      | No change       |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 0    | 1      | Invert (Toggle) |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 1    | 0      | Invert (Toggle) |

