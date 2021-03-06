# 01-Gates
## 1.Github link
[Github](https://github.com/xrotre05/Digital-electronics-1 "Github")

## 2.De Morgan

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
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/01-Gates/DeMorgan.PNG "Demorgan")

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
[EDA](https://www.edaplayground.com/x/Dnfm "EDA")

## 3.Distributive laws

### design.vhd
library IEEE;
use IEEE.std_logic_1164.all;

entity gates is
    port(
        x_i    : in  std_logic;         
        y_i    : in  std_logic;         
        z_i	   : in  std_logic;
        f_1 	: out std_logic;
        f_2 	: out std_logic;
        f_3		: out std_logic;
        f_4		: out std_logic;
        f_5		: out std_logic;
        f_6		: out std_logic;
        f_7		: out std_logic;
        f_8		: out std_logic
    );
end entity gates;

architecture dataflow of gates is
begin
    f_1  	<= x_i and (not x_i) ;
   	f_2 	<= x_i or (not x_i);
    f_3   	<= x_i or x_i or x_i;
    f_4  	<= x_i and x_i and x_i;
   	f_5 	<= (x_i and y_i) or (x_i and z_i);
    f_6 	<= x_i and (y_i or z_i);
    f_7 	<= (x_i or y_i) and (x_i or z_i);
    f_8 	<= x_i or (y_i and z_i);
    

end architecture dataflow;

### Printscreen
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/01-Gates/Distributive.PNG "Distributive")


### Link
[EDA](https://www.edaplayground.com/x/8qUf "EDA")
