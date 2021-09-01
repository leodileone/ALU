library ieee;
use ieee.std_logic_1164.all;

entity fulladder_4bit is
    port (
        X, Y: in std_logic_vector(3 downto 0);
        Cin: in std_logic;
        
        Z: out std_logic_vector(3 downto 0);
        Cout: out std_logic
    );
end fulladder_4bit;

architecture hardware of fulladder_4bit is
    
    signal carry : std_logic_vector (2 downto 0);
    
begin
    
    fa0: work.fulladder_1bit port map(X(0), Y(0), Cin, Z(0), carry(0));
    fa1: work.fulladder_1bit port map(X(1), Y(1), carry(0), Z(1), carry(1));
    fa2: work.fulladder_1bit port map(X(2), Y(2), carry(1), Z(2), carry(2));
    fa3: work.fulladder_1bit port map(X(3), Y(3), carry(2), Z(3), Cout);
    
end hardware;