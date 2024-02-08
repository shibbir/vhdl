library ieee;
use ieee.std_logic_1164.all;

entity generic_half_adder is
    generic (
        DATA_WIDTH : integer := 16
    );

    port (
        a : in std_logic_vector(DATA_WIDTH-1 downto 0);
        b : in std_logic_vector(DATA_WIDTH-1 downto 0);
        y : out std_logic_vector(DATA_WIDTH-1 downto 0);
        c : out std_logic
    );
end generic_half_adder;

architecture behavioral of generic_half_adder is
begin
    P_ADD: process(a, b)
        variable sum_intern   : std_logic_vector(DATA_WIDTH-1 downto 0);
        variable carry_intern : std_logic;
    begin
        carry_intern := '0';

        for i in 0 to DATA_WIDTH-1 loop
            sum_intern(i) := (a(i) xor b(i)) xor carry_intern;
            carry_intern  := (a(i) and b(i)) or (carry_intern and (a(i) or b(i)));
        end loop;

        y <= sum_intern;
        c <= carry_intern;
    end process;
end behavioral;
