library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Logical_Unit is
end TB_Logical_Unit;

architecture Behavioral of TB_Logical_Unit is

    -- Component declaration for the DUT (Design Under Test)
    component Logical_Unit_4B is
        Port (
            A         : in  STD_LOGIC_VECTOR (3 downto 0);
            B         : in  STD_LOGIC_VECTOR (3 downto 0);
            LU_EN     : in  STD_LOGIC;
            LU_Op_Select : in  STD_LOGIC_VECTOR (1 downto 0);
            Out_Result : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Signals for the testbench
    signal A        : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B        : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal LU_EN    : STD_LOGIC := '0';
    signal LU_Op_Select : STD_LOGIC_VECTOR(1 downto 0) := "00";
    signal Out_Result : STD_LOGIC_VECTOR(3 downto 0);

begin

    -- Instantiate the DUT
    DUT: Logical_Unit_4B
        port map(
            A => A,
            B => B,
            LU_EN => LU_EN,
            LU_Op_Select => LU_Op_Select,
            Out_Result => Out_Result
        );

    -- Stimulus process
    stimulus_proc: process
    begin
        -- Test case 1: AND Operation with Enable = 1
        A <= "1101"; B <= "1010"; LU_EN <= '1'; LU_Op_Select <= "00";
        wait for 100 ns;

        -- Test case 2: OR Operation
        LU_Op_Select <= "01";
        wait for 100 ns;

        -- Test case 3: XOR Operation
        LU_Op_Select <= "10";
        wait for 100 ns;

        -- Test case 4: Disable Output
        LU_EN <= '0';
        wait for 100 ns;

        -- Test case 5: Enable and AND Operation again
        LU_EN <= '1'; LU_Op_Select <= "00";
        wait for 100 ns;

        wait;
    end process;

end Behavioral;
