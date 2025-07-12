----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2025 09:09:49 PM
-- Design Name: 
-- Module Name: Adder_Substractor_tb - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Adder_Substractor_tb is
--  Port ( );
end Adder_Substractor_tb;

architecture Behavioral of Adder_Substractor_tb is

component Adder_Substractor
        PORT(
            A: IN STD_LOGIC_VECTOR(3 downto 0);
            B: IN STD_LOGIC_VECTOR(3 downto 0);
            EN:IN STD_LOGIC;
            Ca_out:OUT STD_LOGIC;
            V: OUT STD_LOGIC;
            D: OUT STD_LOGIC_VECTOR(3 downto 0)
        );
end component;

signal A_tb, B_tb, D_tb : STD_LOGIC_VECTOR(3 downto 0);
signal EN_tb, Ca_out_tb,V_tb : STD_LOGIC; 

begin
    uut: Adder_Substractor port map (
        A => A_tb,
        B => B_tb,
        EN => EN_tb,
        Ca_out => Ca_out_tb,
        D => D_tb,
        V=>V_tb
    );
    
    
    stim_proc: process
    begin
        -- Test 1: Addition  0101 + 0011 = 1000
        A_tb <= "0101";
        B_tb <= "0011";
        EN_tb <= '0'; -- Addition
        wait for 10 ns;

        -- Test 2: Subtraction 0101 - 0011 = 0010
        A_tb <= "0101";
        B_tb <= "0011";
        EN_tb <= '1'; -- Subtraction
        wait for 10 ns;

        -- Test 3: 1111 + 0001 = 0000 with carry out
        A_tb <= "1111";
        B_tb <= "0001";
        EN_tb <= '0'; -- Addition
        wait for 10 ns;

        -- Test 4: 0010 - 0100 = 1110 (underflow)
        A_tb <= "0010";
        B_tb <= "0100";
        EN_tb <= '1'; -- Subtraction
        wait for 10 ns;
        
        -- Test 5: 0111 - 0001 = 1111 (overflow)
        A_tb <= "0111";
        B_tb <= "0001";
        EN_tb <= '0'; -- Addition
        wait for 10 ns;
        

        -- Finish simulation
        wait;
    end process;

end Behavioral;
