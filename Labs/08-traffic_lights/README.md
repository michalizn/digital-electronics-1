## 1. Preparation tasks

#### Completed state table:

| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) | ![rising](pictures/eq_uparrow.png) |
| **State** | A | A | B | C | C | D | A | B | C | D | B | B | B | C | D | B |
| **Output R** | `0` | `0` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `1` | `0` | `0` | `0` | `0` | `1` | `0` |


#### Figure with connection of RGB LEDs on Nexys A7 board and completed table with color settings:

![pic](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Images/Capture.png)


| **RGB LED** | **Artix-7 pin names** | **Red** | **Yellow** | **Green** |
| :-: | :-: | :-: | :-: | :-: |
| LD16 | N15, M16, R12 | `1,0,0` | `1,1,0` | `0,1,0` |
| LD17 | N16, R11, G14 | `1,0,0` | `1,1,0` | `0,1,0` |


## 2. Traffic light controller

#### State diagram:

![pic](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Images/Untitled.png)

#### Listing of VHDL code of sequential process `p_traffic_fsm` with syntax highlighting:

#### Listing of VHDL code of combinatorial process `p_output_fsm` with syntax highlighting:

#### Screenshot(s) of the simulation, from which it is clear that controller works correctly:

