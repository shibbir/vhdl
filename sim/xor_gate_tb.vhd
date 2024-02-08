library ieee;
use ieee.std_logic_1164.all;

entity xor_gate_tb is
end xor_gate_tb;

architecture behavioral of xor_gate_tb is
    component xor_gate is
        port (
            a : in std_logic;
            b : in std_logic;
            y : out std_logic
        );
    end component;

    signal a : std_logic := '0';
    signal b : std_logic := '0';
    signal y : std_logic;
begin
    uut: xor_gate port map (a => a, b => b, y => y);

    SIM_Proc: process
    begin
        wait for 100 ns;

        a <= 'U'; b <= 'U'; wait for 10 ns;
        a <= 'X'; b <= 'X'; wait for 10 ns;
        a <= 'X'; b <= '0'; wait for 10 ns;
        a <= 'X'; b <= '1'; wait for 10 ns;
        a <= '0'; b <= '0'; wait for 10 ns;
        a <= '0'; b <= '1'; wait for 10 ns;
        a <= '1'; b <= '0'; wait for 10 ns;
        a <= '1'; b <= '1'; wait for 10 ns;

        wait;
    end process;
end behavioral;
