

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_d_latch is

end tb_d_latch;
           

architecture Testbench of tb_d_latch is
        signal s_en    :  STD_LOGIC;
        signal s_d     :  STD_LOGIC;
        signal s_arst  :  STD_LOGIC;
        signal s_q     :  STD_LOGIC;
        signal s_q_bar :  STD_LOGIC; 
           
begin
    uut_d_latch : entity work.d_latch
    
    port map(
             en    => s_en,
             d     => s_d,
             arst  => s_arst,
             q     => s_q,
             q_bar => s_q_bar            
        );
    p_stimulus : process
    begin
       report "Stimulus process started" severity note;
       
       s_en   <= '0';
       s_d    <= '0';
       s_arst <= '0';
       wait for 20 ns;
            
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;
       s_d    <= '1';  
       wait for 20 ns;  
       s_d    <= '0';
       wait for 20 ns;
       
       --test enable
       s_en   <= '1';
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       s_en   <= '0'; --enable deactivated
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       
       
       
       --test reset
       s_en   <= '1';
        wait for 20 ns;
       s_d    <= '1';
        wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       s_arst <= '1'; --reset active
       wait for 20 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';
       wait for 20 ns;
       s_arst <= '0'; --reset deactive
       wait for 50 ns;
       s_d    <= '1';
       wait for 20 ns;
       s_d    <= '0';   
       wait for 20 ns;
       s_d    <= '1'; 
       wait for 20 ns;
       s_d    <= '0'; 
       wait for 20 ns;
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;    
        
end Testbench;
