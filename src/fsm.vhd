library ieee;
use ieee.std_logic_1164.all;

entity fsm is
    port (
        clock : in std_logic;
        reset : in std_logic;

        x1    : in std_logic;
        x2    : in std_logic;
        y     : out std_logic
    );
end fsm;

architecture behavioral of fsm is
    type state_type is (S1, S2);

    signal current_state, next_state : state_type;
begin
    P_G: process (current_state, x1, x2)
    begin
        case current_state is
            when S1     => if (x1 = '1') then next_state <= S2;
                           else               next_state <= S1;
                           end if;
            when S2     => if (x2 = '1') then next_state <= S1;
                           else               next_state <= S2;
                           end if;
            when others => next_state <= S1;
        end case;
    end process;

    P_F: process (current_state)
    begin
        case current_state is
            when S1     => y <= '1';
            when S2     => y <= '0';
            when others => y <= '0';
        end case;
    end process;

    P_S: process (clock, reset)
    begin
        if (reset = '1') then
            current_state <= S1;
        elsif clock'event and clock = '1' then
            current_state <= next_state;
        end if;
    end process;
end behavioral;

--------------------------
       |     Inputs      |
--------------------------
States |   X1   |   X2   |
--------------------------
S1     | S2/Y=0 |   -    |
--------------------------
S2     |   -    | S1/Y=1 |
--------------------------
