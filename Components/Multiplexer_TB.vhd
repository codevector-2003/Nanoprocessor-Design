----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2025 11:39:19 AM
-- Design Name: 
-- Module Name: Multiplexer_TB - Behavioral
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

entity Multiplexer_TB is
--  Port ( );
end Multiplexer_TB;

architecture Behavioral of Multiplexer_TB is
    component Multiplexer
        Port (
            A   : in  STD_LOGIC_VECTOR(2 downto 0);
            B   : in  STD_LOGIC_VECTOR(2 downto 0);
            EN  : in  STD_LOGIC;
            Sel : in  STD_LOGIC;
            Output   : out STD_LOGIC_VECTOR(2 downto 0)
        );
    end component;
    
    signal A   : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal B   : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal EN  : STD_LOGIC := '0';
    signal Sel : STD_LOGIC := '0';
    signal Output   : STD_LOGIC_VECTOR(2 downto 0);

begin
    UUT: Multiplexer port map (
        A => A,
        B => B,
        EN => EN,
        Sel => Sel,
        Output => Output
    );
    process
        begin

            A <= "101";
            B <= "010";
            EN <= '0';
            Sel <= '0';
            wait for 100 ns;
            
            A <= "110";
            B <= "011";
            EN <= '1';
            Sel <= '1';
            wait for 100 ns;

            A <= "111";
            B <= "000";
            EN <= '1';
            Sel <= '0';
            wait for 100 ns;
            
            A <= "011";
            B <= "010";
            EN <= '0';
            Sel <= '1';
            wait for 100 ns;
           
            A <= "100";
            B <= "010";
            EN <= '0';
            Sel <= '0';
            wait for 100 ns;

            A <= "101";
            B <= "110";
            EN <= '1';
            Sel <= '1';
            wait for 100 ns;
    
        wait;
    end process;

end Behavioral;
