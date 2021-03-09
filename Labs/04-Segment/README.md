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

### VHDL architecture from source file hex_7seg.vhd
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

### VHDL stimulus process from testbench file tb_hex_7seg.vhd
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


### Picture of Simulation
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/04-adder/hex_7seg_sim.PNG "7_seg_sim")

### VHDL code from source file top.vhd

```vhdl
entity top is
    Port ( SW : in STD_LOGIC_VECTOR (4-1 downto 0);
           LED : out STD_LOGIC_VECTOR (8-1 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (8-1 downto 0));
end top;

------------------------------------------------------------------------
-- Architecture body for top level
------------------------------------------------------------------------
architecture behavioral of top is
begin

    --------------------------------------------------------------------
    -- Instance (copy) of hex_7seg entity
    hex2seg : entity work.hex_7seg
        port map(
            hex_i    => SW,
            seg_o(6) => CA,
            seg_o(5) => CB,
            seg_o(4) => CC,
            seg_o(3) => CD,
            seg_o(2) => CE,
            seg_o(1) => CF,
            seg_o(0) => CG
        );

    -- Connect one common anode to 3.3V
    AN <= b"1111_0111";

    -- Display input value
    LED(3 downto 0) <= SW;
```

## 3. LED indicators

### Truth table for LED(7:4) indicators

| **Hex** | **Inputs** | **LED4** | **LED5** | **LED6** | **LED7** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0000 | 1 | 0 | 0 | 0 |
| 1 | 0001 | 0 | 0 | 1 | 1 |
| 2 | 0010 | 0 | 0 | 0 | 1 |
| 3 | 0011 | 0 | 0 | 1 | 0 |
| 4 | 0100 | 0 | 0 | 0 | 1 |
| 5 | 0101 | 0 | 0 | 1 | 0 |
| 6 | 0110 | 0 | 0 | 0 | 0 |
| 7 | 0111 | 0 | 0 | 1 | 0 |
| 8 | 1000 | 0 | 0 | 0 | 1 |
| 9 | 1001 | 0 | 0 | 1 | 0 |
| A | 1010 | 0 | 1 | 0 | 0 |
| b | 1011 | 0 | 1 | 1 | 0 |
| C | 1100 | 0 | 1 | 0 | 0 |
| d | 1101 | 0 | 1 | 1 | 0 |
| E | 1110 | 0 | 1 | 0 | 0 |
| F | 1111 | 0 | 1 | 1 | 0 |

### VHDL code for LEDs(7:4)
```vhdl
-- Turn LED(4) on if input value is equal to 0, ie "0000"
     LED(4) <= '1' when (SW = "0000") else '0';   
    
    -- Turn LED(5) on if input value is greater than 9
     LED_5 : process (SW)
     begin
        if SW > "1001" then
            LED(5) <= '1';
        else
            LED(5) <= '0';
        end if;
     end process LED_5;
     
    
    -- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
    LED_6 : process (SW)
     begin
        if SW(0) = '1' then
            LED(6) <= '1';
        else
            LED(6) <= '0';
        end if;
     end process LED_6;
    
    -- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
    -- using gates   /( /(/3/2/10) and /(/3/21/0) and /(/32/1/0) and /(3/2/1/0) )
LED(7) <= not(  (not((not SW(3)) and (not SW(2)) and (not SW(1)) and SW(0))) and --0001 
                (not((not SW(3)) and (not SW(2)) and SW(1) and (not SW(0)))) and --0010
                (not((not SW(3)) and SW(2) and (not SW(1)) and (not SW(0)))) and --0100
                (not(SW(3) and (not SW(2)) and (not SW(1)) and (not SW(0))))) ;  --1000             
    
    -- using case
--     LED_7 : process (SW)
--        begin
--            case SW is
--                when "0001"=>
--                    LED(7)<= '1';
--                when "0010"=>
--                    LED(7)<= '1';
--                when "0100"=>
--                    LED(7)<= '1';
--                when "1000"=>
--                    LED(7)<= '1';
--                when others =>
--                    LED(7)<= '0';
--        end case;
--     end process LED_7;
```

### Picture of Simulation
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/04-adder/top_sim.PNG "top_sim")
