library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_d_latch is
--  Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is

    signal s_en     :   std_logic;
    signal s_arst   :   std_logic;
    signal s_d      :   std_logic;
    signal s_q      :   std_logic;
    signal s_q_bar  :   std_logic;

begin
    uut_d_latch : entity work.d_latch
        port map(
            en      => s_en,
            arst    => s_arst,
            d       => s_d,
            q       => s_q,
            q_bar   => s_q_bar
            );
    p_reset_gen : process
        begin
            s_arst <= '0';
            wait for 24ns;
            
            s_arst <= '1';
            wait for 85ns;
         
            s_arst <= '0';
            wait for 88ns;
            
            s_arst <= '1';
            wait for 5 ns;
            
            s_arst <= '0'; 
            wait for 8 ns; 
            
            s_arst <= '1';       
            wait;
           
        end process p_reset_gen;
                
    p_stimulus : process 
        begin
            s_en <=  '1';
            
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
            
            assert(s_q = '0' and s_q_bar = '1')
            report "Error" severity note;
            
            s_en <= '0';
            wait for 25ns;
                    
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
            
            assert(s_q = '0' and s_q_bar = '1')
            report "Error" severity note;
            
            s_en <= '1';
            
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
            wait;
            
        end process p_stimulus;

end Behavioral;
