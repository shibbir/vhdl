library ieee;
use ieee.std_logic_1164.all;

entity elevator is
    port (
        clock   : in std_logic;
        reset   : in std_logic;

        bt_f1   : in std_logic;
        bt_f2   : in std_logic;
        bt_f3   : in std_logic;

        arvd_f1 : in std_logic;
        arvd_f2 : in std_logic;
        arvd_f3 : in std_logic;

        led_f1  : out std_logic;
        led_f2  : out std_logic;
        led_f3  : out std_logic;

        dr_up   : out std_logic;
        dr_down : out std_logic
    );
end elevator;

architecture behavioral of elevator is
    type state_type is (ON_F1, ON_F2, ON_F3, F1_TO_F2, F3_TO_F2, TO_F1, TO_F3);

    signal current_state_type : state_type;
    signal next_state_type    : state_type;
begin
    P_S: process (clock, reset)
    begin
        if (reset = '1') then
            current_state_type <= ON_F1;
        elsif clock'event and clock = '1' then
            current_state_type <= next_state_type;
        end if;
    end process;

    P_G: process (current_state_type, bt_f1, bt_f2, bt_f3, arvd_f1, arvd_f2, arvd_f3)
    begin
        case current_state_type is
            when ON_F1    => if     (bt_f2 = '1') then next_state_type <= F1_TO_F2;
                             elsif  (bt_f3 = '1') then next_state_type <= TO_F3;
                             else                      next_state_type <= ON_F1;
                             end if;
            when ON_F2    => if     (bt_f1 = '1') then next_state_type <= TO_F1;
                             elsif  (bt_f3 = '1') then next_state_type <= TO_F3;
                             else                      next_state_type <= ON_F2;
                             end if;
            when ON_F3    => if     (bt_f1 = '1') then next_state_type <= TO_F1;
                             elsif  (bt_f2 = '1') then next_state_type <= F3_TO_F2;
                             else                      next_state_type <= ON_F3;
                             end if;
            when F1_TO_F2 => if     (arvd_f2 = '1') then next_state_type <= ON_F2;
                             else                        next_state_type <= F1_TO_F2;
                             end if;
            when F3_TO_F2 => if     (arvd_f2 = '1') then next_state_type <= ON_F2;
                             else                        next_state_type <= F3_TO_F2;
                             end if;
            when TO_F1    => if     (arvd_f1 = '1') then next_state_type <= ON_F1;
                             else                        next_state_type <= TO_F1;
                             end if;
            when TO_F3    => if     (arvd_f3 = '1') then next_state_type <= ON_F3;
                             else                        next_state_type <= TO_F3;
                             end if;
            when others   => next_state_type <= ON_F1;
        end case;
    end process;

    P_F: process (current_state)
    begin
        led_f1 = '0';
        led_f2 = '0';
        led_f3 = '0';

        dr_up <= '0';
        dr_down <= '0';

        case current_state_type is
            when ON_F1    => led_f1  <= '1';
            when ON_F2    => led_f2  <= '1';
            when ON_F3    => led_f3  <= '1';
            when F1_TO_F2 => dr_up   <= '1';
            when F3_TO_F2 => dr_down <= '1';
            when TO_F1    => dr_down <= '1';
            when TO_F3    => dr_up   <= '1';
            when others   => null;
        end case;
    end process;
end behavioral;
