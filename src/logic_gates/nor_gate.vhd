library ieee;
use ieee.std_logic_1164.all;

entity nor_gate is
    port (
        input1 : in std_logic;
        input2 : in std_logic;
        output : out std_logic
    );
end nor_gate;

architecture behavioral of nor_gate is
begin
    output <= input1 nor input2;
end behavioral;
