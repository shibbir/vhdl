library ieee;
use ieee.std_logic_1164.all;

entity xor_gate is
    port (
        a : in std_logic;
        b : in std_logic;
        y : out std_logic
    );
end xor_gate;

architecture dataflow of xor_gate is
begin
    y <= a xor b;
end dataflow;

architecture behavioral of xor_gate is
begin
    P_XOR : process (a, b) is
    begin
        if     (a = '0' and b = '0') then y <= '0';
        elsif  (a = '0' and b = '1') then y <= '1';
        elsif  (a = '1' and b = '0') then y <= '1';
        elsif  (a = '1' and b = '1') then y <= '0';
        elsif  (a = 'U' and b = 'U') then y <= 'U';
        else                              y <= '0';
        end if;
    end process;
end behavioral;

architecture nand_structural of xor_gate is
    component nand_gate is
        port (
            input1 : in std_logic;
            input2 : in std_logic;
            output : out std_logic
        );
    end component;

    signal temp1 : std_logic;
    signal temp2 : std_logic;
    signal temp3 : std_logic;
begin
    nand_1: nand_gate port map (input1 => a, input2 => b, output => temp1);
    nand_2: nand_gate port map (input1 => a, input2 => temp1, output => temp2);
    nand_3: nand_gate port map (input1 => b, input2 => temp1, output => temp3);
    nand_4: nand_gate port map (input1 => temp2, input2 => temp3, output => y);
end nand_structural;

architecture nor_structural of xor_gate is
    component nor_gate is
        port (
            input1 : in std_logic;
            input2 : in std_logic;
            output : out std_logic
        );
    end component;

    signal temp1 : std_logic;
    signal temp2 : std_logic;
    signal temp3 : std_logic;
    signal temp4 : std_logic;
begin
    nor_1: nor_gate port map (input1 => a, input2 => b, output => temp1);
    nor_2: nor_gate port map (input1 => a, input2 => temp1, output => temp2);
    nor_3: nor_gate port map (input1 => b, input2 => temp1, output => temp3);
    nor_4: nor_gate port map (input1 => temp2, input2 => temp3, output => temp4);
    nor_5: nor_gate port map (input1 => temp4, input2 => temp4, output => y);
end nor_structural;
