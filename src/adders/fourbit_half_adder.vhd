library ieee;
use ieee.std_logic_1164.all;

entity fourbit_half_adder is
    port (
        a : in std_logic_vector(3 downto 0);
        b : in std_logic_vector(3 downto 0);
        y : out std_logic_vector(3 downto 0);
        carry: out std_logic
    );
end fourbit_half_adder;

architecture dataflow of fourbit_half_adder is
    signal tmp : unsigned(4 downto 0);
begin
    tmp <= unsigned('0' & a) + unsigned('0' & b);
    y <= std_logic_vector(tmp(3 downto 0));
    carry <= std_logic(tmp(4));
end dataflow;

architecture structural of fourbit_half_adder is
    component full_adder is
        port (
            a     : in std_logic;
            b     : in std_logic;
            c_in  : in std_logic;
            y     : out std_logic;
            c_out : out std_logic
        );
    end component;

    signal c_t : std_logic_vector(2 downto 0);
begin
    fa0: full_adder port map(a(0), b(0), '0', y(0), c_t(0));
    fa1: full_adder port map(a(1), b(1), c_t(0), y(1), c_t(1));
    fa2: full_adder port map(a(2), b(2), c_t(1), y(2), c_t(2));
    fa3: full_adder port map(a(3), b(3), c_t(2), y(3), carry);
end structural;
