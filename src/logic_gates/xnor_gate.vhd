library ieee;
use ieee.std_logic_1164.all;

entity xnor_gate is
    port (
        a : in std_logic;
        b : in std_logic;
        y : out std_logic
    );
end xnor_gate;

architecture dataflow of xnor_gate is
begin
    y <= a xnor b;
    -- y <= not(a xor b);
    -- y <= (not a and not b) or (a and b);
end dataflow;

architecture behavioral of xnor_gate is
begin
    P_XNOR : process (a, b) is
    begin
        if     (a = '0' and b = '0') then y <= '1';
        elsif  (a = '0' and b = '1') then y <= '0';
        elsif  (a = '1' and b = '0') then y <= '0';
        elsif  (a = '1' and b = '1') then y <= '1';
        elsif  (a = 'U' and b = 'U') then y <= 'U';
        else                              y <= '0';
        end if;
    end process;
end behavioral;
