library ieee;
use ieee.std_logic_1164.all;

entity seg7_decoder is
    port (
        X: in std_logic_vector(3 downto 0);
        
        seg7: out std_logic_vector(13 downto 0)
    );
end seg7_decoder;

architecture hardware of seg7_decoder is
    
begin
    
    with X select
        seg7 <=     "11111110000001" when "0000", -- 0
                    "11111111001111" when "0001", -- 1
                    "11111110010010" when "0010", -- 2
                    "11111110000110" when "0011", -- 3
                    "11111111001100" when "0100", -- 4
                    "11111110100100" when "0101", -- 5
                    "11111110100000" when "0110", -- 6
                    "11111110001111" when "0111", -- 7
                    "11111110000000" when "1000", -- 8
                    "11111110000100" when "1001", -- 9
                    "10011110000001" when "1010", -- 10
                    "10011111001111" when "1011", -- 11
                    "10011110010010" when "1100", -- 12
                    "10011110000110" when "1101", -- 13
                    "10011111001100" when "1110", -- 14
                    "10011110100100" when "1111", -- 15
                    "10011111111111" when others; -- none
    
end hardware;