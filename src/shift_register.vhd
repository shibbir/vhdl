library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port (
        clock            : in std_logic;
        reset            : in std_logic;
        shift_enabled    : in std_logic;
        parallel_enabled : in std_logic;

        parallel_in      : in std_logic_vector(7 downto 0);
        parallel_out     : out std_logic_vector(7 downto 0);

        serial_in        : in std_logic;
        serial_out       : out std_logic
    );
end shift_register;

architecture behavioral of shift_register is
    signal reg : std_logic_vector(7 downto 0);
begin
    process (clock, reset, parallel_enabled, shift_enabled)
    begin
        if reset = '1' then -- Async reset, because the reset does not check whether we have the rising edge
            reg <= (others => '0');
        else
            if rising_edge(clock) then
                if parallel_enabled = '1' then
                    reg <= parallel_in;
                else
                    if shift_enabled = '1' then
                        reg <= serial_in & reg(7 downto 1);
                    end if;
                end if;
            end if;
        end if;
    end process;

    parallel_out <= reg;
    serial_out <= reg(0);
end behavioral;
