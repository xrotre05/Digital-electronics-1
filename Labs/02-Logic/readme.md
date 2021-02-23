# 02-Logic

## 1. Truth table 

Dec.equivalent|B[1:0]|A[1:0]| B>A | B=A | B<A
-|-|-|-|-|-
0|00|00|0|1|0
1   |00|01|0     |0       |1
2   |00|10|0     |0       |1
3   |00|11|0     |0       |1
4   |01|00|1     |0       |0
5   |01|01|0     |1       |0
6   |01|10|0     |0       |1
7   |01|11|0     |0       |1
8   |10|00|1     |0       |0
9   |10|01|1     |0       |0
10  |10|10|0     |1       |0
11  |10|11|0     |0       |1
12  |11|00|1     |0       |0
13  |11|01|1     |0       |0
14  |11|10|1     |0       |0
15  |11|11|0     |1       |0

## 2. 2-bit Identity comparator

### Karnaugh Maps

#### B=A

&nbsp;|&nbsp;|&nbsp;|A0|A1|&nbsp;
-|- |- |- |- |- 
&nbsp;|&nbsp;|00|01|11|10
&nbsp;|    00|1 |0 |0 |0
B1B0  |    01|0 |1 |0 |0
&nbsp;|    11|0 |0 |1 |0
&nbsp;|    10|0 |0 |0 |1

#### B>A

&nbsp;|&nbsp;|&nbsp;|A0|A1|&nbsp;
-|- |- |- |- |- 
&nbsp;|&nbsp;|00|01|11|10
&nbsp;|    00|0 |0 |0 |0
B1B0  |    01|1 |0 |0 |0
&nbsp;|    11|1 |1 |0 |1
&nbsp;|    10|1 |1 |0 |0

#### B<A

&nbsp;|&nbsp;|&nbsp;|A0|A1|&nbsp;
-|- |- |- |- |- 
&nbsp;|&nbsp;|00|01|11|10
&nbsp;|    00|0 |1 |1 |1
B1B0  |    01|0 |0 |1 |1
&nbsp;|    11|0 |0 |0 |0
&nbsp;|    10|0 |0 |1 |0

### Equations

GreaterSoP= B1 * /A1 + B0 * /A0 * /A1 + B0 * B1 * A1

LessPoS = (A1+A0) * (/B1+/B0) * (/B1+A1) * (/B0+A1) * (/B1*A0) 

 ### Link
[EDA](https://www.edaplayground.com/x/aE3C "EDA")

# 3. 4-bit binary comparator

# Design.vhd
library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for 4-bit binary comparator
------------------------------------------------------------------------
entity comparator_4bit is
    port(
        a_i           		: in  std_logic_vector(4 - 1 downto 0);
		b_i				  	: in  std_logic_vector(4 - 1 downto 0);

        B_less_A_o   	 	: out std_logic;      
        B_equals_A_o		: out std_logic;
        B_greater_A_o		: out std_logic
    );
end entity comparator_4bit;

------------------------------------------------------------------------
-- Architecture body for 4-bit binary comparator
------------------------------------------------------------------------
architecture Behavioral of comparator_4bit is
begin
    B_greater_A_o 	<= '1' when (b_i > a_i) else '0';
    B_equals_A_o		<= '1' when (b_i = a_i) else '0';
    B_less_A_o		<= '1' when (b_i < a_i) else '0';

end architecture Behavioral;

# Testbench.vhd

library IEEE;
use IEEE.std_logic_1164.all;

------------------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------------------
entity tb_comparator_4bit is
    
end entity tb_comparator_4bit;

------------------------------------------------------------------------
-- Architecture body for testbench
------------------------------------------------------------------------
architecture testbench of tb_comparator_4bit is

    -- Local signals
    signal s_a       : std_logic_vector(4 - 1 downto 0);
    signal s_b       : std_logic_vector(4 - 1 downto 0);
    signal s_B_greater_A : std_logic;
    signal s_B_equals_A  : std_logic;
    signal s_B_less_A    : std_logic;

begin
    -- Connecting testbench signals with comparator_4bit entity (Unit Under Test)
    uut_comparator_4bit : entity work.comparator_4bit
        port map(
            a_i           => s_a,
            b_i           => s_b,
            B_greater_A_o => s_B_greater_A,
            B_equals_A_o  => s_B_equals_A,
            B_less_A_o    => s_B_less_A
        );

    --------------------------------------------------------------------
    -- Data generation process
    --------------------------------------------------------------------
    p_stimulus : process
    begin
        
        report "Stimulus process started" severity note;


    -- First test values
        s_b <= "0000"; s_a <= "0000"; wait for 100 ns;
        
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        report "Test 1 failed for input combination: 0000, 0000" severity error;
    
    --Second test values 
    
        s_b <= "0100"; s_a <= "1000"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
       	report "Test 2 failed for input combination: 0100, 1000" severity error;
        
    --Third test values
    	s_b <= "1100"; s_a <= "1000"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test 3 failed for input combination: 1100, 1000" severity error;
        
    --4th test values
    	s_b <= "1111"; s_a <= "1000"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test 4 failed for input combination: 1111, 1000" severity error;
    
    --5th test values
    	s_b <= "1011"; s_a <= "1100"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test 5 failed for input combination: 1011, 1100" severity error; 
        
    --6th test values
    	s_b <= "0011"; s_a <= "0010"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test 6 failed for input combination: 0011, 0010" severity error; 
        
    --7th test values
    	s_b <= "0001"; s_a <= "1010"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '0') and (s_B_less_A = '1'))
        report "Test 7 failed for input combination: 0001, 1010" severity error; 
        
    --8th test values
    	s_b <= "1001"; s_a <= "1001"; wait for 100 ns;
        assert ((s_B_greater_A = '0') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        report "Test 8 failed for input combination: 1001, 1001" severity error; 
        
    --9th test values
    --intentional mistake
    	s_b <= "1000"; s_a <= "1000"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '1') and (s_B_less_A = '0'))
        report "Test 9 failed for input combination: 1000, 1000" severity error;
    
    --10th test values
    	s_b <= "1010"; s_a <= "1001"; wait for 100 ns;
        assert ((s_B_greater_A = '1') and (s_B_equals_A = '0') and (s_B_less_A = '0'))
        report "Test 10 failed for input combination: 1010, 1001" severity error; 
     


        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;

end architecture testbench;

## console output

analyze design.vhd
analyze testbench.vhd
elaborate tb_comparator_4bit
testbench.vhd:40:9:@0ms:(report note): Stimulus process started
testbench.vhd:88:9:@900ns:(assertion error): Test 9 failed for input combination: 1000, 1000
testbench.vhd:98:9:@1us:(report note): Stimulus process finished
Finding VCD file...
./dump.vcd

 ## Link
[EDA](https://www.edaplayground.com/x/Mb9s "EDA")
