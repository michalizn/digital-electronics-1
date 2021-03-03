## 1. Preparation tasks:

#### Truth table with connection of 7-segment displays on Nexys A7 board:

| **Hex** | **Inputs** | **A** | **B** | **C** | **D** | **E** | **F** | **G** |
| :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0000 | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
| 1 | 0001 | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
| 2 | 0010 | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
| 3 | 0011 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 4 | 0100 | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
| 5 | 0101 | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
| 6 | 0110 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
| 7 | 0111 | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
| 8 | 1000 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 9 | 1001 | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
| A | 1010 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| b | 1011 | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
| C | 1100 | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
| d | 1101 | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
| E | 1110 | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
| F | 1111 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |

![https://lastminuteengineers.com/seven-segment-arduino-tutorial/](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/04-segment/Images/7-Segment-Display-Number-Formation-Segment-Contol.png)

## 2. Seven-segment display decoder:

#### Listing of VHDL architecture from source file `hex_7seg.vhd`:
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_7seg is
    Port ( 
          hex_i : in  std_logic_vector(4 - 1 downto 0);
          seg_o : out std_logic_vector(7 - 1 downto 0)
          );
end hex_7seg;

architecture Behavioral of hex_7seg is

begin
--------------------------------------------------------------------
    -- p_7seg_decoder:
    -- A combinational process for 7-segment display decoder. 
    -- Any time "hex_i" is changed, the process is "executed".
    -- Output pin seg_o(6) corresponds to segment A, seg_o(5) to B, etc.
    --------------------------------------------------------------------
    p_7seg_decoder : process(hex_i)
    begin
        case hex_i is
            when "0000" =>
                seg_o <= "0000001";     -- 0
            when "0001" =>
                seg_o <= "1001111";     -- 1
    
            -- WRITE YOUR CODE HERE
    
            when "1110" =>
                seg_o <= "0110000";     -- E
            when others =>
                seg_o <= "0111000";     -- F
        end case;
    end process p_7seg_decoder;

end Behavioral;
```
#### Listing of VHDL stimulus process from testbench file `tb_hex_7seg.vhd`:
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_hex_7seg is
--  Port ( );
end tb_hex_7seg;

architecture Behavioral of tb_hex_7seg is

    signal s_hex       : std_logic_vector(4 - 1 downto 0);
    signal s_seg       : std_logic_vector(7 - 1 downto 0);

begin
    uut_hex_7seg : entity work.hex_7seg
        port map(
            hex_i           => s_hex,
            seg_o           => s_seg
            );
    --------------------------------------------------------------------
-- Data generation process
--------------------------------------------------------------------
    p_stimulus : process
    begin
    -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;
        
        s_hex <= "0000"; wait for 100 ns;
        
        s_hex <= "0001"; wait for 100 ns;
        
        s_hex <= "0010"; wait for 100 ns;
        
        s_hex <= "0011"; wait for 100 ns;
        
        s_hex <= "0100"; wait for 100 ns;
        
        s_hex <= "0101"; wait for 100 ns;
        
        s_hex <= "0110"; wait for 100 ns;
        
        s_hex <= "0111"; wait for 100 ns;
        
        s_hex <= "1000"; wait for 100 ns;
        
        s_hex <= "1001"; wait for 100 ns;
        
        s_hex <= "1010"; wait for 100 ns;
        
        s_hex <= "1011"; wait for 100 ns;
        
        s_hex <= "1100"; wait for 100 ns;
        
        s_hex <= "1101"; wait for 100 ns;
        
        s_hex <= "1110"; wait for 100 ns;
        
        s_hex <= "1111"; wait for 100 ns;
        
        -- Report a note at the end of stimulus process
    report "Stimulus process finished" severity note;
    wait;
end process p_stimulus;
               
end Behavioral;
```
#### Screenshot with simulated time waveforms:
![wafeforms] ()
#### Listing of VHDL code from source file `top.vhd`:

## 3. LED(7:4) indicators:

#### Truth table and listing of VHDL code for LEDs(7:4):

#### Screenshot with simulated time waveforms:

