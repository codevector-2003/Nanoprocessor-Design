library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Seven_Segment_tb is
end Seven_Segment_tb;

architecture behavior of Seven_Segment_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Seven_Segment
        Port ( 
            address : in STD_LOGIC_VECTOR (3 downto 0);
            data : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal address : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
    signal data : STD_LOGIC_VECTOR(6 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Seven_Segment
        Port map (
            address => address,
            data => data
        );

    -- Stimulus Process
    stim_proc: process
    begin
        -- Iterate through all 16 input values from 0 to F
        for i in 0 to 15 loop
            address <= std_logic_vector(to_unsigned(i, 4));
            wait for 10 ns;
        end loop;

        wait;
    end process;

end behavior;
