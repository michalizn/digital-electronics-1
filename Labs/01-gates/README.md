## Verification of De Morgan's laws of function f(c,b,a).

### VHDL code
```vhdl
architecture dataflow of gates is
begin

    f_o      <= (not(b_i) and (a_i)) or (not(c_i) and not(b_i));
    fand_o   <= not(not(not(b_i) and (a_i)) and not(not(c_i) and not(b_i)));
    fnand_o  <= not(not(not(not(b_i) and (a_i)) and not(not(c_i) and not(b_i))));
    for_o    <= not((b_i) or not(a_i)) or not((c_i) or (b_i));
    fnor_o   <= not(not((b_i) or not(a_i)) or not((c_i) or (b_i)));
    
end architecture dataflow;
```
### Screenshot with simulated time waveforms
![De Morgan's laws](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/01-gates/Images/Capture.PNG)

### Link to my public EDA Playground example
https://www.edaplayground.com/x/WasR

## Verification of Distributive laws.

### VHDL code
```vhdl
architecture dataflow of gates is
begin

-- Verifying basic Boolean postulates:
    f1_o  <= x_i and not(x_i);
    f2_o  <= x_i or not(x_i);
    f3_o  <= x_i or x_i or x_i;
    f4_o  <= x_i and x_i and x_i;
-- Verifying Distributive laws
    fa_o  <= (x_i and y_i) or (x_i and z_i);    -- x*y+x*z
    fb_o  <= x_i and (y_i or z_i);              -- x*(y+z)
    fc_o  <= (x_i or y_i) and (x_i or z_i);     -- (x+y)*(x+z)
    fd_o  <= x_i or (y_i and z_i);              -- x+(y*z)

end architecture dataflow;
```
### Screenshot with simulated time waveforms
![De Morgan's laws](https://github.com/michalizn/Digital-electronics-1/blob/main/Labs/01-gates/Images/Capture2.PNG)

### Link to my public EDA Playground example
https://www.edaplayground.com/x/Ec89
