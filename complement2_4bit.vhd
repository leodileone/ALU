library ieee;
use ieee.std_logic_1164.all;

entity complement2_4bit is
    port (
        X: in std_logic_vector(3 downto 0);
        Z: out std_logic_vector(3 downto 0)
    );
end complement2_4bit;

architecture hardware of complement2_4bit is

begin
    
    ad0: work.fulladder_4bit port map(not X, "0001", '0', Z, open);
    
end hardware;