----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2025 08:56:18 PM
-- Design Name: 
-- Module Name: TB_Mux_8way_4bit - Behavioral
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

entity TB_Mux_8way_4bit is
--  Port ( );
end TB_Mux_8way_4bit;

architecture Behavioral of TB_Mux_8way_4bit is
component Mux_8way_4bit
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           D2 : in STD_LOGIC_VECTOR (3 downto 0);
           D3 : in STD_LOGIC_VECTOR (3 downto 0);
           D4 : in STD_LOGIC_VECTOR (3 downto 0);
           D5 : in STD_LOGIC_VECTOR (3 downto 0);
           D6 : in STD_LOGIC_VECTOR (3 downto 0);
           D7 : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal D0 : STD_LOGIC_VECTOR (3 downto 0);
signal D1 : STD_LOGIC_VECTOR (3 downto 0);
signal D2 : STD_LOGIC_VECTOR (3 downto 0);
signal D3 : STD_LOGIC_VECTOR (3 downto 0);
signal D4 : STD_LOGIC_VECTOR (3 downto 0);
signal D5 : STD_LOGIC_VECTOR (3 downto 0);
signal D6 : STD_LOGIC_VECTOR (3 downto 0);
signal D7 : STD_LOGIC_VECTOR (3 downto 0);
signal EN : STD_LOGIC;
signal S : STD_LOGIC_VECTOR (2 downto 0);
signal Y : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT : Mux_8way_4bit
    port map (
        D0 => D0,
        D1 => D1,
        D2 => D2,
        D3 => D3,
        D4 => D4,
        D5 => D5,
        D6 => D6,
        D7 => D7,
        EN => EN,
        S => S,
        Y => Y
    );

process
begin
    EN <= '1';
    D0 <= "0000";
    D1 <= "0001";
    D2 <= "0010";
    D3 <= "0011";
    D4 <= "0100";
    D5 <= "0101";
    D6 <= "0110";
    D7 <= "0111";
    
    S <= "000";
    wait for 20ns;
    
    S <= "001";
    wait for 20ns;
    
    S <= "010";
    wait for 20ns;
    
    S <= "011";
    wait for 20ns;
       
    S <= "100";
    wait for 20ns;
    
    S <= "101";
    wait for 20ns;
    
    S <= "110";
    wait for 20ns;
    
    EN <= '0';
    D0 <= "0010";
    D1 <= "0001";
    D2 <= "0110";
    D3 <= "1111";
    D4 <= "0100";
    D5 <= "0111";
    D6 <= "0000";
    D7 <= "0111";
    
    S <= "000";
    wait for 20ns;
    
    S <= "001";
    wait for 20ns;
    
    S <= "010";
    wait for 20ns;
    
    S <= "011";
    wait for 20ns;
       
    S <= "100";
    wait for 20ns;
    
    S <= "101";
    wait for 20ns;
    
    S <= "110";
    wait for 20ns;
    
    EN <= '1';
    D0 <= "0111";
    D1 <= "0001";
    D2 <= "0110";
    D3 <= "1111";
    D4 <= "0100";
    D5 <= "0101";
    D6 <= "0000";
    D7 <= "0010";
    
    S <= "000";
    wait for 20ns;
    
    S <= "001";
    wait for 20ns;
    
    S <= "010";
    wait for 20ns;
    
    S <= "011";
    wait for 20ns;
       
    S <= "100";
    wait for 20ns;
    
    S <= "101";
    wait for 20ns;
    
    S <= "110";
    wait for 20ns;
    
    EN <= '0';
    D0 <= "0101";
    D1 <= "0001";
    D2 <= "0110";
    D3 <= "1111";
    D4 <= "0100";
    D5 <= "0010";
    D6 <= "0000";
    D7 <= "1110";
    
    S <= "000";
    wait for 20ns;
    
    S <= "001";
    wait for 20ns;
    
    S <= "010";
    wait for 20ns;
    
    S <= "011";
    wait for 20ns;
       
    S <= "100";
    wait for 20ns;
    
    S <= "101";
    wait for 20ns;
    
    S <= "110";
    wait for 20ns;
    
    EN <= '1';
    D0 <= "1111";
    D1 <= "0001";
    D2 <= "0101";
    D3 <= "1110";
    D4 <= "0100";
    D5 <= "0010";
    D6 <= "0000";
    D7 <= "1110";
    
    S <= "000";
    wait for 20ns;
    
    S <= "001";
    wait for 20ns;
    
    S <= "010";
    wait for 20ns;
    
    S <= "011";
    wait for 20ns;
       
    S <= "100";
    wait for 20ns;
    
    S <= "101";
    wait for 20ns;
    
    S <= "110";
    wait for 20ns;
    wait; 
    end process;
end Behavioral;
