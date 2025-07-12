----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025
-- Design Name: Test Bench for Three-Bit Adder
-- Module Name: TB_T_bit_Adder - Simulation
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Test bench for verification of the Three-Bit Adder
-- 
-- Dependencies: T_bit_Adder.vhd
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_T_bit_Adder is
-- No ports for a test bench
end TB_T_bit_Adder;

architecture Simulation of TB_T_bit_Adder is
    -- Component declaration for the Unit Under Test (UUT)
    component T_bit_Adder
        Port (
            A      : in  STD_LOGIC_VECTOR(2 downto 0);
            B      : in  STD_LOGIC_VECTOR(2 downto 0);
            Sum    : out STD_LOGIC_VECTOR(2 downto 0);
            Carry  : out STD_LOGIC
        );
    end component;
    
    -- Inputs
    signal A      : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    signal B      : STD_LOGIC_VECTOR(2 downto 0) := (others => '0');
    
    -- Outputs
    signal Sum    : STD_LOGIC_VECTOR(2 downto 0);
    signal Carry  : STD_LOGIC;
    
begin
    -- Instantiate the Unit Under Test (UUT)
    UUT: T_bit_Adder port map (
        A      => A,
        B      => B,
        Sum    => Sum,
        Carry  => Carry
    );
    
    -- Stimulus process
    stim_proc: process
    begin
        -- Hold reset state for 100 ns
        wait for 100 ns;
        
        -- Test various input combinations
        -- Test case 1: A=0, B=0
        A <= "000";
        B <= "000";
        wait for 20 ns;
        
        -- Test case 2: A=1, B=1
        A <= "001";
        B <= "001";
        wait for 20 ns;
        
        -- Test case 3: A=2, B=3
        A <= "010";
        B <= "011";
        wait for 20 ns;
        
        -- Test case 4: A=3, B=3
        A <= "011";
        B <= "011";
        wait for 20 ns;
        
        -- Test case 5: A=4, B=4
        A <= "100";
        B <= "100";
        wait for 20 ns;
        
        -- Test case 6: A=5, B=5
        A <= "101";
        B <= "101";
        wait for 20 ns;
        
        -- Test case 7: A=6, B=6
        A <= "110";
        B <= "110";
        wait for 20 ns;
        
        -- Test case 8: A=7, B=7 (maximum values)
        A <= "111";
        B <= "111";
        wait for 20 ns;
        
        -- Test case 9: A=3, B=5
        A <= "011";
        B <= "101";
        wait for 20 ns;
        
        -- Test case 10: A=2, B=1
        A <= "010";
        B <= "001";
        wait for 20 ns;
        
        -- End simulation
        wait;
    end process;
end Simulation;