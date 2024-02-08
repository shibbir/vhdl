library ieee;
use ieee.std_logic_1164.all;

entity d_flipflop is
    port (
        clk   : in std_logic;
        rst   : in std_logic;
        d     : in std_logic;
        en    : in std_logic;
        clear : in std_logic;
        q     : out std_logic
    );
end d_flipflop;

architecture behavioral of d_flipflop is
    signal qt : std_logic;
begin
    P_DFF : process (clk, rst, en)
    begin
        if rst = '1' then
            qt <= '0';
        else
            if rising_edge(clk) then
                if clear = '1' then
                    qt <= '0';
                else
                    if en = '1' then
                        qt <= d;
                    end if;
                end if;
            end if;
        end if;
    end process;

    q <= qt;
end behavioral;
