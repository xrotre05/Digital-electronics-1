
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity tb_t_ff_rst is

end tb_t_ff_rst;

architecture Testbench of tb_t_ff_rst is
        constant c_CLK : time    := 10 ns;
        
        signal s_clk    :  STD_LOGIC;
        signal s_t     :  STD_LOGIC;
        signal s_rst  :  STD_LOGIC;
        signal s_q     :  STD_LOGIC;
        signal s_q_bar :  STD_LOGIC;



begin
    uut_t_ff_rst : entity work.t_ff_rst
    
    port map(
             clk    => s_clk,
             t     => s_t,
             rst  => s_rst,
             q     => s_q,
             q_bar => s_q_bar            
        );
    
    p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK / 2;
            s_clk <= '1';
            wait for c_CLK / 2;
        end loop;
        wait;                           -- Process is suspended forever
    end process p_clk_gen;
    
    p_reset_gen : process
    begin
        s_rst <= '0';
        wait for 300 ns;
        s_rst <= '1';                 -- Reset activated
        wait for 100 ns;
        s_rst <= '0';
        wait for 17 ns;
        s_rst <= '1';
        wait for 7 ns;
        s_rst <= '0';
        wait;
    end process p_reset_gen;
    
    p_stimulus : process
    begin
       report "Stimulus process started" severity note;
       

       s_t    <= '0';
       
       wait for 20 ns;
            
       s_t    <= '1';  
       wait for 20 ns;  
       s_t    <= '0';
       wait for 20 ns;
       s_t    <= '1';  
       wait for 20 ns;  
       s_t    <= '0';
       wait for 20 ns;   --100ns
       
       
       
       wait for 20 ns;
       s_t    <= '1';
       wait for 20 ns;
       s_t    <= '0';   
       wait for 20 ns;
       s_t    <= '1'; 
       wait for 20 ns;
       s_t    <= '0'; 
       wait for 20 ns; -- 200 ns
       
       wait for 20 ns;
       s_t    <= '1';
       wait for 20 ns;
       s_t    <= '0';   
       wait for 20 ns;
       s_t    <= '1'; 
       wait for 70 ns;
       s_t    <= '0'; 
       wait for 20 ns; --350ns
       
       
       
       
       
        wait for 20 ns;
       s_t    <= '1';
        wait for 20 ns;
       s_t    <= '0';   
       wait for 20 ns;
       s_t    <= '1'; 
       wait for 100 ns; 
       s_t    <= '0'; 
       wait for 20 ns;
      
       wait for 20 ns;
       s_t    <= '1';
       wait for 20 ns;
       s_t    <= '0';
       wait for 20 ns;
       wait for 50 ns;
       s_t    <= '1';
       wait for 20 ns;
       s_t    <= '0';   
       wait for 20 ns;
       s_t    <= '1'; 
       wait for 20 ns;
       s_t    <= '0'; 
       wait for 20 ns;
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;

end Testbench;
