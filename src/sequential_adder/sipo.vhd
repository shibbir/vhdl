library ieee;
use ieee.std_logic_1164.all;

entity sipo is
    port (
        clk     : in std_logic;
        rst     : in std_logic;
        ser_in  : in std_logic;
        shift   : in std_logic;
        par_out : out std_logic_vector(7 downto 0)
    );
end sipo;

architecture behavioral of sipo is
    signal reg_data : std_logic_vector(7 downto 0);
begin
    P_REG : process (clk, rst, shift, ser_in) is
    begin
        if rst = '1' then
            reg_data <= (others => 'U');
        else
            if rising_edge(clk) then
                if shift = '1' then
                    reg_data <= ser_in & reg_data(7 downto 1);
                end if;
            end if;
        end if;
    end process;

    par_out <= reg_data;
end behavioral;
