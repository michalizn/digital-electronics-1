library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_d_ff_arst is
--  Port ( );
end tb_d_ff_arst;

architecture Behavioral of tb_d_ff_arst is

          constant c_CLK_100MHZ_PERIOD : time := 10ns;
          
          signal s_clk_100MHz    :   STD_LOGIC;
          signal s_arst           :   STD_LOGIC;
          signal s_d              :   STD_LOGIC;
          signal s_q              :   STD_LOGIC;
          signal s_q_bar          :   STD_LOGIC;
begin
    uut_d_ff_arst : entity work.d_ff_arst
        port map(
            clk      =>    s_clk_100MHz,   
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
    
    --------------------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------------------
    p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 23 ns;
    
        -- Reset activated
        s_arst <= '1';
        wait for 42 ns;
    
        s_arst <= '0';
        wait;
    end process p_reset_gen;
    
    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
        begin
        report "Stimulus process started" severity note;
        
        s_d <= '0';
        wait for 12ns;      
        s_d  <=  '1';            
        
        assert(s_q = '0' and s_q_bar = '1')
        report "Error" severity note;
                              
        wait for 10ns;
        s_d <= '1';          
        wait for 10ns;
        s_d <= '0';
        
        assert(s_q = '0' and s_q_bar = '1')
        report "Error" severity note;
                  
        wait for 10ns;
        s_d <= '1';        
        wait for 10ns;
        s_d <= '0';           
        wait for 10ns;
        s_d <= '1';            
        wait for 10ns;
        s_d <= '0';
        
        assert(s_q = '1' and s_q_bar = '0')
        report "Error" severity note;
                    
        wait for 10ns;
        s_d <= '1';            
        wait for 10ns;
        s_d <= '0';
        
        s_d  <=  '1';                                  
        wait for 10ns;
        s_d <= '1';          
        wait for 10ns;
        s_d <= '0';          
        wait for 10ns;
        s_d <= '1';        
        wait for 10ns;
        s_d <= '0';           
        wait for 10ns;
        s_d <= '1';            
        wait for 10ns;
        s_d <= '0';            
        wait for 10ns;
        s_d <= '1';            
        wait for 10ns;
        s_d <= '0';
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
            
            

end Behavioral;
