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
