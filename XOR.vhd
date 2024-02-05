library ieee;
use ieee.std_logic_1164.all;

entity XOR is
port (
    a : in std_logic;
    b : in std_logic;
    y : out std_logic
);
end XOR;

architecture Dataflow of XOR is
begin
    y <= a xor b;
end Dataflow;

architecture Behavior of XOR is
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
end Behavior;

architecture NAND_Structure of XOR is
    component NAND_Gate is
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
    NAND_1: NAND_Gate port map (input1 => a, input2 => b, output => temp1);
    NAND_2: NAND_Gate port map (input1 => a, input2 => temp1, output => temp2);
    NAND_3: NAND_Gate port map (input1 => b, input2 => temp1, output => temp3);
    NAND_4: NAND_Gate port map (input1 => temp2, input2 => temp3, output => y);
end NAND_Structure;

architecture NOR_Structure of XOR is
    component NOR_Gate is
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
    NOR_1: NOR_Gate port map (input1 => a, input2 => b, output => temp1);
    NOR_2: NOR_Gate port map (input1 => a, input2 => temp1, output => temp2);
    NOR_3: NOR_Gate port map (input1 => b, input2 => temp1, output => temp3);
    NOR_4: NOR_Gate port map (input1 => temp2, input2 => temp3, output => temp4);
    NOR_5: NOR_Gate port map (input1 => temp4, input2 => temp4, output => y);
end NOR_Structure;
