library ieee;
use ieee.std_logic_1164.all;

entity multiplier_4bit is
    port (
        X, Y: in std_logic_vector(3 downto 0);
        clk: in std_logic;
        
        Z: out std_logic_vector(7 downto 0)
    );
end multiplier_4bit;

architecture hardware of multiplier_4bit is
    signal y0,y1,y2,y3,s0,s1,s2: std_logic_vector(7 downto 0) := (others => '0');
    signal carry: std_logic_vector(3 downto 0);
begin

    process (clk)
    begin
        for i in 0 to 3 loop
            y0(i) <= X(i) and Y(0);
            y1(i+1) <= X(i) and Y(1);
            y2(i+2) <= X(i) and Y(2);
            y3(i+3) <= X(i) and Y(3);
        end loop;
    end process;
    
    ad0: work.fulladder_8bit port map(y0, y1, '0', s0, carry(0));
    ad1: work.fulladder_8bit port map(s0, y2, carry(0), s1, carry(1));
    ad2: work.fulladder_8bit port map(s1, y3, carry(1), s2, carry(2));
    
    Z <= s2;
    
end hardware;