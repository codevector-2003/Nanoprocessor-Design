----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2025 11:19:49 AM
-- Design Name: 
-- Module Name: Multiplexer - Behavioral
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

entity Multiplexer is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Sel : in STD_LOGIC;
           Output : out STD_LOGIC_VECTOR (2 downto 0));
end Multiplexer;

architecture Behavioral of Multiplexer is

begin
    process (A, B, Sel)
        begin
            if EN = '1' then
                if Sel = '0' then
                    Output <= A;
                else
                    Output <= B;
                end if;
            end if;
    end process;
end Behavioral;
