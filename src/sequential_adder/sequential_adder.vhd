library ieee;
use ieee.std_logic_1164.all;

entity sequential_adder is
    port (
        clk   : in std_logic;
        rst   : in std_logic;
        load  : in std_logic;
        shift : in std_logic;
        a     : in std_logic_vector(7 downto 0);
        b     : in std_logic_vector(7 downto 0);
        y     : out std_logic_vector(7 downto 0)
    );
end sequential_adder;

architecture behavioral of sequential_adder is
    component piso is
        port (
            clk     : in std_logic;
            rst     : in std_logic;
            par_in  : in std_logic_vector(7 downto 0);
            load    : in std_logic;
            shift   : in std_logic;
            ser_out : out std_logic
        );
    end component;

    component sipo is
        port (
            clk     : in std_logic;
            rst     : in std_logic;
            ser_in  : in std_logic;
            shift   : in std_logic;
            par_out : out std_logic_vector(7 downto 0)
        );
    end component;

    component full_adder is
        port (
            a     : in std_logic;
            b     : in std_logic;
            c_in  : in std_logic;
            y     : out std_logic;
            c_out : out std_logic
        );
    end component;

    component d_flipflop is
        port (
            clk   : in std_logic;
            rst   : in std_logic;
            d     : in std_logic;
            en    : in std_logic;
            clear : in std_logic;
            q     : out std_logic
        );
    end component;

    signal ser_out_a : std_logic;
    signal ser_out_b : std_logic;

    signal c_in_t    : std_logic;
    signal c_out_t   : std_logic;

    signal ser_in_y  : std_logic;
begin
    piso_a : piso port map (clk => clk, rst => rst, par_in => a, load => load, shift => shift, ser_out => ser_out_a);
    piso_a : piso port map (clk => clk, rst => rst, par_in => b, load => load, shift => shift, ser_out => ser_out_b);

    fa     : full_adder port map (a => ser_out_a, b => ser_out_b, c_in => c_in_t, y => ser_in_y, c_out => c_out_t);

    dff    : d_flipflop port map (clk => clk, rst => rst, d => c_out_t, en => shift, clear => load, q => c_in_t);

    sipo_y : sipo port map (clk => clk, rst => rst, ser_in => ser_in_y, shift => shift, par_out => y);
end behavioral;
