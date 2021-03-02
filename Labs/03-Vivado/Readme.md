# 03-Vivado

## 1.Preparation

### Table 
connection #|Switch|LED
-|-|-
0 |J15|H17
1 |L16|K15
2 |M13|J13
3 |R15|N14
4 |R17|R18
5 |T18|V17
6 |U18|U17
7 |R13|U16
8 |T8 |V16
9 |U8 |T15
10|R16|U14
11|T13|T16
12|H6 |V15
13|U12|V14
14|U11|V12
15|V10|V11

### Picture
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/03-Vivado/Pins.PNG "pins")

## 2.Two-bit wide 4-to-1 multiplexer

### Design
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_2bit_4to1 is
    port(
        a_i           	: in  std_logic_vector(2 - 1 downto 0);
		    b_i				  	  : in  std_logic_vector(2 - 1 downto 0);
        c_i           	: in  std_logic_vector(2 - 1 downto 0);
		    d_i				  	  : in  std_logic_vector(2 - 1 downto 0);
        sel_i   	 	    : in  std_logic_vector(2 - 1 downto 0);
        
        f_o			        : out  std_logic_vector(2 - 1 downto 0)
    );
end mux_2bit_4to1;

architecture Behavioral of mux_2bit_4to1 is
begin
    f_o <= a_i when (sel_i = "00") else 
           b_i when (sel_i = "01") else
           c_i when (sel_i = "10") else
           d_i;  

end Behavioral;
```

### Testbench
```vhdl
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mux_2bit_4to1 is

end tb_mux_2bit_4to1;


architecture Behavioral of tb_mux_2bit_4to1 is
    -- Local signals
    signal s_a          : std_logic_vector(2 - 1 downto 0);
    signal s_b          : std_logic_vector(2 - 1 downto 0);
    signal s_c          : std_logic_vector(2 - 1 downto 0);
    signal s_d          : std_logic_vector(2 - 1 downto 0);
    signal s_sel        : std_logic_vector(2 - 1 downto 0);
    signal s_f          : std_logic_vector(2 - 1 downto 0);
begin
    uut_mux_2bit_4to1 : entity work.mux_2bit_4to1
        port map(
            a_i     => s_a,
            b_i     => s_b,
            c_i     => s_c,
            d_i     => s_d,
            sel_i   => s_sel,
            f_o     => s_f
        );

    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

    -- First test values
        s_d <= "00"; s_c <= "00"; s_b <= "00"; s_a <= "00"; s_sel <= "00"; wait for 100 ns;      
        assert (s_f = s_a)
        -- If false, then report an error
        report "Test failed for input combination: 00,00,00,00 s_sel=00" severity error;
        
    --Second test values    
        s_d <= "01"; s_c <= "10"; s_b <= "11"; s_a <= "00"; s_sel <= "01"; wait for 100 ns;
        assert (s_f = s_b)
        -- If false, then report an error
        report "Test failed for input combination: 01,10,11,00 s_sel=01" severity error;
        
    --Third test values
    	s_d <= "11"; s_c <= "10"; s_b <= "00"; s_a <= "01"; s_sel <= "11"; wait for 100 ns;
        assert (s_f = s_d)
        -- If false, then report an error
        report "Test failed for input combination: 11,10,00,01 s_sel=11" severity error;
    
    --Forth test values    
        s_d <= "00"; s_c <= "01"; s_b <= "10"; s_a <= "11"; s_sel <= "10"; wait for 100 ns;
        assert (s_f = s_c)
        -- If false, then report an error
        report "Test failed for input combination: 00,01,10,11 s_sel=01" severity error;
     
     --Fifth test values   
        s_d <= "10"; s_c <= "00"; s_b <= "01"; s_a <= "11"; s_sel <= "00"; wait for 100 ns;
        assert (s_f = s_a)
        -- If false, then report an error
        report "Test failed for input combination: 10,00,01,11 s_sel=00" severity error;
           
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
end Behavioral;
```

### Picture of simulation
![alt text](https://github.com/xrotre05/Digital-electronics-1/blob/main/Labs/03-Vivado/simulation.PNG "simulation")

## 3.Vivado tutorial

### Create New Project
1. open Vivado
2. in Quick start select **Create Project** or use **File>Project>New...**
3. Click **Next**
4. add name to your project and click **Next**
5. leave **RTL project** selected and click **Next**
6. add sources using **Create File** select type **VHDL** and add name, then click **OK** and **Next**
7. click **Next** then select your board by clicking on Parts | **Boards** on top then select your board (Nexys A7-05T) and click **/Next**
8. check everything is in order and click **Finish** 

### Adding Source Files
1.click **File>Add Sources...**
2.select **Add or Create design sources** and click **Next**
3.add sources using **Create File** select type **VHDL** and add name, then click **OK** and **Finish**

### Adding Testbench Files
1.click **File>Add Sources...**
2.select **Add or Create simulation sources** and click **Next**
3.add sources using **Create File** select type **VHDL** and add name, then click **OK** and **Finish**

### Running simulation
1. click **Flow>Run simulation>Run Behavioral simulation**
2. wait until Vivado processes the simulation (or until an error occures)
3. you can maximize simulation window by clicking **Maximize**
4. to convert I/O variables to binary click **Settings** then change Radix to **Binary**
5. to display relevant part of simulation click **Zoom Fit**
