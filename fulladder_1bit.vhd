library ieee;
use ieee.std_logic_1164.all;

entity fulladder_1bit is
    port (
        X, Y, Cin: in std_logic;
        
        Z, Cout: out std_logic
    );
end fulladder_1bit;

architecture hardware of fulladder_1bit is
begin
    Z <= X xor Y xor Cin;
    Cout <= (X and Cin) or (Y and Cin) or (X and Y);
end hardware;