----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 24.03.2021 11:26:06
-- Design Name: 
-- Module Name: tb_jk_ff_rst - Testbench
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_jk_ff_rst is

end tb_jk_ff_rst;

architecture Testbench of tb_jk_ff_rst is
        
        constant c_CLK : time    := 10 ns;
        
        signal s_clk    :  STD_LOGIC;
        signal s_j      :  STD_LOGIC;
        signal s_k      :  STD_LOGIC;
        signal s_rst    :  STD_LOGIC;
        signal s_q      :  STD_LOGIC;
        signal s_q_bar  :  STD_LOGIC;

begin
    uut_jk_ff_rst : entity work.jk_ff_rst
    
    port map(
             clk    => s_clk,
             j     => s_j,
             k     => s_k,
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
       

       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
            
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns; 
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       s_j    <= '1';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '1';
       s_k    <= '1';
       wait for 20 ns;
       s_j    <= '0';
       s_k    <= '0';
       wait for 20 ns;
       
       
       report "Stimulus process finished" severity note;
       wait;
   end process p_stimulus;


end Testbench;
