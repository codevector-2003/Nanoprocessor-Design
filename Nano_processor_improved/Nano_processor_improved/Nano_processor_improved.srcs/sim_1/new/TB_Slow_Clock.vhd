----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 03:12:07 PM
-- Design Name: 
-- Module Name: TB_Slow_Clock - Behavioral
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

entity Slow_Clk_Sim is
-- Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is

COMPONENT Slow_Clk
    PORT (Clk_in :IN STD_LOGIC := '0';
    Clk_out :OUT STD_LOGIC);
end COMPONENT;

signal Clk_in : STD_LOGIC := '0';
signal Clk_out : STD_LOGIC;

begin
clock_process: process
    begin
        Clk_in <= NOT(Clk_in);
        wait for 5ns;
    end process;
    
UUT: Slow_Clk PORT MAP(
Clk_in => Clk_in,
Clk_out => Clk_out );

end Behavioral;
