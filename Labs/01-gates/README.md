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
