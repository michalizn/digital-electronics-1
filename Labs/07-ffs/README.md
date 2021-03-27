## 1. Preparation tasks

#### Characteristic equations and completed tables for D, JK, T flip-flops:

![equation](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/CodeCogsEqn.png)

| clk   | d    | Q(n) | Q(n+1) | Comments           |
| ----- | ---- | ---- | ------ | ------------------ |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png) | 0    | 0    | 0      | No change          |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)      | 0    | 1    | 1      | No change          |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)      | 1    | 0    | 0      | Set (stored to FF) |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)      | 1    | 1    | 1      | Set (stored to FF) |

![equation](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/CodeCogsEqn1.png)

| clk  | j    | k    | Q(n) | Q(n+1) | Comments  |
| ---- | ---- | ---- | ---- | ------ | --------- |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 0    | 0    | 0      | No change |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 0    | 1    | 1      | No change |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 1    | 0    | 0      | Reset     |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 1    | 1    | 0      | Reset     |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 0    | 0    | 1      | Set       |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 0    | 1    | 1      | Set       |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 1    | 0    | 1      | Toggle    |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 1    | 1    | 0      | Toggle    |

![equation](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/CodeCogsEqn2.png)

| clk  | t    | Q(n) | Q(n+1) | Comments        |
| ---- | ---- | ---- | ------ | --------------- |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 0    | 0      | No change       |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 0    | 1    | 1      | No change       |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 0    | 1      | Invert (Toggle) |
| ![up](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/07-ffs/Images/eq_uparrow.png)     | 1    | 1    | 0      | Invert (Toggle) |

## 2. D latch

#### VHDL code listing of the process `p_d_latch` with syntax highlighting:
```vhdl
p_d_latch : process ( d, arst, en)
     
     begin
         if (arst = '1') then
             q <= '0';
             q_bar <= '1';
         elsif (en = '1') then
             q <= d;
             q_bar <= not d;
         end if;
         
     end process p_d_latch;
```

#### Listing of VHDL reset and stimulus processes from the testbench `tb_d_latch.vhd` file with syntax highlighting and asserts:
```vhdl
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
```

```vhdl
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
```

#### Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entities must be verified:
![waveforms]()

## 3. Flip-flops

#### VHDL code listing of the processes `p_d_ff_arst`, `p_d_ff_rst`, `p_jk_ff_rst`, `p_t_ff_rst` with syntax highlighting:
###### D FF arst
```vhdl
p_d_ff_latch : process ( clk, arst)
     
     begin
         if (arst = '1') then
             q <= '0';
             q_bar <= '1';
         elsif rising_edge(clk) then
             q <= d;
             q_bar <= not d;
         end if;
         
     end process p_d_ff_latch;
```
###### D FF rst
```vhdl
p_d_ff_latch : process (clk)
     begin
         if rising_edge(clk) then
            if (rst = '1') then
                q <= '0';
                q_bar <= '1';
                else
                q <= d;
                q_bar <= not d;
            end if;
         end if;
         
     end process p_d_ff_latch;
```

###### JK FF rst
```vhdl
p_jk_ff_latch : process (clk)
     begin
         if rising_edge(clk) then
            if (rst = '1') then
                s_q <= '0';
                else
                    if (j = '0' and k = '0') then
                    s_q <= s_q;
                    
                    elsif (j = '0' and k = '1') then
                    s_q <= '0';
                    
                    elsif (j = '1' and k = '0') then
                    s_q <= '1';
                    
                    elsif (j = '1' and k = '1') then
                    s_q <= not s_q;
                    end if;
            end if;
         end if;
    end process p_jk_ff_latch;
```

###### T FF rst
```vhdl
p_t_ff_latch : process (clk)
     begin
         if rising_edge(clk) then
            if (rst = '1') then
                s_q <= '0';
                else
                    if (t = '0') then
                    s_q <= s_q;
                    
                    elsif (t = '1') then
                    s_q <= not s_q;
                    end if;
            end if;
         end if;
    end process p_t_ff_latch;
```

#### Listing of VHDL clock, reset and stimulus processes from the testbench files with syntax highlighting and asserts:
###### D FF arst
```vhdl
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
```
```vhdl
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
```

###### D FF rst
```vhdl
p_reset_gen : process
         begin
             s_rst <= '0';
             wait for 23 ns;
         
             -- Reset activated
             s_rst <= '1';
             wait for 44 ns;
         
             s_rst <= '0';
             wait;
         end process p_reset_gen;
```
```vhdl
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
```

###### JK FF rst
```vhdl
p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 15 ns;
    
        s_rst <= '1';
        wait for 45 ns;
        
        s_rst <= '0';
        wait for 126 ns;
        
        s_rst <= '1';
        wait for 62 ns;
        
        s_rst <= '0';
        wait;
    end process p_reset_gen;
```
```vhdl
p_stimulus : process
        begin
        report "Stimulus process started" severity note;
        s_j <= '0';
        s_k <= '0';
        
        wait for 43ns;
        s_j <= '0';
        s_k <= '0';
        
        assert(s_q = '0' and s_q_bar = '1')
        report "Error" severity note;
                  
        wait for 46ns;
        s_j <= '0'; 
        s_k <= '1';
        wait for 38ns;
        s_j <= '1'; 
        s_k <= '0';   
        wait for 18ns;
        s_j <= '1'; 
        s_k <= '1';       
        wait for 54ns;
        s_j <= '0';
        s_k <= '0';
        
        assert(s_q = '0' and s_q_bar = '1')
        report "Error" severity note;
                  
        wait for 12ns;
        s_j <= '0'; 
        s_k <= '1';
        wait for 65ns;
        s_j <= '1'; 
        s_k <= '0';   
        wait for 33ns;
        s_j <= '1'; 
        s_k <= '1';                    
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

###### T FF rst
```vhdl
p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 15 ns;
    
        s_rst <= '1';
        wait for 45 ns;
        
        s_rst <= '0';
        wait for 126 ns;
        
        s_rst <= '1';
        wait for 62 ns;
        
        s_rst <= '0';
        wait;
    end process p_reset_gen;
```
```vhdl
p_stimulus : process
        begin
        report "Stimulus process started" severity note;
        s_t <= '0';
        wait for 43ns;
        s_t <= '1';
        assert(s_q = '0' and s_q_bar = '1')
        report "Error" severity note;
                  
        wait for 46ns;
        s_t <= '0';
        wait for 38ns;
        s_t <= '1';
        wait for 18ns;
        s_t <= '0';
        wait for 54ns;

        
        assert(s_q = '0' and s_q_bar = '1')
        report "Error" severity note;
        s_t <= '1';                  
        wait for 12ns;
        s_t <= '0';
        wait for 65ns;
        s_t <= '1'; 
        wait for 33ns;
                  
        
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

#### Screenshot with simulated time waveforms; always display all inputs and outputs. The full functionality of the entities must be verified:
###### D FF arst
![waveform]()

###### D FF rst
![waveform]()

###### JK FF rst
![waveform]()

###### T FF rst
![waveform]()

## 4. Shift register

#### Image of the shift register schematic:
