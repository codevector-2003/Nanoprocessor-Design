library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;  -- Required for 'unsigned'

entity Program_ROM is
    Port (
        Rom_IN  : IN  STD_LOGIC_VECTOR(2 downto 0);
        Rom_OUT : OUT STD_LOGIC_VECTOR(11 downto 0)
    );
end Program_ROM;

architecture Behavioral of Program_ROM is

    type rom_type is array (0 to 7) of STD_LOGIC_VECTOR(11 downto 0);
    signal programRom : rom_type := (
    
            --"101110000011", -- MOVI R7,3  ; Load value 3 into R7 (loop counter)
            --"100010000001", -- MOVI R1,1  ; Load immediate value 1 into R1
            --"010010000000", -- NEG R1     ; Negate R1 to get -1
            --"100100000011", -- MOVI R2,3  ; Load immediate value 3 into R2 (initial value)
            --"001110010000", -- ADD R7,R1  ; Subtract 1 from R2 (using ADD with negative value)
            --"001110100000", -- ADD R7,R2  ; Add R2 to accumulator in R7
            --"110100000110", -- JZR R2,6   ; Jump to address 6 if R2 is zero
            --"110000000100"  -- JZR R0,4   ; Jump to address 4 if R0 is zero (always true)

        "101110000001", -- MOVI R7, 1
        "100100000010", -- MOVI R2, 2
        "001110100000", -- ADD R7, R2
        "100110000011", -- MOVI R3, 3
        "001110110000", -- ADD R7, R3
        "110000000111", -- JZR R0, 7
        "110000000111", -- JZR R0, 7
        "110000000111" -- JZR R0, 7
    );

begin
    Rom_OUT <= programRom(to_integer(unsigned(Rom_IN)));

end Behavioral;