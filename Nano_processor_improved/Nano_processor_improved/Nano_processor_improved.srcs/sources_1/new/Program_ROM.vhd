library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Required for 'unsigned'

entity Program_ROM is
    Port (
        Rom_IN  : IN  STD_LOGIC_VECTOR(2 downto 0);
        Rom_OUT : OUT STD_LOGIC_VECTOR(12 downto 0)
    );
end Program_ROM;

architecture Behavioral of Program_ROM is

    type rom_type is array (0 to 7) of STD_LOGIC_VECTOR(12 downto 0);
    signal programRom : rom_type := (
        "0101110000011", -- MOVI R7, 3       --mov 010, add 000, mul --101 comp 100 neg- 001
        "0100100000100", -- MOVI R2, 4
        "0001110100000", -- add R7, R2    answer = 7
        "0001110100000", -- add R7, R2    answer = 11 = b
        "1011110100000", -- MUL R7, R2    answer =?00101100? = out of them last 4 digits => 1100 = 12 = c
        "1111110000100", -- SFT R7, RIGHT answer  1100 => right shift --> 0110 = 6
        "0001110100000", -- ADD R7, R2    answer   6+4 =10 = a
        "0110000000111" -- JZR R0, 7
    );

begin
    Rom_OUT <= programRom(to_integer(unsigned(Rom_IN)));

end Behavioral;