library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_d_ff_arst is
--  Port ( );
end tb_d_ff_arst;

architecture Behavioral of tb_d_ff_arst is
          signal clk_100_MHz    :   STD_LOGIC;
          signal arst           :   STD_LOGIC;
          signal d              :   STD_LOGIC;
          signal q              :   STD_LOGIC;
          signal q_bar          :   STD_LOGIC;
begin
    uut_d_ff_arst : entity wokr.d_ff_arst
        port map(
            clk      =>    s_clk_100_MHz,   
            arst     =>    s_arst,  
            d        =>    s_d,     
            q        =>    s_q,    
            q_bar    =>    s_q_bar
            );
            
    p_clk_gen : process
        begin
            while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
        wait for c_CLK_100MHZ_PERIOD / 2;
        s_clk_100MHz <= '1';
        wait for c_CLK_100MHZ_PERIOD / 2;
    end loop;
    wait;
end process p_clk_gen;
            
            

end Behavioral;
