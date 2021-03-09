# 04-adder

## 1. Prep

### Table with connection of 7-segment displays on Nexys A7 board
connection |Anode|Catode
-|-|-
CA |U13|T10
CB |K2 |R10
CC |T14|K16
CD |P14|K13
CE |J14|P15
CF |T9 |T11
CG |J18|L18
DP |J17|H15

### Truth table for common anode 7-segment display

Hex|Imputs|A|B|C|D|E|F|G|
-|-|-|-|-|-|-|-|-|
0|0000|0|0|0|0|0|0|1|
1|0001|1|0|0|1|1|1|1|
2|0010|0|0|1|0|0|1|0|
3|0011|0|0|0|0|1|1|0|
4|0100|1|0|0|1|1|0|0|
5|0101|0|1|0|0|1|0|0|
6|0110|0|1|0|0|0|0|0|
7|0111|0|0|0|1|1|1|1|
8|1000|0|0|0|0|0|0|0|
9|1001|0|0|0|0|1|0|0|
A|1010|0|0|0|1|0|0|0|
b|1011|1|1|0|0|0|0|0|
C|1100|0|1|1|0|0|0|1|
d|1101|1|0|0|0|1|0|0|
E|1110|0|1|1|0|0|0|0|
F|1111|0|1|1|1|0|0|0|

## 2. Seven-segment display decoder

### VHDL architecture
```vhdl
architecture Behavioral of hex_7seg is
begin
    p_7seg_decoder : process(hex_i)
    begin
        case hex_i is
            when "0000" =>
                seg_o <= "0000001";     -- 0
                
            when "0001" =>
                seg_o <= "1001111";     -- 1
                
            when "0010" =>
                seg_o <= "0010010";     -- 2
                
            when "0011" =>
                seg_o <= "0000110";     -- 3
                
            when "0100" =>
                seg_o <= "1001100";     -- 4
                
            when "0101" =>
                seg_o <= "0100100";     -- 5
                
            when "0110" =>
                seg_o <= "0100000";     -- 6
                
            when "0111" =>
                seg_o <= "0001111";     -- 7
                
            when "1000" =>
                seg_o <= "0000000";     -- 8
                
            when "1001" =>
                seg_o <= "0000100";     -- 9
                
            when "1010" =>
                seg_o <= "0001000";     -- A
                
            when "1011" =>
                seg_o <= "1100000";     -- b
                
            when "1100" =>
                seg_o <= "0110001";     -- C
                
            when "1101" =>
                seg_o <= "1000100";     -- d
                
            when "1110" =>
                seg_o <= "0110000";     -- E
                
            when "1111" =>
                seg_o <= "0111000";     -- F
                
            when others =>
                seg_o <= "1111110";     -- other
                
        end case;
    end process p_7seg_decoder;

end Behavioral;
```

### VHDL testbench
```vhdl
p_stimulus : process
    begin
        s_hex <= "0000"; wait for 100 ns;   --0
        s_hex <= "0001"; wait for 100 ns;   --1
        s_hex <= "0010"; wait for 100 ns;   --2
        s_hex <= "0011"; wait for 100 ns;   --3
        s_hex <= "0100"; wait for 100 ns;   --4
        s_hex <= "0101"; wait for 100 ns;   --5
        s_hex <= "0110"; wait for 100 ns;   --6
        s_hex <= "0111"; wait for 100 ns;   --7
        s_hex <= "1000"; wait for 100 ns;   --8
        s_hex <= "1001"; wait for 100 ns;   --9
        s_hex <= "1010"; wait for 100 ns;   --A
        s_hex <= "1011"; wait for 100 ns;   --b
        s_hex <= "1100"; wait for 100 ns;   --C
        s_hex <= "1101"; wait for 100 ns;   --d
        s_hex <= "1110"; wait for 100 ns;   --E
        s_hex <= "1111"; wait for 100 ns;   --F
         
     wait;   
    end process p_stimulus;
```
