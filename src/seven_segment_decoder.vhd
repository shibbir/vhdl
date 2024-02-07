library ieee;
use ieee.std_logic_1164.all;

entity seven_segment_decoder is
    port (
        input  : in std_logic_vector(3 downto 0);
        output : out std_logic_vector(0 to 6)
    );
end seven_segment_decoder;

architecture behavioral of seven_segment_decoder is
begin
    output <= "1111110" when input = "0000" else
              "0110000" when input = "0001" else
              "1101101" when input = "0010" else
              "1111001" when input = "0011" else
              "0110011" when input = "0100" else
              "1011011" when input = "0101" else
              "1011111" when input = "0110" else
              "1110000" when input = "0111" else
              "1111111" when input = "1000" else
              "1111011" when input = "1001" else
              "1110111" when input = "1010" else
              "0011111" when input = "1011" else
              "1001110" when input = "1100" else
              "0111101" when input = "1101" else
              "1001111" when input = "1110" else
              "1000111" when input = "1111" else
              "0000000";
end behavioral;

---------------------------------------
| Segment | a | b | c | d | e | f | g |
---------------------------------------
|    0    | 1 | 1 | 1 | 1 | 1 | 1 | 0 |
|    1    | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
|    2    | 1 | 1 | 0 | 1 | 1 | 0 | 1 |
|    3    | 1 | 1 | 1 | 1 | 0 | 0 | 1 |
|    4    | 0 | 1 | 1 | 0 | 0 | 1 | 1 |
|    5    | 1 | 0 | 1 | 1 | 0 | 1 | 1 |
|    6    | 1 | 0 | 1 | 1 | 1 | 1 | 1 |
|    7    | 1 | 1 | 1 | 0 | 0 | 0 | 0 |
|    8    | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
|    9    | 1 | 1 | 1 | 1 | 0 | 1 | 1 |
|    A    | 1 | 1 | 1 | 0 | 1 | 1 | 1 |
|    B    | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
|    C    | 1 | 0 | 0 | 1 | 1 | 1 | 0 |
|    D    | 0 | 1 | 1 | 1 | 1 | 0 | 1 |
|    E    | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
|    F    | 1 | 0 | 0 | 0 | 1 | 1 | 1 |
---------------------------------------
