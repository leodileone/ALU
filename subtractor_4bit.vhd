library ieee;
use ieee.std_logic_1164.all;

entity subtractor_4bit is
    port (
        X, Y: in std_logic_vector(3 downto 0);
        
        Z: out std_logic_vector(3 downto 0);
        Bout: out std_logic
    );
end subtractor_4bit;

architecture hardware of subtractor_4bit is
    
    signal c2_Y: std_logic_vector(3 downto 0);
    
begin
    
    c2: work.complement2_4bit port map(Y, c2_Y);
    ad: work.fulladder_4bit port map(X, c2_Y, '0', Z, Bout);
    
end hardware;