library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_MUX_2_way_4_bits is
-- Testbench has no ports
end tb_MUX_2_way_4_bits;

architecture behavior of tb_MUX_2_way_4_bits is

    -- Component Declaration for the Unit Under Test (UUT)
    component MUX_2_way_4_bits
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
               B : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC;
               EN : in STD_LOGIC;
               Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;

    -- Signals for connecting to UUT
    signal A     : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal B     : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal Sel   : STD_LOGIC := '0';
    signal EN    : STD_LOGIC := '0';
    signal Y     : STD_LOGIC_VECTOR (3 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: MUX_2_way_4_bits Port Map (
          A => A,
          B => B,
          Sel => Sel,
          EN => EN,
          Y => Y
        );

    -- Stimulus Process
    stim_proc: process
    begin		
        -- Test case 1: Enable LOW, should output zeros
        A <= "1010";
        B <= "0101";
        Sel <= '0';
        EN <= '0';
        wait for 10 ns;

        -- Test case 2: Enable HIGH, Sel = 0 => output A
        EN <= '1';
        Sel <= '0';
        wait for 10 ns;

        -- Test case 3: Enable HIGH, Sel = 1 => output B
        Sel <= '1';
        wait for 10 ns;

        -- Test case 4: Change A and B again
        A <= "1111";
        B <= "0000";
        Sel <= '0';
        wait for 10 ns;

        Sel <= '1';
        wait for 10 ns;

        -- End of test
        wait;
    end process;

end behavior;
