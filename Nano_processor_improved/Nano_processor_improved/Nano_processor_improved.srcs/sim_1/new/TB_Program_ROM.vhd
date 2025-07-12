----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 04:04:24 PM
-- Design Name: 
-- Module Name: Program_ROM_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for the Program_ROM module with 13-bit instructions
--
-- Dependencies: Program_ROM.vhd
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Program_ROM_tb is
end Program_ROM_tb;

architecture Behavioral of Program_ROM_tb is

    -- Component declaration of the UUT
    component Program_ROM is
        Port (
            Rom_IN  : in  STD_LOGIC_VECTOR(2 downto 0);
            Rom_OUT : out STD_LOGIC_VECTOR(12 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal Rom_IN  : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal Rom_OUT : STD_LOGIC_VECTOR(12 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Program_ROM
        port map (
            Rom_IN  => Rom_IN,
            Rom_OUT => Rom_OUT
        );

    -- Stimulus process
    stim_proc: process
    begin
        -- Iterate through all possible addresses
        for i in 0 to 7 loop
            Rom_IN <= std_logic_vector(to_unsigned(i, 3));  -- Apply address
            wait for 10 ns;                                -- Wait for output to settle
        end loop;
        wait;  -- End of simulation
    end process;

end Behavioral;
