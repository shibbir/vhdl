library ieee;
use ieee.std_logic_1164.all;

entity rs_flipflop is
    port (
        s : in std_logic;
        r : in std_logic;
        q : out std_logic
    );
end rs_flipflop;

architecture behavioral of rs_flipflop is
    signal qt : std_logic;
begin
    process (s, r)
    begin
        if     (s = '1' and r = '0') then qt <= '1';
        elsif  (s = '0' and r = '1') then qt <= '0';
        elsif  (s = '1' and r = '1') then qt <= 'X';
        else                              qt <= qt;
        end if;
    end process;

    q <= qt;
end behavioral;

architecture structural of rs_flipflop is
    component nor_gate is
        port (
            input1 : in std_logic;
            input2 : in std_logic;
            output : out std_logic
        );
    end component;

    signal temp1 : std_logic;
    signal temp2 : std_logic;
begin
    nor_1: nor_gate port map (s, temp2, temp1);
    nor_2: nor_gate port map (temp1, r, temp2);

    q <= temp2;
end structural;

-- The structural description had worked fine in Post-Route simulation, but had issues with the Behavioral simulation, which
-- is basically in a perfect world without any timing delay which led to zero delay oscillation

-- The behavioral description had worked fine in Behavioral simulation, but had issues with the Post-Route simulation
