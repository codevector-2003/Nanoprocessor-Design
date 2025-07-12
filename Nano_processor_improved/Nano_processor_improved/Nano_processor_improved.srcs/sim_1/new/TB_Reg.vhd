----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 04:56:16 PM
-- Design Name: 
-- Module Name: TB_Reg - Behavioral
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Reg_tb is
end Reg_tb;

architecture behavior of Reg_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component Reg
        Port (
            D   : in  STD_LOGIC_VECTOR (3 downto 0);
            En  : in  STD_LOGIC;
            Clk : in  STD_LOGIC;
            Q   : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Testbench signals
    signal D   : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal En  : STD_LOGIC := '0';
    signal Clk : STD_LOGIC := '0';
    signal Q   : STD_LOGIC_VECTOR (3 downto 0);

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    uut: Reg
        port map (
            D   => D,
            En  => En,
            Clk => Clk,
            Q   => Q
        );

    -- Clock process
    clk_process : process
    begin
        while true loop
            Clk <= '0';
            wait for clk_period / 2;
            Clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Initial reset

        -- Load 1010 with Enable
        D <= "1010";
        En <= '1';
        wait for clk_period;

        -- Change input but disable loading
        D <= "1111";
        En <= '0';
        wait for clk_period;

        -- Enable and load 0101
        D <= "0101";
        En <= '1';
        wait for clk_period;

 
        -- Load 1100
        D <= "1100";
        En <= '1';
        wait for clk_period;

        wait;
    end process;

end behavior;
