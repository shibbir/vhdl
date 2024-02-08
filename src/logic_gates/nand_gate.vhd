library ieee;
use ieee.std_logic_1164.all;

entity nand_gate is
    port (
        input1 : in std_logic;
        input2 : in std_logic;
        output : out std_logic
    );
end nand_gate;

architecture dataflow of nand_gate is
begin
    output <= not(input1 and input2);
end dataflow;
