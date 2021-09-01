library ieee;
use ieee.std_logic_1164.all;

entity fulladder_8bit is
    port (
        X, Y: in std_logic_vector(7 downto 0);
        Cin: in std_logic;
        
        Z: out std_logic_vector(7 downto 0);
        Cout: out std_logic
    );
end fulladder_8bit;

architecture hardware of fulladder_8bit is
    signal carry: std_logic;
begin
    ad0: work.fulladder_4bit port map(X(3 downto 0), Y(3 downto 0), Cin, Z(3 downto 0), carry);
    ad1: work.fulladder_4bit port map(X(7 downto 4), Y(7 downto 4), carry, Z(7 downto 4), Cout);
end hardware;