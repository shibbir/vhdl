library ieee;
use ieee.std_logic_1164.all;

entity NAND_Gate is
port (
    input1 : in std_logic;
    input2 : in std_logic;
    output : out std_logic
);
end NAND_Gate;

architecture Dataflow of NAND_Gate is
begin
    output <= not(input1 and input2);
end Dataflow;
