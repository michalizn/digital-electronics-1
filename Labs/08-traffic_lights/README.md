## 1. Preparation tasks

#### Completed state table:

| **Input P** | `0` | `0` | `1` | `1` | `0` | `1` | `0` | `1` | `1` | `1` | `1` | `0` | `0` | `1` | `1` | `1` |
| :-- | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: | :-: |
| **Clock** | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) | ![rising](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/Labs/08-traffic_lights/Images/eq_uparrow.png) |
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
```vhdl
p_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= STOP1 ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is

                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when STOP1 =>
                        -- Count up to c_DELAY_1SEC
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= WEST_GO;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    when WEST_GO =>
                        
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= WEST_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when WEST_WAIT =>
                        
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP2;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when STOP2 =>
                        
                        if (s_cnt < c_DELAY_1SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_GO;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when SOUTH_GO =>
                        
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= SOUTH_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when SOUTH_WAIT =>
                        
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt <= s_cnt + 1;
                        else
                            s_state <= STOP1;
                            s_cnt   <= c_ZERO;
                        end if;

                    when others =>
                        s_state <= STOP1;

                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_traffic_fsm;
```
#### Listing of VHDL code of combinatorial process `p_output_fsm` with syntax highlighting:
```vhdl
p_output_fsm : process(s_state)
    begin
        case s_state is
            when STOP1 =>
                south_o <= c_RED;
                west_o  <= c_RED;
            when WEST_GO =>
                south_o <= c_RED;
                west_o  <= c_GREEN;
            when WEST_WAIT =>
                south_o <= c_RED;
                west_o  <= c_YELLOW;
            when STOP2 =>
                south_o <= c_RED;
                west_o  <= c_RED;
            when SOUTH_GO =>
                south_o <= c_GREEN;
                west_o  <= c_RED;
            when SOUTH_WAIT =>
                south_o <= c_YELLOW;
                west_o  <= c_RED;
            when others =>
                south_o <= c_RED;
                west_o  <= c_RED;
        end case;
    end process p_output_fsm;
```
#### Screenshot(s) of the simulation, from which it is clear that controller works correctly:
![waveforms](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Images/Capture2.PNG)

## 3. Smart controller

#### State table:

| States              | Sensor | Next state          | Output |
| ------------------- | ------ | ------------------- | ------ |
| WEST_GO (001100)    | 00     | WEST_GO (001100)    | 001100 |
| WEST_GO (001100)    | 01     | WEST_GO (001100)    | 001100 |
| WEST_GO (001100)    | 10     | WEST_WAIT (010100)  | 010100 |
| WEST_GO (001100)    | 11     | WEST_WAIT (010100)  | 010100 |
| WEST_WAIT (010100)  | 00     | SOUTH_GO (100001)   | 100001 |
| WEST_WAIT (010100)  | 01     | SOUTH_GO (100001)   | 100001 |
| WEST_WAIT (010100)  | 10     | SOUTH_GO (100001)   | 100001 |
| WEST_WAIT (010100)  | 11     | SOUTH_GO (100001)   | 100001 |
| SOUTH_GO (100001)   | 00     | SOUTH_GO (100001)   | 100001 |
| SOUTH_GO (100001)   | 01     | SOUTH_GO (100001)   | 100001 |
| SOUTH_GO (100001)   | 10     | SOUTH_WAIT (100010) | 100010 |
| SOUTH_GO (100001)   | 11     | SOUTH_WAIT (100010) | 100010 |
| SOUTH_WAIT (100010) | 00     | WEST_GO (001100)    | 001100 |
| SOUTH_WAIT (100010) | 01     | WEST_GO (001100)    | 001100 |
| SOUTH_WAIT (100010) | 10     | WEST_GO (001100)    | 001100 |
| SOUTH_WAIT (100010) | 11     | WEST_GO (001100)    | 001100 |

#### State diagram:

![diagram](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/08-traffic_lights/Images/Untitled2.png)

#### Listing of VHDL code of sequential process p_smart_traffic_fsm with syntax highlighting:
```vhdl
    constant c_no_car     : unsigned(2 - 1 downto 0) := b"00";
    constant c_car_W      : unsigned(2 - 1 downto 0) := b"01";
    constant c_car_S      : unsigned(2 - 1 downto 0) := b"10";
    constant c_both_car   : unsigned(2 - 1 downto 0) := b"11";
```
```vhdl
p_smart_traffic_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state     <= WEST_GO ;      -- Set initial state
                s_cnt       <= c_ZERO  ;      -- Clear all bits
                s_sensor    <= c_ZERO  ;
                
            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is
    
                    when WEST_GO =>
                        
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt   <= s_cnt + 1;
                        elsif (s_sensor = c_no_car) then
                            s_state <= WEST_GO;
                            s_cnt   <= c_ZERO;
                        elsif (s_sensor = c_car_W) then
                            s_state <= WEST_GO;
                            s_cnt   <= c_ZERO;                                      
                        else
                            s_state <= WEST_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when WEST_WAIT =>
                        
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt   <= s_cnt + 1;                                      
                        else
                            s_state <= SOUTH_GO;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when SOUTH_GO =>
                        
                        if (s_cnt < c_DELAY_4SEC) then
                            s_cnt   <= s_cnt + 1;
                        elsif (s_sensor = c_no_car) then
                            s_state <= SOUTH_GO;
                            s_cnt   <= c_ZERO;
                        elsif (s_sensor = c_car_S) then
                            s_state <= SOUTH_GO;
                            s_cnt   <= c_ZERO;                                      
                        else
                            s_state <= SOUTH_WAIT;
                            s_cnt   <= c_ZERO;
                        end if;
                    
                    when SOUTH_WAIT =>
                        
                        if (s_cnt < c_DELAY_2SEC) then
                            s_cnt   <= s_cnt + 1;
                        else
                            s_state <= WEST_GO;
                            s_cnt   <= c_ZERO;
                        end if;
    
                    when others =>
                        s_state <= WEST_GO;
    
                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_smart_traffic_fsm;
```
