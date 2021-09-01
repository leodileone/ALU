library ieee;
use ieee.std_logic_1164.all;

entity counter_3bit is
    port (
        clk: in std_logic;
        
        Z: out std_logic_vector(2 downto 0)
    );
end counter_3bit;

architecture hardware of counter_3bit is
    signal count: std_logic_vector(2 downto 0) := (others => '0');
begin

    Z <= count;

    process (clk)
    begin
        if clk'event and clk = '1' then
            case count is
                when "000" =>
                    count <= "001";
                when "001" =>
                    count <= "010";
                when "010" =>
                    count <= "011";
                when "011" =>
                    count <= "100";
                when "100" =>
                    count <= "101";
                when "101" =>
                    count <= "110";
                when "110" =>
                    count <= "000";
                when others =>
                    count <= "ZZZ";
            end case;
        end if;
    end process;
end hardware;