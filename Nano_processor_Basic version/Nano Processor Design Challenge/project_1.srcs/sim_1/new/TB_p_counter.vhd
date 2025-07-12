----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/14/2025 04:35:44 PM
-- Design Name: 
-- Module Name: TB_p_counter - Behavioral
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

entity p_counter_tb is
end p_counter_tb;

architecture behavior of p_counter_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component p_counter
        Port ( 
            Mux_Output : in STD_LOGIC_VECTOR (2 downto 0);
            Res        : in STD_LOGIC;
            Clk        : in STD_LOGIC;
            Q          : out STD_LOGIC_VECTOR (2 downto 0)
        );
    end component;

    -- Signals to connect to UUT
    signal Mux_Output : STD_LOGIC_VECTOR (2 downto 0) := (others => '0');
    signal Res        : STD_LOGIC := '0';
    signal Clk        : STD_LOGIC := '0';
    signal Q          : STD_LOGIC_VECTOR (2 downto 0);

    -- Clock period
    constant clk_period : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: p_counter
        port map (
            Mux_Output => Mux_Output,
            Res        => Res,
            Clk        => Clk,
            Q          => Q
        );

    -- Clock process definition
    clk_process : process
    begin
        Clk <= '0';
        wait for clk_period/2;
        Clk <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the counter
        Res <= '1';
        wait for clk_period;
        Res <= '0';
        
        -- Apply input and wait for rising clock edges
        Mux_Output <= "001";
        wait for clk_period;
        
        Mux_Output <= "011";
        wait for clk_period;
        
        Mux_Output <= "111";
        wait for clk_period;

        -- Activate reset again to observe behavior
        Res <= '1';
        wait for clk_period;
        Res <= '0';
        
        Mux_Output <= "101";
        wait for clk_period;

        wait;
    end process;

end behavior;