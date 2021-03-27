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

## 2. D latch

#### VHDL code listing of the process `p_d_latch` with syntax highlighting:





#### Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch.vhd` file with syntax highlighting and asserts:





#### Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entities must be verified:





## 3. Flip-flops

#### VHDL code listing of the processes `p_d_ff_arst`, `p_d_ff_rst`, `p_jk_ff_rst`, `p_t_ff_rst` with syntax highlighting:





#### Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts:





#### Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entities must be verified:



## 4. Shift register

#### Image of the shift register schematic: