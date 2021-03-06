library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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
     
end architecture behavioral;
