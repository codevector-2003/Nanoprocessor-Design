----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/17/2025 12:06:55 PM
-- Design Name: 
-- Module Name: Comparator_TB - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: Testbench for comparator with Cmp_EN signal
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_TB is
end Comparator_TB;

architecture Behavioral of Comparator_TB is

    component comparator
        Port (
            A        : in  STD_LOGIC_VECTOR (3 downto 0);
            B        : in  STD_LOGIC_VECTOR (3 downto 0);
            Cmp_EN   : in  STD_LOGIC;
            A_greater_B : out STD_LOGIC;
            A_equal_B   : out STD_LOGIC;
            A_lesser_B  : out STD_LOGIC
        );
    end component;

    signal A, B      : STD_LOGIC_VECTOR (3 downto 0);
    signal Cmp_EN    : STD_LOGIC;
    signal A_greater_B : STD_LOGIC;
    signal A_equal_B   : STD_LOGIC;
    signal A_lesser_B  : STD_LOGIC;

begin

    uut: comparator 
        Port Map (
            A => A,
            B => B,
            Cmp_EN => Cmp_EN,
            A_greater_B => A_greater_B,
            A_equal_B => A_equal_B,
            A_lesser_B => A_lesser_B
        );

    -- Test Process
    process
    begin
        -- Test when Cmp_EN is '0'
        Cmp_EN <= '0';
        A <= "0001"; B <= "0010"; wait for 50 ns;
        A <= "0100"; B <= "0100"; wait for 50 ns;
        A <= "1111"; B <= "0000"; wait for 50 ns;

        -- Test when Cmp_EN is '1'
        Cmp_EN <= '1';
        A <= "0000"; B <= "0000"; wait for 50 ns;
        A <= "0001"; B <= "0000"; wait for 50 ns;
        A <= "0000"; B <= "0001"; wait for 50 ns;
        Cmp_EN <= '0';
        A <= "0010"; B <= "0001"; wait for 50 ns;
        A <= "0011"; B <= "0100"; wait for 50 ns;
        A <= "0101"; B <= "0101"; wait for 50 ns;
        Cmp_EN <= '1';
        A <= "0110"; B <= "0111"; wait for 50 ns;
        A <= "0111"; B <= "0110"; wait for 50 ns;
        A <= "1000"; B <= "1000"; wait for 50 ns;
        Cmp_EN <= '0';
        A <= "1001"; B <= "1010"; wait for 50 ns;
        A <= "1100"; B <= "1100"; wait for 50 ns;
        A <= "1111"; B <= "1110"; wait for 50 ns;
        Cmp_EN <= '1';
        A <= "1110"; B <= "1111"; wait for 50 ns;
        A <= "1010"; B <= "0101"; wait for 50 ns;
        A <= "0100"; B <= "1010"; wait for 50 ns;
        Cmp_EN <= '0';
        A <= "1101"; B <= "1101"; wait for 50 ns;
        A <= "0000"; B <= "1111"; wait for 50 ns;
        A <= "1111"; B <= "0000"; wait for 50 ns;
        Cmp_EN <= '1';
        A <= "0110"; B <= "0110"; wait for 50 ns;
        A <= "1001"; B <= "1001"; wait for 50 ns;

        wait;
    end process;

end Behavioral;
