library ieee;
use ieee.std_logic_1164.all;

entity piso is
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        par_in  : in std_logic_vector(7 downto 0);
        load    : in std_logic;
        shift   : in std_logic;
        ser_out : out std_logic
    );
end piso;

architecture behavioral of piso is
    signal reg_data : std_logic_vector(7 downto 0);
begin
    P_REG : process (clk, rst, load, shift, par_in) is
    begin
        if rst = '1' then
            reg_data <= (others => 'U');
        else
            if rising_edge(clk) then
                if load = '1' then
                    reg_data <= par_in;
                end if;

                if shift = '1' then
                    reg_data <= '0' & reg_data(7 downto 1);
                end if;
            end if;
        end if;
    end process;

    ser_out <= reg_data(0);
end behavioral;
