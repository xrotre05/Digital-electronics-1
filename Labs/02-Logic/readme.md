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

## 3. 4-bit binary comparator

### Design.vhd
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
