----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/15/2025 11:21:02 AM
-- Design Name: 
-- Module Name: TB_Nanoprocessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY Nano_Processor_tb IS
END Nano_Processor_tb;

ARCHITECTURE behavior OF Nano_Processor_tb IS

    -- Component Declaration for the Unit Under Test (UUT)
    COMPONENT Nano_Processor
    PORT(
        Reset         : IN  std_logic;
        Clk_in        : IN  std_logic;
        Zero          : OUT std_logic;
        Overflow      : OUT std_logic;
        LED           : OUT std_logic_vector(3 downto 0);
        Display       : OUT std_logic_vector(6 downto 0);
        Anode         : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;

    -- Testbench signals
    SIGNAL Reset        : std_logic := '0';
    SIGNAL Clk_in       : std_logic := '0';
    SIGNAL Zero         : std_logic;
    SIGNAL Overflow     : std_logic;
    SIGNAL LED          : std_logic_vector(3 downto 0);
    SIGNAL Display      : std_logic_vector(6 downto 0);
    SIGNAL Anode        : std_logic_vector(3 downto 0);

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: Nano_Processor
    PORT MAP (
        Reset        => Reset,
        Clk_in       => Clk_in,
        Zero         => Zero,
        Overflow     => Overflow,
        LED          => LED,
        Display      => Display,
        Anode        => Anode
    );

process
begin
    Clk_in <= NOT Clk_in;
    wait for 3ns;
    end process;
    
process
begin
    Reset <='1';
    wait for 200ns;
    Reset <='0';
    wait;

end process;

END behavior;


