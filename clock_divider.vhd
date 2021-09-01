library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
    port (
        clk_in: in std_logic;
        
        clk_out: out std_logic
    );
end clock_divider;

architecture hardware of clock_divider is
    signal count: integer := 0;
begin
    process (clk_in)
    begin
        if clk_in'event and clk_in = '1' then
            if count = 50000000 then
                count <= 0;
                clk_out <= '1';
            else
                count <= count + 1;
                clk_out <= '0';
            end if;
        end if;
    end process;
end hardware;