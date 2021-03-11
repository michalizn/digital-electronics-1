## 1. Preparation tasks

#### Table with connection of push buttons on Nexys A7 board:
The five pushbuttons arranged in a plus-sign configuration are “momentary” switches that normally generate a low output when they are at rest, and a high output only when they are pressed. The red pushbutton labeled “CPU RESET,” on the other hand, generates a high output when at rest and a low output when pressed.

| BTN  | FPGA pin | Value when pressed | Value when not pressed | Voltage when they are pressed |
| ---- | -------- | ------------------ | ---------------------- | ----------------------------- |
| BTNL | P17      | high               | low                    | 3.3V                          |
| BTNR | M17      | high               | low                    | 3.3V                          |
| BTNU | M18      | high               | low                    | 3.3V                          |
| BTND | P18      | high               | low                    | 3.3V                          |
| BTNC | N17      | high               | low                    | 3.3V                          |


![pic](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/05-counter/Images/n4r.PNG)

#### Table with calculated values:
| **Time interval** | **Number of clk periods** | **Number of clk periods in hex** | **Number of clk periods in binary** |
| :-: | :-: | :-: | :-: |
| 2&nbsp;ms | 200 000 | x"3_0d40" | b"0011_0000_1101_0100_0000" |
| 4&nbsp;ms |400 000|x"6_1A80"|b"0110_0001_1010_1000_0000"|
| 10&nbsp;ms |1 000 000|x"F_4240"|b"1111_0100_0010_0100_0000"|
| 250&nbsp;ms |25 000 000|x"17D_7840"|b"0001_0111_1101_0111_1000_0100_0000"|
| 500&nbsp;ms |50 000 000|x"2FA_F080"|b"0010_1111_1010_1111_0000_1000_0000"|
| 1&nbsp;sec | 100 000 000 | x"5F5_E100" | b"0101_1111_0101_1110_0001_0000_0000" |



## 2. Bidirectional counter

#### Listing of VHDL code of the process `p_cnt_up_down` with syntax highlighting:



#### Listing of VHDL reset and stimulus processes from testbench file `tb_cnt_up_down.vhd` with syntax highlighting and asserts:



#### Screenshot with simulated time waveforms:

![pic](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/05-counter/Images/Capture.PNG)

## 3. Top level

#### Listing of VHDL code from source file `top.vhd` with all instantiations for the 4-bit bidirectional counter:



#### Image of the top layer including both counters, ie a 4-bit bidirectional counter from Part 4 and a 16-bit counter with a 10 ms time base:

