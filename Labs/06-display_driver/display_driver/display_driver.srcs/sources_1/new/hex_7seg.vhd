library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hex_7seg is
    Port ( 
          hex_i : in  std_logic_vector(8 - 1 downto 0);
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
            when "00000000" =>
                seg_o <= "0000001";     -- 0
                
            when "00000001" =>
                seg_o <= "1001111";     -- 1
                
            when "00000010" =>
                seg_o <= "0010010";     -- 2
                
            when "00000011" =>
                seg_o <= "0000110";     -- 3

            when "00000100" =>
                seg_o <= "1001100";     -- 4
                
            when "00000101" =>
                seg_o <= "0100100";     -- 5
                
            when "00000110" =>
                seg_o <= "0100000";     -- 6
                
            when "00000111" =>
                seg_o <= "0001111";     -- 7
                
            when "00001000" =>
                seg_o <= "0000000";     -- 8
                
            when "00001001" =>
                seg_o <= "0000100";     -- 9
                
            when "00001010" =>
                seg_o <= "0001000";     -- A
                
            when "00001011" =>
                seg_o <= "1100000";     -- B
                
            when "00001100" =>
                seg_o <= "0110001";     -- C
                
            when "00001101" =>
                seg_o <= "1000010";     -- D
                
            when "00001110" =>
                seg_o <= "0110000";     -- E
                
            when others =>
                seg_o <= "0111000";     -- F
                
        end case;
    end process p_7seg_decoder;

end Behavioral;

