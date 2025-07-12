library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Multiplier_4 is
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is
    -- Component declaration for the DUT (Design Under Test)
    component Multiplier_4 is
        Port (
            A : in STD_LOGIC_VECTOR (3 downto 0);
            B : in STD_LOGIC_VECTOR (3 downto 0);
            Y : out STD_LOGIC_VECTOR (3 downto 0);
            Overflow : out std_logic;
            Mul_EN : in STD_LOGIC
        );
    end component;

    -- Signals for stimulus generation
    signal A       : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal B       : STD_LOGIC_VECTOR(3 downto 0) := "0000";
    signal Y       : STD_LOGIC_VECTOR(3 downto 0);
    signal Overflow: std_logic;
    signal Mul_EN  : std_logic := '0';

begin
    -- Instantiate the DUT
    DUT: Multiplier_4
        port map (
            A => A,
            B => B,
            Y => Y,
            Overflow => Overflow,
            Mul_EN => Mul_EN
        );

    -- Stimulus process
    stimulus_proc: process
    begin
        -- Test case 1: Multiplication Disabled
        A <= "0010";
        B <= "0010";
        Mul_EN <= '0';
        wait for 100 ns;

        -- Test case 2: Multiplication Enabled
        Mul_EN <= '1';
        wait for 100 ns;

        -- Test case 3: Another Multiplication
        A <= "0011";
        B <= "0001";
        wait for 100 ns;

        -- Test case 4: Overflow Scenario
        A <= "1111";
        B <= "1111";
        wait for 100 ns;

        -- Test case 5: Multiplication Disabled
        Mul_EN <= '0';
        A <= "1010";
        B <= "1010";
        wait for 100 ns;

        -- End of test cases
        wait;
    end process stimulus_proc;

end Behavioral;
