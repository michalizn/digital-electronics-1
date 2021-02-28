## 1. Table with connection of 16 slide switches and 16 LEDs on Nexys A7 board:

| SUPPLY | SW   | R         | PIN  | IO                                |
| ------ | ---- | --------- | ---- | --------------------------------- |
| VCC3V3 | SW0  | 10k (R35) | J15  | IO_L24N_T3_RS0_15 (IC8B)          |
| VCC3V3 | SW1  | 10k (R37) | L16  | IO_L3N_T0_DQS_EMCCLK_14 (IC8F)    |
| VCC3V3 | SW2  | 10k (R38) | M13  | IO_L6N_T0_D08_VREF_14 (IC8A)      |
| VCC3V3 | SW3  | 10k (R40) | R15  | IO_L13N_T2_MRCC_14 (IC8A)         |
| VCC3V3 | SW4  | 10k (R42) | R17  | IO_L12N_T1_MRCC_14 (IC8A)         |
| VCC3V3 | SW5  | 10k (R43) | T18  | IO_L7N_T1_D10_14 (IC8A)           |
| VCC3V3 | SW6  | 10k (R46) | U18  | IO_L17N_T2_A13_D29_14 (IC8A)      |
| VCC3V3 | SW7  | 10k (R48) | R13  | IO_L5N_T0_D07_14 (IC8A)           |
| VCC1V8 | SW8  | 10k (R56) | T8   | IO_L24N_T3_34 (IC8D)              |
| VCC1V8 | SW9  | 10k (R58) | U8   | IO_25_34  (IC8D)                  |
| VCC1V8 | SW10 | 10k (R64) | R16  | IO_L15P_T2_DQS_RDWR_B_14 (IC8F)   |
| VCC1V8 | SW11 | 10k (R66) | T13  | IO_L23P_T3_A03_D19_14 (IC8A)      |
| VCC1V8 | SW12 | 10k (R68) | H6   | IO_L24P_T3_35 (IC8E)              |
| VCC1V8 | SW13 | 10k (R69) | U12  | IO_L20P_T3_A08_D24_14 (IC8A)      |
| VCC1V8 | SW14 | 10k (R71) | U11  | IO_L19N_T3_A09_D25_VREF_14 (IC8A) |
| VCC1V8 | SW15 | 10k (R73) | V10  | IO_L21P_T3_DQS_14 (IC8A)          |

| LED   | R         | PIN  | IO                                  |
| ----- | --------- | ---- | ----------------------------------- |
| LD 0  | 330 (R33) | H17  | IO_L18P_T2_A24_15 (IC8B)            |
| LD 1  | 330 (R34) | K15  | IO_L24P_T3_RS1_15 (IC8B)            |
| LD 2  | 330 (R36) | J13  | IO_L17N_T2_A25_15 (IC8B)            |
| LD 3  | 330 (R39) | N14  | IO_L8P_T1_D11_14 (IC8A)             |
| LD 4  | 330 (R41) | R18  | IO_L7P_T1_D09_14 (IC8A)             |
| LD 5  | 330 (R44) | V17  | IO_L18N_T2_A11_D27_14 (IC8A)        |
| LD 6  | 330 (R47) | U17  | IO_L17P_T2_A14_D30_14 (IC8A)        |
| LD 7  | 330 (R50) | U16  | IO_L18P_T2_A12_D28_14 (IC8A)        |
| LD 8  | 330 (R52) | V16  | IO_L16N_T2_A15_D31_14 (IC8A)        |
| LD 9  | 330 (R54) | T15  | IO_L14N_T2_SRCC_14 (IC8A)           |
| LD 10 | 330 (R57) | U14  | IO_L22P_T3_A05_D21_14 (IC8A)        |
| LD 11 | 330 (R65) | T16  | IO_L15N_T2_DQS_DOUT_CSO_B_14 (IC8F) |
| LD 12 | 330 (R67) | V15  | IO_L16P_T2_CSI_B_14 (IC8F)          |
| LD 13 | 330 (R70) | V14  | IO_L22N_T3_A04_D20_14 (IC8A)        |
| LD 14 | 330 (R72) | V12  | IO_L20N_T3_A07_D23_14 (IC8A)        |
| LD 15 | 330 (R74) | V11  | IO_L21N_T3_DQS_A06_D22_14 (IC8A)    |

