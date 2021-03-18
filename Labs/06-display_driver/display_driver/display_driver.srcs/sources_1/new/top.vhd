library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
    port(
        CLK100MHZ : in std_logic;   --Main clock
        BTNC      : in std_logic;
        SW        : in std_logic_vector(16 - 1 downto 0);
        
        CA        : out std_logic;
        CB        : out std_logic;
        CC        : out std_logic;
        CD        : out std_logic;
        CE        : out std_logic;
        CF        : out std_logic;
        CG        : out std_logic;
         
        AN        : out std_logic_vector(8 - 1 downto 0)   
        );
end entity top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture Behavioral of top is
    -- No internal signals
begin

    --------------------------------------------------------------------
    -- Instance (copy) of driver_7seg_4digits entity
    driver_seg_4 : entity work.driver_7seg_4digits
        port map(
            clk              => CLK100MHZ,
            reset            => BTNC,
            data0_i(3)       => SW(3),
            data0_i(2)       => SW(2),
            data0_i(1)       => SW(1),
            data0_i(0)       => SW(0),
            
            data1_i(7)       => SW(7),
            data1_i(6)       => SW(6),
            data1_i(5)       => SW(5),
            data1_i(4)       => SW(4),
            
            data2_i(11)      => SW(11),
            data2_i(10)      => SW(10),
            data2_i(9)       => SW(9),
            data2_i(8)       => SW(8),
            
            data3_i(15)      => SW(15),
            data3_i(14)      => SW(14),
            data3_i(13)      => SW(13),
            data3_i(12)      => SW(12),
            
            dig_o            => AN(4 - 1 downto 0),
            
            seg_o(0)         => CA,
            seg_o(1)         => CB,
            seg_o(2)         => CC,
            seg_o(3)         => CD,
            seg_o(4)         => CE,
            seg_o(5)         => CF,
            seg_o(6)         => CG,
            
            --- WRITE YOUR CODE HERE
            dp_i => "0111",
            dp_o => DP
            --- WRITE YOUR CODE HERE
        );

    -- Disconnect the top four digits of the 7-segment display
    AN(7 downto 4) <= b"1111";

end architecture Behavioral;