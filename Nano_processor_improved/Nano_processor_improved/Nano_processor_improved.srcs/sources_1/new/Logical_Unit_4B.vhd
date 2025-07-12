library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Logical_Unit_4B is
    Port (
        A         : in  STD_LOGIC_VECTOR (3 downto 0);
        B         : in  STD_LOGIC_VECTOR (3 downto 0);
        LU_EN     : in  STD_LOGIC;
        LU_Op_Select : in  STD_LOGIC_VECTOR (1 downto 0);
        Out_Result : out STD_LOGIC_VECTOR (3 downto 0)
    );
end Logical_Unit_4B;

architecture Behavioral of Logical_Unit_4B is
    signal AND_Result : STD_LOGIC_VECTOR(3 downto 0);
    signal OR_Result  : STD_LOGIC_VECTOR(3 downto 0);
    signal XOR_Result : STD_LOGIC_VECTOR(3 downto 0);
    signal Result     : STD_LOGIC_VECTOR(3 downto 0);

begin
    -- Logical Operations
    AND_Result <= A and B;
    OR_Result  <= A or B;
    XOR_Result <= A xor B;

    -- Select the operation based on LU_Op_Select
    process(LU_Op_Select, AND_Result, OR_Result, XOR_Result)
    begin
        case LU_Op_Select is
            when "00" => Result <= AND_Result;
            when "01" => Result <= OR_Result;
            when "10" => Result <= XOR_Result;
            when others => Result <= (others => '0');
        end case;
    end process;

    -- Apply Enable Signal
    Out_Result <= Result when LU_EN = '1' else (others => '0');

end Behavioral;