## 2. Two-bit wide 4-to-1 multiplexer:

#### Listing of VHDL architecture from source file `mux_2bit_4to1.vhd`:
```vhdl
library ieee;
use ieee.std_logic_1164.all;


entity mux_2bit_4to1 is
    port(
        a_i           : in  std_logic_vector(2 - 1 downto 0);
        b_i           : in  std_logic_vector(2 - 1 downto 0);
        c_i           : in  std_logic_vector(2 - 1 downto 0);
        d_i           : in  std_logic_vector(2 - 1 downto 0);
        sel_i         : in  std_logic_vector(2 - 1 downto 0);    
        
        f_o           : out std_logic_vector(2 - 1 downto 0)     
    );
end entity mux_2bit_4to1;


architecture Behavioral of mux_2bit_4to1 is
begin

    f_o <= a_i when (sel_i = "00") else
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i;

end architecture Behavioral;
```

#### Listing of VHDL stimulus process from testbench file `tb_mux_2bit_4to1.vhd`:
```vhdl
library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_mux_2bit_4to1 is

end entity tb_mux_2bit_4to1;
------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_mux_2bit_4to1 is

    -- Local signals
    signal s_a       : std_logic_vector(2 - 1 downto 0);
    signal s_b       : std_logic_vector(2 - 1 downto 0);
    signal s_c       : std_logic_vector(2 - 1 downto 0);
    signal s_d       : std_logic_vector(2 - 1 downto 0);
    signal s_sel     : std_logic_vector(2 - 1 downto 0);
    
    signal s_f       : std_logic_vector(2 - 1 downto 0);

begin

    uut_mux_2bit_4to1 : entity work.mux_2bit_4to1
        port map(
            a_i           => s_a,
            b_i           => s_b,
            c_i           => s_c,
            d_i           => s_d,
            sel_i         => s_sel,
            
            f_o           => s_f
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;


        -- First test values
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00";
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "00";
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "11";
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "11"; s_a <= "11";
        s_sel <= "00"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00";
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "00";
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "11";
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "11"; s_a <= "11";
        s_sel <= "01"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00";
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "00";
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "11";
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "11"; s_a <= "11";
        s_sel <= "10"; wait for 100 ns;
        
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00";
        s_sel <= "11"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "00";
        s_sel <= "11"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "01"; s_a <= "11";
        s_sel <= "11"; wait for 100 ns;
        
        s_d <= "10"; s_c <= "01"; s_b <= "11"; s_a <= "11";
        s_sel <= "11"; wait for 100 ns;


        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;
```
#### Screenshot with simulated time waveforms
![time waveforms](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture10.PNG)


## 3. A Vivado tutorial:

1. Open Vivado and follow the picture
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture1.PNG)
2. Click "Next"
3. Type name of your project
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture2.PNG)
4. Select RTL Project and then click on "Next"
5. Click on "Create File" and type file name:
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture3.PNG)
6. Add constraints (optional)
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture4.PNG)
7. Select part or board
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture5.PNG)
8. "Finish"
9. Click "Ok" and "Yes"
10. To add a new Testbench file click on "File" and "Add sources"
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture6.PNG)
11. Select what you need. (constraints, design or simulation sources)
12. Click on "Create File" and name it tb_example
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture7.PNG)
13. "Finish"
14. Click "Ok" and "Yes"
15. To run the Simulation open "Flow" -> "Run Simulation" -> "Run Behavioral Simulation"
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture8.PNG)
16. To cleanup generated files, close simulation window, right click to SIMULATION or Run Simulation option, and select **Reset Behavioral Simulation**.
![picture](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/03-vivado/Images/Capture9.PNG)

