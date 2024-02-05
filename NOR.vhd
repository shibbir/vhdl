library ieee;
use ieee.std_logic_1164.all;

entity NOR_Gate is
port (
    input1 : in std_logic;
    input2 : in std_logic;
    output : out std_logic
);
end NOR_Gate;

architecture Behavior of NOR_Gate is
begin
    output <= input1 nor input2;
end Behavior;
