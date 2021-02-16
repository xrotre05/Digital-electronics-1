# 01-Gates
## Github link
[Github](https://github.com/xrotre05/Digital-electronics-1 "Github")

## De Morgan

### Design.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity gates is
    port(
        a_i    : in  std_logic;         
        b_i    : in  std_logic;         
        c_i	   : in  std_logic;
        f_o 	: out std_logic;
        f_nand 	: out std_logic;
        f_nor	: out std_logic
    );
end entity gates;

architecture dataflow of gates is
begin
    f_o  	<= ((not b_i) and a_i) or ((not c_i) and (not b_i));
   	f_nand 	<= ((not b_i) nand a_i) nand ((not c_i) nand (not b_i));
    f_nor   <= (a_i nor (not c_i)) nor b_i;

end architecture dataflow;


### Printscreen
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/01-Gates/DeMorgan.PNG "Logo Title Text 1")

### Table
 c | b | a | f(c,b,a) | f(c,b,a)nand | f(c,b,a)nor
---|---|---|---|---|---
 0 | 0 | 0 | 1 | 1 | 1  
 0 | 0 | 1 | 1 | 1 | 1  
 0 | 1 | 0 | 0 | 0 | 0 
 0 | 1 | 1 | 0 | 0 | 0  
 1 | 0 | 0 | 0 | 0 | 0  
 1 | 0 | 1 | 1 | 1 | 1  
 1 | 1 | 0 | 0 | 0 | 0  
 1 | 1 | 1 | 0 | 0 | 0  
 
 ### Link
[EDA](https://www.edaplayground.com/x/8qUf "EDA")
