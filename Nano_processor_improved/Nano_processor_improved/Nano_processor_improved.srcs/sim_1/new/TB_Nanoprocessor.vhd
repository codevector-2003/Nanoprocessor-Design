library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Nano_Processor_tb is
end Nano_Processor_tb;

architecture Behavioral of Nano_Processor_tb is

    -- Component declaration
    component Nano_Processor
        Port (
            Reset : IN STD_LOGIC;
            Clk_in : IN STD_LOGIC;
            Zero : OUT STD_LOGIC;
            Overflow : OUT STD_LOGIC;
            LED : OUT STD_LOGIC_VECTOR(3 downto 0);
            Display : OUT STD_LOGIC_VECTOR(6 downto 0);
            Anode : OUT STD_LOGIC_VECTOR(3 downto 0);
            A_greater_than_B : OUT STD_LOGIC;
            A_equal_B : OUT STD_LOGIC;
            A_less_than_B : OUT STD_LOGIC;
            Overflow_Mul : OUT STD_LOGIC
        );
    end component;

    -- Signal declarations
    signal Clk_in         : STD_LOGIC := '1';
    signal Reset          : STD_LOGIC;
    signal Zero           : STD_LOGIC;
    signal Overflow       : STD_LOGIC;
    signal LED            : STD_LOGIC_VECTOR(3 downto 0);
    signal Display        : STD_LOGIC_VECTOR(6 downto 0);
    signal Anode          : STD_LOGIC_VECTOR(3 downto 0);
    signal A_greater_than_B : STD_LOGIC;
    signal A_equal_B      : STD_LOGIC;
    signal A_less_than_B  : STD_LOGIC;
    signal Overflow_Mul   : STD_LOGIC;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Nano_Processor
        port map (
            Reset => Reset,
            Clk_in => Clk_in,
            Zero => Zero,
            Overflow => Overflow,
            LED => LED,
            Display => Display,
            Anode => Anode,
            A_greater_than_B => A_greater_than_B,
            A_equal_B => A_equal_B,
            A_less_than_B => A_less_than_B,
            Overflow_Mul => Overflow_Mul
        );

    -- Clock generation process (period = 6ns)
    clk_process: process
    begin
        Clk_in <= NOT Clk_in;
        wait for 3 ns;
    end process;

    -- Reset pulse process
    reset_process: process
    begin
        Reset <= '1';
        wait for 200 ns;
        Reset <= '0';
        wait;
    end process;

end Behavioral;
