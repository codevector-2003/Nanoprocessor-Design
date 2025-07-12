----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 09:58:10 PM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 04:59:54 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Reg_Bank_tb is
-- Testbenches do not need ports
end Reg_Bank_tb;

architecture behavior of Reg_Bank_tb is

    -- Component Declaration
    component Reg_Bank
        Port (
            reg_en : IN STD_LOGIC_VECTOR(2 downto 0);
            val_in : IN STD_LOGIC_VECTOR(3 downto 0);
            clk_in : IN STD_LOGIC;
            res    : IN STD_LOGIC;

            R_0 : out STD_LOGIC_VECTOR (3 downto 0);
            R_1 : out STD_LOGIC_VECTOR (3 downto 0);
            R_2 : out STD_LOGIC_VECTOR (3 downto 0);
            R_3 : out STD_LOGIC_VECTOR (3 downto 0);
            R_4 : out STD_LOGIC_VECTOR (3 downto 0);
            R_5 : out STD_LOGIC_VECTOR (3 downto 0);
            R_6 : out STD_LOGIC_VECTOR (3 downto 0);
            R_7 : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    -- Testbench signals
    signal reg_en_tb  : STD_LOGIC_VECTOR(2 downto 0);
    signal val_in_tb  : STD_LOGIC_VECTOR(3 downto 0);
    signal clk_in_tb  : STD_LOGIC := '0';
    signal res_tb     : STD_LOGIC := '1';

    signal R0_tb, R1_tb, R2_tb, R3_tb, R4_tb, R5_tb, R6_tb, R7_tb : STD_LOGIC_VECTOR(3 downto 0);

    -- Clock generation process
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: Reg_Bank PORT MAP (
        reg_en => reg_en_tb,
        val_in => val_in_tb,
        clk_in => clk_in_tb,
        res    => res_tb,

        R_0 => R0_tb,
        R_1 => R1_tb,
        R_2 => R2_tb,
        R_3 => R3_tb,
        R_4 => R4_tb,
        R_5 => R5_tb,
        R_6 => R6_tb,
        R_7 => R7_tb
    );

    -- Clock process
    clk_process :process
    begin
        while true loop
            clk_in_tb <= '0';
            wait for clk_period/2;
            clk_in_tb <= '1';
            wait for clk_period/2;
        end loop;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Apply reset
        wait for 20 ns;
        res_tb <= '0';  -- Deassert reset

        -- Write "1010" to R0
        reg_en_tb <= "000";
        val_in_tb <= "1010";
        wait for clk_period;

        -- Write "1100" to R3
        reg_en_tb <= "011";
        val_in_tb <= "1100";
        wait for clk_period;

        -- Write "1111" to R7
        reg_en_tb <= "111";
        val_in_tb <= "1111";
        wait for clk_period;

        -- Wait and observe
        wait for 30 ns;

        -- Assert reset to clear all registers
        res_tb <= '1';
        wait for clk_period;
        res_tb <= '0';

        -- Final delay to observe cleared outputs
        wait for 30 ns;

        -- End simulation
        wait;
    end process;

end behavior;

