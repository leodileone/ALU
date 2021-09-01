library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port (
        CLOCK_50: in std_logic;
        SW: in std_logic_vector(10 downto 0);
        KEY: in std_logic_vector(0 to 1);
        
        G_LED: out std_logic_vector (0 to 9);
        LEDG: out std_logic_vector(0 to 6) := (others => '0') ;
        G_HEX7, G_HEX6, G_HEX5, G_HEX4, G_HEX1, G_HEX0: out std_logic_vector (0 to 6)
    );
end alu;

architecture hardware of alu is
    
    signal in_A, in_B: std_logic_vector(0 to 3) := (others => 'Z');
    signal X, Y, Z, res_sum, res_sub: std_logic_vector(0 to 3);
    signal res_mul: std_logic_vector(7 downto 0);
    signal set, reset, ov, bo, clk: std_logic;
    signal en: std_logic := '0';
    signal seg7_0, seg7_1, seg7_2: std_logic_vector(0 to 13);
    signal op: std_logic_vector(0 to 2);
    
begin
    
    G_HEX7 <= seg7_0(0 to 6);
    G_HEX6 <= seg7_0(7 to 13);
    
    G_HEX5 <= seg7_1(0 to 6);
    G_HEX4 <= seg7_1(7 to 13);
    
    G_HEX1 <= seg7_2(0 to 6);
    G_HEX0 <= seg7_2(7 to 13);
    
    op <= SW(10 downto 8);
    
    
    sum: work.fulladder_4bit port map(X, Y, '0', res_sum, ov);
    sub: work.subtractor_4bit port map(X, Y, res_sub, bo);
    mul: work.multiplier_4bit port map(X, Y, CLOCK_50, res_mul);
    
    out_A: work.seg7_decoder port map(in_A, seg7_0);
    out_B: work.seg7_decoder port map(in_B, seg7_1);
    out_Z: work.seg7_decoder port map(Z, seg7_2);
    
    clk_div: work.clock_divider port map(CLOCK_50, clk);
    
    process (CLOCK_50, X, Y, op, KEY)
    begin
        G_LED(0 to 1) <= "00";
        
        if en = '0' then
            in_A <= SW(3 downto 0);
            in_B <= SW(7 downto 4);
            if KEY(0) = '0' then
                X <= in_A;
                Y <= in_B;
                en <= '1';
            end if;
        end if;
        
        if en = '1' and KEY(1) = '0' then
            X <= "ZZZZ";
            Y <= "ZZZZ";
            en <= '0';
        end if;
        
        case op is
            when "000" => -- AND
               Z <= X and Y;
               LEDG <= "1000000";
            when "001" => -- OR
               Z <= X or Y;
               LEDG <= "0100000";
            when "010" => -- NOT X
               Z <= not X;
               LEDG <= "0010000";
            when "011" => -- NOT Y
               Z <= not Y;
               LEDG <= "0001000";
            when "100" => -- SUM
               Z <= res_sum;
               G_LED(0) <= ov;
               LEDG <= "0000100";
            when "101" => -- SUBTRACTION
               Z <= res_sub;
               G_LED(1) <= not bo;
               LEDG <= "0000010";
            when "110" => -- MULTIPLICATION
               Z <= res_mul(3 downto 0);
               LEDG <= "0000001";
            when others =>
               Z <= "ZZZZ";
               LEDG <= "0000000";
        end case;
       
    end process;
    
end hardware;